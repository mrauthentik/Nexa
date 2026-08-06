import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { encodeBase64 } from "https://deno.land/std@0.224.0/encoding/base64.ts";
import { createClient } from "@supabase/supabase-js";
import { checkRateLimit, RateLimitConfigs, rateLimitedResponse } from "../_shared/rateLimiter.ts";
import { corsHeaders } from "../_shared/corsHeaders.ts";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL") ?? "";
const SUPABASE_SERVICE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "";
const GROQ_API_KEY = Deno.env.get("GROQ_API_KEY");
const ELEVENLABS_API_KEY = Deno.env.get("ELEVENLABS_API_KEY");

// ElevenLabs voice ID — "Rachel" (clear, educational, US English)
const ELEVENLABS_VOICE_ID = "21m00Tcm4TlvDq8ikWAM";
const AUDIO_BUCKET = "audio-modules";

interface KeyPointSection {
    topic: string;
    summary: string;
    keyTakeaways: string[];
    example?: string;
}

interface LearnRequest {
    type: 'audio-script' | 'quiz' | 'mindmap';
    content: string;
    title: string;
    courseCode?: string;
    mode?: 'full' | 'key-points';
    existingKeyPoints?: KeyPointSection[];
}

// ─── Smart Content Sampler ────────────────────────────────────────────────────
const getSmartContent = (text: string, maxChars = 15000): string => {
    if (text.length <= maxChars) return text;

    const introSize = Math.floor(maxChars * 0.15);
    const endSize = Math.floor(maxChars * 0.35);
    const middleSize = maxChars - introSize - endSize;

    const intro = text.substring(0, introSize);
    const midStart = Math.floor(text.length / 2) - Math.floor(middleSize / 2);
    const middle = text.substring(midStart, midStart + middleSize);
    const end = text.substring(text.length - endSize);

    return `[DOCUMENT START — INTRODUCTION]\n${intro}\n\n[... MIDDLE SECTION OMITTED ...]\n\n[DOCUMENT MIDDLE — CORE CONCEPTS]\n${middle}\n\n[... SECTION OMITTED ...]\n\n[DOCUMENT END — CONCLUSIONS & ADVANCED TOPICS]\n${end}`;
};

// ─── Groq API Helper ──────────────────────────────────────────────────────────
const callGroq = async (systemPrompt: string, userPrompt: string, maxTokens = 6000, model = 'llama-3.3-70b-versatile'): Promise<string> => {
    let currentModel = model;
    let attempt = 0;
    const maxAttempts = 3;
    let lastErrorText = "";

    while (attempt < maxAttempts) {
        const response = await fetch('https://api.groq.com/openai/v1/chat/completions', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${GROQ_API_KEY}`,
            },
            body: JSON.stringify({
                model: currentModel,
                messages: [
                    { role: 'system', content: systemPrompt },
                    { role: 'user', content: userPrompt }
                ],
                temperature: 0.7,
                max_tokens: maxTokens,
            }),
        });

        if (response.ok) {
            const data = await response.json();
            const result = data.choices?.[0]?.message?.content;
            if (!result) throw new Error('No content returned from Groq');
            return result;
        }

        const errText = await response.text();
        lastErrorText = errText;

        if (response.status === 429) {
            console.warn(`[Groq Rate Limit] Attempt ${attempt + 1} failed for model ${currentModel}.`);
            
            // 1. Fallback models strategy to avoid long wait times
            if (currentModel === 'llama-3.3-70b-versatile') {
                currentModel = 'llama-3.1-8b-instant';
                console.log(`[Groq Fallback] Switching to lighter model: ${currentModel}`);
                attempt++;
                continue;
            } else if (currentModel === 'llama-3.1-8b-instant' && model !== 'llama-3.1-8b-instant') {
                currentModel = 'mixtral-8x7b-32768';
                console.log(`[Groq Fallback] Switching to model: ${currentModel}`);
                attempt++;
                continue;
            }

            // 2. Wait and retry strategy if no fallbacks remain or we started with a smaller model
            let waitTimeMs = 5000 * Math.pow(2, attempt); 
            try {
                const errJson = JSON.parse(errText);
                const match = errJson?.error?.message?.match(/Please try again in ([\d\.]+)s/);
                if (match && match[1]) {
                    waitTimeMs = parseFloat(match[1]) * 1000 + 1000; // Add 1s buffer
                }
            } catch (e) {
                // Ignore JSON parse errors
            }
            
            console.warn(`[Groq Rate Limit] Waiting ${Math.round(waitTimeMs/1000)}s before retry...`);
            await new Promise(resolve => setTimeout(resolve, waitTimeMs));
            attempt++;
            continue;
        }

        if (response.status >= 500) {
            console.warn(`[Groq Server Error] ${response.status}. Retrying in 2s...`);
            await new Promise(resolve => setTimeout(resolve, 2000));
            attempt++;
            continue;
        }

        throw new Error(`Groq API Error (${response.status}): ${errText.substring(0, 300)}`);
    }
    
    throw new Error(`Groq API Error (429): Rate limit exceeded after retries. Last error: ${lastErrorText.substring(0, 300)}`);
};

// ─── Safe JSON Extractor ──────────────────────────────────────────────────────
// Tries to extract and parse a JSON array from raw AI text — handles markdown fences,
// extra commentary, and partial failures without crashing the whole request.
const safeParseJsonArray = (raw: string): any[] | null => {
    try {
        let cleaned = raw
            .replace(/```json/gi, '')
            .replace(/```/g, '')
            .trim();

        const firstBracket = cleaned.indexOf('[');
        const lastBracket = cleaned.lastIndexOf(']');
        if (firstBracket === -1 || lastBracket === -1) return null;

        cleaned = cleaned.substring(firstBracket, lastBracket + 1);
        const parsed = JSON.parse(cleaned);
        if (!Array.isArray(parsed)) return null;
        return parsed;
    } catch {
        return null;
    }
};

const safeParseJsonObject = (raw: string): Record<string, any> | null => {
    try {
        let cleaned = raw
            .replace(/```json/gi, '')
            .replace(/```/g, '')
            .trim();

        const firstBrace = cleaned.indexOf('{');
        const lastBrace = cleaned.lastIndexOf('}');
        if (firstBrace === -1 || lastBrace === -1) return null;

        cleaned = cleaned.substring(firstBrace, lastBrace + 1);
        const parsed = JSON.parse(cleaned);
        if (typeof parsed !== 'object' || Array.isArray(parsed)) return null;
        return parsed;
    } catch {
        return null;
    }
};

// ─── Stage 1: Key Point Extraction ───────────────────────────────────────────
// Returns extracted key points, or an empty array on failure (never throws).
const extractKeyPoints = async (content: string, title: string, courseCode?: string): Promise<KeyPointSection[]> => {
    try {
        const systemPrompt = `You are an expert academic analyst. Analyze course material and identify the most critical topics a student MUST understand.

Return a JSON array. Each item must be:
{
  "topic": "Short topic name (max 8 words)",
  "summary": "2-3 sentence explanation in simple student-friendly language",
  "keyTakeaways": ["3-5 bullet points of the core facts/rules the student must remember"],
  "example": "A real-world example or analogy (optional)"
}

Rules:
- Extract 5 to 8 key point sections
- Focus on concepts from the MIDDLE and END of the document, not just the intro
- Do NOT use markdown formatting like ** or # anywhere
- Return ONLY the raw JSON array. No markdown fences, no explanation text around it.`;

        const userPrompt = `Extract key educational concepts from this course material:

Course: ${courseCode || 'General'}
Title: ${title}
Content:
${content}

Return only the JSON array.`;

        // Use a faster, lighter model for extraction to save heavy rate limits for generation
        const raw = await callGroq(systemPrompt, userPrompt, 2500, 'llama-3.1-8b-instant');
        const parsed = safeParseJsonArray(raw);

        if (!parsed || parsed.length === 0) {
            console.warn('Key point extraction returned empty or invalid JSON, continuing without key points');
            return [];
        }

        return parsed as KeyPointSection[];
    } catch (err) {
        // Never crash the main request because of key point extraction failure
        console.error('Key point extraction failed (non-fatal):', err);
        return [];
    }
};

// ─── Stage 2A: Full Lecture Script ────────────────────────────────────────────
const generateFullLectureScript = async (content: string, title: string, courseCode?: string): Promise<string> => {
    const systemPrompt = `You are a world-class university professor recording an audio lecture for your students.

Style guidelines:
- Speak directly to the student: use "you", "we", "let us", "imagine"
- Explain every important concept with a clear definition, then an analogy or real-world example
- Use rhetorical questions to stimulate thinking
- Use natural spoken transitions: "Now, moving on to...", "Here is the interesting part...", "Let me break this down..."
- Recap after each major section: "So to summarize what we just covered..."
- End with a strong conclusion that ties everything together
- Do NOT use markdown formatting like **, #, -, *. This will be read by a text-to-speech engine. Write plain text only.

Structure the lecture naturally with an opening hook, core concept sections, and a motivational close.`;

    const userPrompt = `Record an engaging university-level audio lecture on this material.

Course: ${courseCode || 'General'}
Lecture Title: ${title}
Source Material:
${content}

Important: Cover the intro, middle, and concluding topics. Return only the lecture script text — no titles, no headers, just natural flowing speech.`;

    return await callGroq(systemPrompt, userPrompt, 6000);
};

// ─── Stage 2B: Key Points Lecture Script ─────────────────────────────────────
const generateKeyPointsScript = async (keyPoints: KeyPointSection[], title: string, courseCode?: string, fallbackContent?: string): Promise<string> => {

    // If we have key points, use them. Otherwise fall back to a simpler prompt.
    if (keyPoints.length > 0) {
        const keyPointsText = keyPoints.map((kp, i) =>
            `Topic ${i + 1}: ${kp.topic}\nSummary: ${kp.summary}\nKey Takeaways: ${kp.keyTakeaways.join('; ')}${kp.example ? `\nExample: ${kp.example}` : ''}`
        ).join('\n\n');

        const systemPrompt = `You are a sharp educational podcast host creating a focused "Key Concepts" episode.
Goal: Drill the most important concepts so a student can review before an exam.

Style:
- Energetic but clear tone
- Each key point: one-sentence definition, memorable analogy, "remember this" takeaway
- Spoken transitions: "Our first concept is...", "Moving to concept two...", "The crucial thing to remember here..."
- Keep it tight — no long tangents
- End with a rapid-fire recap
- No markdown formatting (no **, #, -, *). Plain text only.`;

        const userPrompt = `Create a focused "Key Concepts" audio episode from these key points:

Course: ${courseCode || 'General'}
Title: ${title}

Key Points:
${keyPointsText}

Return only the script — natural spoken language, no headers, no markdown.`;

        return await callGroq(systemPrompt, userPrompt, 4000);
    }

    // Fallback: extract and narrate key points directly from the content
    const systemPrompt = `You are an educational podcast host. Create a concise "Key Concepts" audio episode covering the most important points from the material.
Style: clear, engaging, spoken English. No markdown (no **, #, *). Plain text only.
Length: 5-8 minutes of spoken content.`;

    const userPrompt = `Create a focused Key Concepts audio episode from this material:
Title: ${title}
Course: ${courseCode || 'General'}
Content:
${fallbackContent || ''}

Return only the script in plain spoken English.`;

    return await callGroq(systemPrompt, userPrompt, 4000);
};

// ─── ElevenLabs TTS → Supabase Storage ──────────────────────────────────────
// Generates TTS audio, uploads it to the 'audio-modules' storage bucket,
// and returns the public URL. Returns null on any failure (always non-throwing).
// This replaces the old approach of returning a base64 data URI, which caused
// massive row bloat when stored in the database (300-500KB per row).
const generateTTSAudio = async (
    text: string,
    userId: string,
    moduleId: string
): Promise<{ url: string | null; storagePath: string | null }> => {
    if (!ELEVENLABS_API_KEY) {
        console.warn('ELEVENLABS_API_KEY not set — skipping TTS, will fall back to Web Speech API on client');
        return { url: null, storagePath: null };
    }

    try {
        // ElevenLabs free tier has character limits — truncate gracefully
        const maxChars = 4500;
        const truncated = text.length > maxChars
            ? text.substring(0, maxChars) + '... This has been a key points preview. The full script is available in the transcript below.'
            : text;

        const ttsResponse = await fetch(`https://api.elevenlabs.io/v1/text-to-speech/${ELEVENLABS_VOICE_ID}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'xi-api-key': ELEVENLABS_API_KEY,
            },
            body: JSON.stringify({
                text: truncated,
                model_id: 'eleven_turbo_v2_5',
                voice_settings: {
                    stability: 0.5,
                    similarity_boost: 0.75,
                    style: 0.3,
                    use_speaker_boost: true,
                }
            }),
        });

        if (!ttsResponse.ok) {
            const err = await ttsResponse.text();
            console.error('ElevenLabs Error:', ttsResponse.status, err.substring(0, 200));
            return { url: null, storagePath: null };
        }

        // Upload audio binary directly to Supabase Storage
        const audioBuffer = await ttsResponse.arrayBuffer();
        const storagePath = `${userId}/${moduleId}.mp3`;

        const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);
        const { error: uploadError } = await supabase.storage
            .from(AUDIO_BUCKET)
            .upload(storagePath, audioBuffer, {
                contentType: 'audio/mpeg',
                upsert: true, // Overwrite on regeneration
            });

        if (uploadError) {
            console.error('Storage upload failed (non-fatal):', uploadError.message);
            // Fall back: return base64 inline for this request only (not stored in DB)
            const base64 = encodeBase64(new Uint8Array(audioBuffer));
            return { url: `data:audio/mpeg;base64,${base64}`, storagePath: null };
        }

        // Get the public URL
        const { data: { publicUrl } } = supabase.storage
            .from(AUDIO_BUCKET)
            .getPublicUrl(storagePath);

        console.log(`Audio uploaded to storage: ${storagePath}`);
        return { url: publicUrl, storagePath };

    } catch (err) {
        console.error('ElevenLabs TTS failed (non-fatal):', err);
        return { url: null, storagePath: null };
    }
};

// ─── Main Handler ─────────────────────────────────────────────────────────────
serve(async (req) => {
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders });
    }

    try {
        // ── Rate Limiting ─────────────────────────────────────────────────────
        // Validate JWT to get the user ID for per-user rate limiting.
        // AI generation is expensive — 10 generations per hour per user.
        const authHeader = req.headers.get('Authorization');
        let rateLimitKey = 'anonymous';

        if (authHeader?.startsWith('Bearer ')) {
            // Decode user ID from JWT payload (no verification needed here,
            // Supabase RLS will reject invalid tokens on any DB operation)
            try {
                const token = authHeader.replace('Bearer ', '');
                const payload = JSON.parse(atob(token.split('.')[1]));
                rateLimitKey = `ai-gen:${payload.sub ?? 'unknown'}`;
            } catch {
                // Fall back to anonymous rate limiting
                rateLimitKey = `ai-gen:${req.headers.get('x-forwarded-for') ?? 'unknown'}`;
            }
        } else {
            // No auth — this will be rejected by DB queries anyway,
            // but still rate-limit unauthenticated probing attempts
            return new Response(
                JSON.stringify({ error: 'Authentication required' }),
                { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        const rateCheck = checkRateLimit(rateLimitKey, RateLimitConfigs.AI_GENERATION);
        if (!rateCheck.allowed) {
            return rateLimitedResponse(corsHeaders, rateCheck.resetAt);
        }

        let body: LearnRequest;
        try {
            body = await req.json();
        } catch {
            return new Response(
                JSON.stringify({ error: 'Invalid JSON in request body' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        const { type, content, title, courseCode, mode = 'full', existingKeyPoints = [] } = body;

        if (!content || !type) {
            return new Response(
                JSON.stringify({ error: 'Missing required fields: content and type' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        if (!GROQ_API_KEY) {
            return new Response(
                JSON.stringify({ error: 'GROQ_API_KEY secret is not configured in Supabase' }),
                { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        const smartContent = getSmartContent(content);

        // ── AUDIO SCRIPT ──────────────────────────────────────────────────────
        if (type === 'audio-script') {
            let keyPoints: KeyPointSection[] = [];
            let script = '';
            let audioUrl: string | null = null;

            if (mode === 'key-points') {
                // Use cached key points if provided (speeds up regeneration)
                if (existingKeyPoints.length > 0) {
                    keyPoints = existingKeyPoints;
                    console.log(`Reusing ${keyPoints.length} cached key points — skipping Stage 1`);
                } else {
                    console.log('Stage 1: Extracting key points...');
                    keyPoints = await extractKeyPoints(smartContent, title, courseCode);
                    console.log(`Stage 1 done: ${keyPoints.length} key points`);
                }

                console.log('Stage 2 (Key Points): Generating script...');
                script = await generateKeyPointsScript(keyPoints, title, courseCode, smartContent);

            } else {
                // Full lecture mode
                // Extract key points for metadata display (non-blocking failure)
                console.log('Stage 1 (Full): Extracting key points for metadata...');
                keyPoints = await extractKeyPoints(smartContent, title, courseCode);

                console.log('Stage 2 (Full Lecture): Generating script...');
                script = await generateFullLectureScript(smartContent, title, courseCode);
            }

            // Stage 3: TTS — always non-blocking, falls back to Web Speech API on client
            console.log('Stage 3: Attempting ElevenLabs TTS with Supabase Storage...');
            // Extract userId from the JWT we already decoded for rate limiting
            const userId = rateLimitKey.replace('ai-gen:', '');
            const moduleId = `${Date.now()}-${Math.random().toString(36).substring(2, 8)}`;
            const ttsResult = await generateTTSAudio(script, userId, moduleId);
            console.log(ttsResult.url ? 'TTS audio generated and uploaded to storage' : 'TTS skipped — client will use Web Speech API');

            const wordCount = script.split(/\s+/).filter(Boolean).length;

            return new Response(
                JSON.stringify({
                    result: script,
                    keyPoints,
                    mode,
                    audioUrl: ttsResult.url,           // Public URL or base64 fallback
                    audio_storage_path: ttsResult.storagePath, // Storage path for saving to DB
                    wordCount,
                }),
                { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );

        }

        // ── QUIZ ──────────────────────────────────────────────────────────────
        if (type === 'quiz') {
            const systemInstruction = `You are an expert exam creator. Create 10 multiple-choice questions from the provided text.
Distribute questions across the full document — not just the intro.
Return a valid JSON array only. Each item: { question, options (4 strings), correctIndex (0-3), explanation }
No markdown fences. No extra text.`;

            const prompt = `Create a 10-question quiz from this content.
Title: ${title}
Content:
${smartContent}

Return ONLY the raw JSON array.`;

            const raw = await callGroq(systemInstruction, prompt, 4000);
            const parsed = safeParseJsonArray(raw);
            if (!parsed) throw new Error('AI returned invalid JSON for quiz. Please try again.');

            return new Response(
                JSON.stringify({ result: parsed }),
                { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        // ── MINDMAP ───────────────────────────────────────────────────────────
        if (type === 'mindmap') {
            const systemInstruction = `You are an expert knowledge organizer. Create a hierarchical mind map for the provided content.
Each node must have: label (short name), summary (2-3 sentences), keypoints (2-4 bullet strings), children (array of same structure).
Return a valid JSON object: { "root": { label, summary, keypoints, children } }
No markdown fences. No extra text.`;

            const prompt = `Create a detailed mind map for this content.
Title: ${title}
Content:
${smartContent}

Return ONLY the raw JSON object.`;

            const raw = await callGroq(systemInstruction, prompt, 4000);
            const parsed = safeParseJsonObject(raw);
            if (!parsed) throw new Error('AI returned invalid JSON for mindmap. Please try again.');

            return new Response(
                JSON.stringify({ result: parsed }),
                { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        return new Response(
            JSON.stringify({ error: `Invalid type: ${type}` }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );

    } catch (error: any) {
        console.error('Unhandled error in generate-learn-content:', error?.message || error);
        return new Response(
            JSON.stringify({ error: error?.message || 'An unexpected error occurred' }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});
