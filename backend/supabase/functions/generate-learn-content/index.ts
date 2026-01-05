import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "@supabase/supabase-js";

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

// Use Gemini API Key (assuming user has it set up as per previous files)
const GEMINI_API_KEY = Deno.env.get("GEMINI_API_KEY");

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

        if (!GEMINI_API_KEY) {
            return new Response(
                JSON.stringify({ error: 'Gemini API Key not configured' }),
                { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        let prompt = '';
        let systemInstruction = '';

        switch (type) {
            case 'audio-script':
                systemInstruction = `You are an expert educational podcaster and teacher. Your goal is to convert technical course material into an engaging, easy-to-digest audio script.
                The script should sound natural when read aloud, using rhetorical questions, clear transitions, and a friendly tone.
                Break down complex topics into simple analogies.
                Structure it as:
                1. Intro (Hook & Overview)
                2. Key Concept 1
                3. Key Concept 2
                4. Key Concept 3 (if applicable)
                5. Review/Summary
                6. Outro`;
                prompt = `Convert the following course summary into a spoken-word lesson script for a student studying ${courseCode || 'this subject'}.
                
                Summary Title: ${title}
                Content:
                ${content.substring(0, 8000)} // Limit context window
                
                Return ONLY the script text, ready to be read.`;
                break;

            case 'quiz':
                systemInstruction = `You are an expert exam creator. create a set of 5 multiple-choice questions based on the provided text.
                Return the result strictly as a valid JSON array of objects.
                Each object must have:
                - question (string)
                - options (array of 4 strings)
                - correctIndex (number, 0-3)
                - explanation (string)`;
                prompt = `Create a 5-question multiple choice quiz based on this content:
                Title: ${title}
                Content:
                ${content.substring(0, 8000)}
                
                IMPORTANT: Return ONLY the JSON array. Do not include markdown formatting like \`\`\`json.`;
                break;

            case 'mindmap':
                systemInstruction = `You are an expert at structuring knowledge. Create a hierarchical node-based mind map structure for the provided content.
                Return the result strictly as a valid JSON object compatible with ReactFlow format, but since you don't calculate positions, just return a hierarchical tree object:
                {
                  "root": {
                    "label": "Main Topic",
                    "children": [
                       { "label": "Subtopic 1", "children": [...] },
                       { "label": "Subtopic 2", "children": [...] }
                    ]
                  }
                }`;
                prompt = `Create a mind map structure for this content:
                Title: ${title}
                Content:
                ${content.substring(0, 8000)}
                
                IMPORTANT: Return ONLY the JSON object. Do not include markdown formatting like \`\`\`json.`;
                break;
        }

        // Call Gemini
        const geminiResponse = await fetch(
            `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=${GEMINI_API_KEY}`,
            {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    contents: [{
                        parts: [{ text: systemInstruction + "\n\n" + prompt }]
                    }],
                    generationConfig: {
                        temperature: 0.7,
                        maxOutputTokens: 2000,
                    }
                }),
            }
        );

        if (!geminiResponse.ok) {
            const err = await geminiResponse.text();
            console.error('Gemini Error:', err);
            throw new Error('Failed to generate content via AI');
        }

        const geminiData = await geminiResponse.json();
        let resultText = geminiData.candidates?.[0]?.content?.parts?.[0]?.text;

        if (!resultText) throw new Error('No content generated');

        // Clean up JSON if needed
        if (type === 'quiz' || type === 'mindmap') {
            resultText = resultText.replace(/```json/g, '').replace(/```/g, '').trim();
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
