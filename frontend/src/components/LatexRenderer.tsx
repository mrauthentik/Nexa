import { useEffect, useRef } from 'react';
import katex from 'katex';
import 'katex/dist/katex.min.css';

interface LatexRendererProps {
  content: string;
  className?: string;
}

/**
 * Renders text with LaTeX mathematical notation
 * Supports both inline ($...$) and display ($$...$$) math
 * Also converts common LaTeX symbols to readable format
 */
const LatexRenderer = ({ content, className = '' }: LatexRendererProps) => {
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!containerRef.current || !content) return;

    try {
      // Process the content to render LaTeX
      const processedContent = renderLatex(content);
      containerRef.current.innerHTML = processedContent;
    } catch (error) {
      console.error('Error rendering LaTeX:', error);
      // Fallback to plain text if rendering fails
      containerRef.current.textContent = content;
    }
  }, [content]);

  return <div ref={containerRef} className={className} />;
};

/**
 * Processes text and renders LaTeX expressions
 */
function renderLatex(text: string): string {
  if (!text) return '';

  // Replace display math ($$...$$)
  text = text.replace(/\$\$(.*?)\$\$/g, (match, latex) => {
    try {
      return katex.renderToString(latex, { displayMode: true, throwOnError: false });
    } catch (e) {
      return match;
    }
  });

  // Replace inline math ($...$)
  text = text.replace(/\$(.*?)\$/g, (match, latex) => {
    try {
      return katex.renderToString(latex, { displayMode: false, throwOnError: false });
    } catch (e) {
      return match;
    }
  });

  return text;
}

/**
 * Utility function to convert LaTeX to plain English (for accessibility)
 */
export function latexToPlainText(text: string): string {
  if (!text) return '';

  const replacements: Record<string, string> = {
    '\\vee': ' OR ',
    '\\wedge': ' AND ',
    '\\neg': ' NOT ',
    '\\Rightarrow': ' implies ',
    '\\Leftrightarrow': ' if and only if ',
    '\\forall': ' for all ',
    '\\exists': ' there exists ',
    '\\in': ' in ',
    '\\notin': ' not in ',
    '\\subset': ' subset of ',
    '\\cup': ' union ',
    '\\cap': ' intersection ',
    '\\emptyset': ' empty set ',
    '\\infty': ' infinity ',
    '\\leq': ' ≤ ',
    '\\geq': ' ≥ ',
    '\\neq': ' ≠ ',
    '\\approx': ' ≈ ',
    '\\equiv': ' ≡ ',
    '\\times': ' × ',
    '\\div': ' ÷ ',
    '\\pm': ' ± ',
    '\\sum': ' sum ',
    '\\prod': ' product ',
    '\\int': ' integral ',
    '\\partial': ' partial ',
    '\\nabla': ' nabla ',
    '\\sqrt': ' square root of ',
    '\\alpha': 'α',
    '\\beta': 'β',
    '\\gamma': 'γ',
    '\\delta': 'δ',
    '\\theta': 'θ',
    '\\lambda': 'λ',
    '\\pi': 'π',
    '\\sigma': 'σ',
    '\\omega': 'ω',
  };

  let result = text;

  // Remove $ delimiters
  result = result.replace(/\$\$/g, '');
  result = result.replace(/\$/g, '');

  // Replace LaTeX commands
  for (const [latex, plain] of Object.entries(replacements)) {
    result = result.replace(new RegExp(latex.replace(/\\/g, '\\\\'), 'g'), plain);
  }

  return result;
}

/**
 * Check if text contains LaTeX
 */
export function containsLatex(text: string): boolean {
  return /\$.*?\$/.test(text);
}

export default LatexRenderer;
