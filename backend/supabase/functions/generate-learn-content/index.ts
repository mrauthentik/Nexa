import { serve } from "https://deno.land/std@0.168.0/http/server.ts";

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

// Use Groq API Key
const GROQ_API_KEY = Deno.env.get("GROQ_API_KEY");

interface LearnRequest {
    type: 'audio-script' | 'quiz' | 'mindmap';
    content: string; // The source text (summary content)
    title: string;
    courseCode?: string;
}

serve(async (req) => {
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders });
    }

    try {
        const { type, content, title, courseCode } = await req.json();

        if (!content || !type) {
            return new Response(
                JSON.stringify({ error: 'Missing content or type' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        if (!GROQ_API_KEY) {
            return new Response(
                JSON.stringify({ error: 'Groq API Key not configured' }),
                { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        let prompt = '';
        let systemInstruction = '';

        // Smart content sampler to handle large PDFs and focus on middle/end
        const getSmartContent = (text: string, maxChars: number = 40000): string => {
            if (text.length <= maxChars) return text;

            // If text is very long, we sample it: 15% beginning, 50% middle, 35% end
            const introSize = Math.floor(maxChars * 0.15);
            const endSize = Math.floor(maxChars * 0.35);
            const middleSize = maxChars - introSize - endSize;

            const intro = text.substring(0, introSize);
            const midStart = Math.floor(text.length / 2) - Math.floor(middleSize / 2);
            const middle = text.substring(midStart, midStart + middleSize);
            const end = text.substring(text.length - endSize);

            return `[DOCUMENT START - INTRODUCTION]\n${intro}\n\n[... SECTION OMITTED ...]\n\n[DOCUMENT MIDDLE - CORE CONCEPTS]\n${middle}\n\n[... SECTION OMITTED ...]\n\n[DOCUMENT END - CONCLUSIONS & ADVANCED TOPICS]\n${end}`;
        };

        const smartContent = getSmartContent(content);

        switch (type) {
            case 'audio-script':
                systemInstruction = `You are an expert educational podcaster and teacher. Your goal is to convert technical course material into an engaging, easy-to-digest audio script.
                The script should sound natural when read aloud, using rhetorical questions, clear transitions, and a friendly tone.
                Break down complex topics into simple analogies.
                Ensure you cover the entire document, especially the core concepts found in the middle and the concluding sections.
                Structure it as:
                1. Intro (Hook & Overview)
                2. Key Concept 1 (Initial concepts)
                3. Key Concept 2 (Core middle concepts)
                4. Key Concept 3 (Advanced/Final concepts)
                5. Review/Summary
                6. Outro`;
                prompt = `Convert the following course material into a spoken-word lesson script for a student studying ${courseCode || 'this subject'}.
                
                Summary Title: ${title}
                Content (Samples from across the document):
                ${smartContent} 
                
                IMPORTANT: Do not just focus on the introduction. Make sure to pull key insights from the middle and final sections of the provided text.
                Return ONLY the script text, ready to be read.`;
                break;

            case 'quiz':
                systemInstruction = `You are an expert exam creator. Create a set of 10 multiple-choice questions based on the provided text.
                Ensure the questions are distributed across the material. Do NOT just focus on the beginning/intro.
                Pay special attention to the middle and latter sections of the document to test deeper understanding.
                Return the result strictly as a valid JSON array of objects.
                Each object must have:
                - question (string)
                - options (array of 4 strings)
                - correctIndex (number, 0-3)
                - explanation (string explaining why the correct answer is right)`;
                prompt = `Create a 10-question multiple choice quiz based on this content:
                Title: ${title}
                Content (Samples from across the document):
                ${smartContent}
                
                IMPORTANT: I want a comprehensive quiz. Please select questions from the middle and end of the document, as well as the start. 
                Return ONLY the JSON array. Do not include markdown formatting like \`\`\`json.`;
                break;

            case 'mindmap':
                systemInstruction = `You are an expert at structuring knowledge. Create a hierarchical node-based mind map structure for the provided content.
                Ensure you capture the full depth of the document, including the foundational intro, the detailed middle, and the concluding advanced topics.
                Each node MUST include:
                - label: The topic name (short)
                - summary: A 2-3 sentence summary explaining this topic in simple terms
                - keypoints: An array of 2-4 key bullet points about this topic
                - children: An array of child nodes (same structure)
                
                Return the result strictly as a valid JSON object:
                {
                  "root": {
                    "label": "Main Topic",
                    "summary": "...",
                    "keypoints": [...],
                    "children": [...]
                  }
                }`;
                prompt = `Create a detailed mind map structure for this content. 
                Title: ${title}
                Content (Samples from across the document):
                ${smartContent}
                
                IMPORTANT: Ensure the mind map reflects the entire document's structure, especially the middle and final topics.
                Return ONLY the JSON object. Do not include markdown formatting like \`\`\`json.`;
                break;
        }

        // Call Groq API
        const groqResponse = await fetch('https://api.groq.com/openai/v1/chat/completions', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${GROQ_API_KEY}`,
            },
            body: JSON.stringify({
                model: 'llama-3.1-8b-instant',
                messages: [
                    { role: 'system', content: systemInstruction },
                    { role: 'user', content: prompt }
                ],
                temperature: 0.7,
                max_tokens: 2000,
            }),
        });

        if (!groqResponse.ok) {
            const err = await groqResponse.text();
            console.error('Groq Error:', err);
            throw new Error('Failed to generate content via Groq AI');
        }

        const groqData = await groqResponse.json();
        let resultText = groqData.choices[0]?.message?.content;

        if (!resultText) throw new Error('No content generated');

        // Clean up JSON if needed
        if (type === 'quiz' || type === 'mindmap') {
            resultText = resultText.replace(/```json/g, '').replace(/```/g, '').trim();
            // Handle cases where the AI adds extra text before or after the JSON
            const firstBracket = resultText.indexOf(type === 'quiz' ? '[' : '{');
            const lastBracket = resultText.lastIndexOf(type === 'quiz' ? ']' : '}');

            if (firstBracket !== -1 && lastBracket !== -1) {
                resultText = resultText.substring(firstBracket, lastBracket + 1);
            }

            try {
                // Validate JSON
                JSON.parse(resultText);
            } catch (e) {
                console.error("Invalid JSON content", resultText);
                throw new Error("AI returned invalid JSON format");
            }
        }

        return new Response(
            JSON.stringify({ result: resultText }),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );

    } catch (error) {
        console.error('Error:', error);
        return new Response(
            JSON.stringify({ error: error.message }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});
