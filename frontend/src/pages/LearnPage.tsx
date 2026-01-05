import { useState, useEffect, useCallback, useMemo } from 'react';
import { useTheme } from '../context/ThemeContext';
import DashboardLayout from '../components/DashboardLayout';
import {
    BookOpen,
    Headphones,
    BrainCircuit,
    Play,
    Pause,
    SkipForward,
    Rewind,
    Sparkles,
    Layout,
    CheckCircle,
    Upload,
    X,
    FileText,
    Loader2,
    Volume2,
    Settings2,
    Zap,
    AlertTriangle,
    Trash,
    Trash2
} from 'lucide-react';
import toast, { Toaster } from 'react-hot-toast';
import { summariesAPI, learnAPI, uploadsAPI } from '../services/api';
import LoadingSpinner from '../components/LoadingSpinner';
import ReactFlow, {
    Background,
    Controls,
    MiniMap,
    useNodesState,
    useEdgesState,
} from 'reactflow';
import 'reactflow/dist/style.css';
import * as pdfjsLib from 'pdfjs-dist';
import pdfWorker from 'pdfjs-dist/build/pdf.worker.min.mjs?url';

// Set worker source for PDF.js
pdfjsLib.GlobalWorkerOptions.workerSrc = pdfWorker;

// Types
interface LearnModule {
    id: string;
    title: string;
    course: string;
    type: 'summary' | 'material' | 'audio-script' | 'quiz' | 'mindmap';
    duration?: string;
    progress: number;
    content: any;
    created_at?: string;
    source_id?: string;
    source_type?: 'summary' | 'upload';
}

interface UserUpload {
    id: string;
    title: string;
    content: string;
    created_at: string;
}

const LearnPage = () => {
    const { isDarkMode } = useTheme();
    const [activeTab, setActiveTab] = useState<'library' | 'player' | 'mindmap' | 'quiz'>('library');
    const [selectedModule, setSelectedModule] = useState<LearnModule | null>(null);
    const [isPlaying, setIsPlaying] = useState(false);
    const [loading, setLoading] = useState(false);
    const [isProcessing, setIsProcessing] = useState(false);
    const [summaries, setSummaries] = useState<any[]>([]);
    const [modules, setModules] = useState<LearnModule[]>([]);
    const [uploads, setUploads] = useState<UserUpload[]>([]);

    // Upload Modal State
    const [showUploadModal, setShowUploadModal] = useState(false);
    const [isDragging, setIsDragging] = useState(false);
    const [uploading, setUploading] = useState(false);

    // React Flow State for Mindmap
    const [nodes, setNodes, onNodesChange] = useNodesState([]);
    const [edges, setEdges, onEdgesChange] = useEdgesState([]);

    // Quiz State
    const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0);
    const [quizScore, setQuizScore] = useState(0);
    const [showQuizResult, setShowQuizResult] = useState(false);
    const [answeredQuestions, setAnsweredQuestions] = useState<{ [key: number]: number }>({});
    const [showExplanation, setShowExplanation] = useState<number | null>(null);
    const [isExplaining, setIsExplaining] = useState(false);
    const [aiExplanation, setAiExplanation] = useState<string | null>(null);

    // Mind Map Node Detail State
    const [selectedNodeData, setSelectedNodeData] = useState<{ label: string; summary?: string; keypoints?: string[] } | null>(null);

    // Memoize ReactFlow types to avoid re-render warnings
    const nodeTypes = useMemo(() => ({}), []);
    const edgeTypes = useMemo(() => ({}), []);

    // Audio Player Professional Controls
    const [speechRate, setSpeechRate] = useState(1.0);
    const [speechPitch, setSpeechPitch] = useState(1.0);
    const [selectedVoice, setSelectedVoice] = useState<SpeechSynthesisVoice | null>(null);
    const [availableVoices, setAvailableVoices] = useState<SpeechSynthesisVoice[]>([]);
    const [showAudioSettings, setShowAudioSettings] = useState(false);

    // Confirmation Modal State
    const [confirmModal, setConfirmModal] = useState<{
        show: boolean;
        title: string;
        message: string;
        onConfirm: () => void;
        type: 'danger' | 'warning' | 'info';
        confirmText?: string;
    }>({
        show: false,
        title: '',
        message: '',
        onConfirm: () => { },
        type: 'info'
    });

    const closeConfirmModal = () => setConfirmModal(prev => ({ ...prev, show: false }));

    // Load available voices
    useEffect(() => {
        const loadVoices = () => {
            const voices = window.speechSynthesis.getVoices();
            // Filter for English voices primarily
            const englishVoices = voices.filter(v => v.lang.startsWith('en'));
            setAvailableVoices(englishVoices.length > 0 ? englishVoices : voices);

            // Set default voice
            if (!selectedVoice && voices.length > 0) {
                const preferred = voices.find(v =>
                    v.name.includes('Google') ||
                    v.name.includes('Samantha') ||
                    v.name.includes('Microsoft')
                );
                setSelectedVoice(preferred || englishVoices[0] || voices[0]);
            }
        };

        loadVoices();
        window.speechSynthesis.onvoiceschanged = loadVoices;
    }, []);

    useEffect(() => {
        fetchData();
    }, []);

    const fetchData = async () => {
        try {
            setLoading(true);
            const [summariesData, modulesData, uploadsData] = await Promise.all([
                summariesAPI.getAll(),
                learnAPI.getModules(),
                uploadsAPI.getAll()
            ]);

            if (summariesData) {
                const data = Array.isArray(summariesData) ? summariesData : (summariesData.data || []);
                setSummaries(data);
            }

            if (uploadsData) {
                setUploads(uploadsData);
            }

            if (modulesData) {
                const mappedModules = modulesData.map((m: any) => ({
                    id: m.id,
                    title: m.title,
                    course: m.course_code || 'General',
                    type: m.content_type === 'audio' ? 'audio-script' : m.content_type,
                    progress: 0,
                    content: m.content,
                    created_at: m.created_at,
                    source_id: m.source_id,
                    source_type: m.source_type
                }));
                setModules(mappedModules);
            }
        } catch (error) {
            console.error("Failed to fetch data", error);
            toast.error("Failed to load library");
        } finally {
            setLoading(false);
        }
    };

    const handleFileUpload = async (file: File) => {
        if (file.type !== 'application/pdf') {
            toast.error('Only PDF files are supported currently.');
            return;
        }

        setUploading(true);
        try {
            // Extract text from PDF
            const arrayBuffer = await file.arrayBuffer();
            const pdf = await pdfjsLib.getDocument({ data: arrayBuffer }).promise;
            let fullText = '';

            for (let i = 1; i <= pdf.numPages; i++) {
                const page = await pdf.getPage(i);
                const textContent = await page.getTextContent();
                const pageText = textContent.items.map((item: any) => item.str).join(' ');
                fullText += pageText + '\n';
            }

            if (!fullText.trim()) {
                throw new Error("Could not extract text from PDF. It might be scanned image.");
            }

            // Upload to DB
            await uploadsAPI.upload(file.name.replace('.pdf', ''), fullText);

            toast.success('File uploaded and processed successfully!');
            setShowUploadModal(false);

            // Refresh uploads
            const newUploads = await uploadsAPI.getAll();
            setUploads(newUploads);

        } catch (error: any) {
            console.error("Upload error", error);
            toast.error(error.message || 'Failed to upload file');
        } finally {
            setUploading(false);
        }
    };

    const onDrop = useCallback((e: React.DragEvent) => {
        e.preventDefault();
        setIsDragging(false);
        const files = e.dataTransfer.files;
        if (files.length > 0) {
            handleFileUpload(files[0]);
        }
    }, []);

    const handleGenerateContent = async (sourceId: string, sourceType: 'summary' | 'upload', type: 'audio-script' | 'quiz' | 'mindmap') => {
        let sourceTitle = '';
        let sourceContent = '';
        let courseCode = 'General';

        if (sourceType === 'summary') {
            const summary = summaries.find(s => s.id === sourceId);
            if (!summary) return;
            sourceTitle = summary.title;
            courseCode = summary.course_code;
            // Build full text
            sourceContent = summary.description || '';
            if (summary.summary_sections) {
                summary.summary_sections.forEach((section: any) => {
                    sourceContent += `\n${section.title}\n`;
                    if (section.summary_topics) {
                        section.summary_topics.forEach((topic: any) => {
                            sourceContent += `${topic.subtitle}: ${topic.content}\n`;
                        });
                    }
                });
            }
        } else {
            const upload = uploads.find(u => u.id === sourceId);
            if (!upload) return;
            sourceTitle = upload.title;
            sourceContent = upload.content;
        }

        setIsProcessing(true);
        let toastId = toast.loading(`Generating ${type.replace('-', ' ')}...`);

        try {
            const data = await learnAPI.generateContent(
                type,
                sourceContent,
                sourceTitle,
                courseCode
            );

            let content = data.result;
            // Parse JSON if needed
            if (type === 'quiz' || type === 'mindmap') {
                if (typeof content === 'string') {
                    try {
                        content = JSON.parse(content);
                    } catch (e) {
                        console.error("Manual parse needed", e);
                    }
                }
            }

            // Save to DB
            const savedModule = await learnAPI.saveModule({
                title: `${sourceTitle} - ${type === 'audio-script' ? 'Audio' : type === 'quiz' ? 'Quiz' : 'Mind Map'}`,
                course_code: courseCode,
                source_type: sourceType,
                source_id: sourceId,
                content_type: type === 'audio-script' ? 'audio' : type,
                content: content
            });

            // Add to local state
            const newModule: LearnModule = {
                id: savedModule.id,
                title: savedModule.title,
                course: savedModule.course_code,
                type: type,
                progress: 0,
                content: content,
                created_at: savedModule.created_at,
                source_id: sourceId,
                source_type: sourceType
            };

            setModules([newModule, ...modules]);
            toast.success(`${type} generated successfully!`, { id: toastId });
            openModule(newModule);

        } catch (error) {
            console.error(error);
            toast.error("Failed to generate content. Please try again.", { id: toastId });
        } finally {
            setIsProcessing(false);
        }
    };

    const openModule = (module: LearnModule) => {
        setSelectedModule(module);
        if (module.type === 'audio-script') {
            setActiveTab('player');
            setIsPlaying(true);
        } else if (module.type === 'mindmap') {
            setupMindMap(module.content);
            setActiveTab('mindmap');
        } else if (module.type === 'quiz') {
            resetQuiz();
            setActiveTab('quiz');
        }
    };

    const resetQuiz = () => {
        setCurrentQuestionIndex(0);
        setQuizScore(0);
        setShowQuizResult(false);
        setAnsweredQuestions({});
        setShowExplanation(null);
        setAiExplanation(null);
    };

    const handleQuizAnswer = (questionIndex: number, selectedOptionIndex: number, correctIndex: number) => {
        // Don't allow re-answering
        if (answeredQuestions[questionIndex] !== undefined) return;

        // Record the answer
        setAnsweredQuestions(prev => ({ ...prev, [questionIndex]: selectedOptionIndex }));

        // Update score if correct
        if (selectedOptionIndex === correctIndex) {
            setQuizScore(s => s + 1);
        }

        // Show explanation section
        setShowExplanation(questionIndex);
        setAiExplanation(null);
    };

    const goToNextQuestion = () => {
        if (selectedModule && currentQuestionIndex < selectedModule.content.length - 1) {
            setCurrentQuestionIndex(c => c + 1);
            setShowExplanation(null);
            setAiExplanation(null);
        } else {
            setShowQuizResult(true);
        }
    };

    const nexaExplainQuiz = async (question: string, options: string[], correctIndex: number, userAnswer: number) => {
        setIsExplaining(true);
        setAiExplanation(null);

        try {
            // Call the Groq AI explain endpoint
            const response = await fetch(`${import.meta.env.VITE_SUPABASE_URL}/functions/v1/ai-explain-answer-groq`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}`
                },
                body: JSON.stringify({
                    question_text: question,
                    options: options,
                    correct_answer: options[correctIndex],
                    user_answer: options[userAnswer],
                    is_correct: userAnswer === correctIndex
                })
            });

            if (!response.ok) throw new Error('Failed to get explanation');

            const data = await response.json();
            setAiExplanation(data.explanation || 'Unable to generate explanation at this time.');
        } catch (error) {
            console.error('Nexa Explain error:', error);
            setAiExplanation('Sorry, I could not generate an explanation right now. Please try again.');
        } finally {
            setIsExplaining(false);
        }
    };

    const handleRegenerate = async (module: LearnModule) => {
        if (!module.source_id || !module.source_type) {
            toast.error("Source information missing. Cannot regenerate.");
            return;
        }

        setConfirmModal({
            show: true,
            title: 'Regenerate Content',
            message: 'This will generate a new version of this content using AI. This may take a few moments. Continue?',
            type: 'info',
            confirmText: 'Regenerate',
            onConfirm: () => {
                handleGenerateContent(module.source_id!, module.source_type!, module.type as any);
                closeConfirmModal();
            }
        });
    };

    const deleteModule = async (id: string) => {
        setConfirmModal({
            show: true,
            title: 'Delete Content',
            message: 'Are you sure you want to delete this generated content? This action cannot be undone.',
            type: 'danger',
            confirmText: 'Delete',
            onConfirm: async () => {
                try {
                    await learnAPI.deleteModule(id);
                    setModules(prev => prev.filter(m => m.id !== id));
                    if (selectedModule?.id === id) {
                        setSelectedModule(null);
                        setActiveTab('library');
                    }
                    toast.success('Content deleted successfully');
                } catch (error) {
                    console.error(error);
                    toast.error('Failed to delete content');
                }
                closeConfirmModal();
            }
        });
    };

    const deleteUpload = async (id: string) => {
        setConfirmModal({
            show: true,
            title: 'Delete Upload',
            message: 'Are you sure you want to delete this uploaded file? This will not delete any modules generated from it, but you won\'t be able to regenerate them from this source. Continue?',
            type: 'danger',
            confirmText: 'Delete',
            onConfirm: async () => {
                try {
                    await uploadsAPI.delete(id);
                    setUploads(prev => prev.filter(u => u.id !== id));
                    toast.success('Upload deleted successfully');
                } catch (error) {
                    console.error(error);
                    toast.error('Failed to delete upload');
                }
                closeConfirmModal();
            }
        });
    };

    /* Mind Map Logic */
    const setupMindMap = (content: any) => {
        const newNodes: any[] = [];
        const newEdges: any[] = [];

        let idCounter = 1;
        const processNode = (dataNode: any, parentId: string | null, x: number, y: number, level: number) => {
            const currentId = `node-${idCounter++}`;

            newNodes.push({
                id: currentId,
                data: {
                    label: dataNode.label,
                    summary: dataNode.summary || '',
                    keypoints: dataNode.keypoints || []
                },
                position: { x, y },
                type: level === 0 ? 'input' : 'default',
                style: {
                    background: isDarkMode ? '#1f2937' : '#fff',
                    color: isDarkMode ? '#fff' : '#000',
                    border: '2px solid #6366f1',
                    borderRadius: '12px',
                    padding: '12px 16px',
                    minWidth: '150px',
                    textAlign: 'center',
                    cursor: 'pointer',
                    boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
                    transition: 'all 0.2s ease'
                }
            });

            if (parentId) {
                newEdges.push({
                    id: `edge-${parentId}-${currentId}`,
                    source: parentId,
                    target: currentId,
                    type: 'smoothstep',
                    animated: true,
                    style: { stroke: '#6366f1', strokeWidth: 2 }
                });
            }

            if (dataNode.children && dataNode.children.length > 0) {
                const width = 280;
                const totalWidth = dataNode.children.length * width;
                let startX = x - totalWidth / 2 + width / 2;

                dataNode.children.forEach((child: any, index: number) => {
                    processNode(child, currentId, startX + (index * width), y + 180, level + 1);
                });
            }
        };

        if (content.root) {
            processNode(content.root, null, 500, 50, 0);
        } else {
            console.warn("Unexpected mindmap structure", content);
        }

        setNodes(newNodes);
        setEdges(newEdges);
        setSelectedNodeData(null); // Reset selection when new map loads
    };

    // Handle node click to show details
    const onNodeClick = (_event: React.MouseEvent, node: any) => {
        if (node.data) {
            setSelectedNodeData({
                label: node.data.label,
                summary: node.data.summary,
                keypoints: node.data.keypoints
            });
        }
    };

    /* Audio Player Logic */
    useEffect(() => {
        let utterance: SpeechSynthesisUtterance | null = null;
        const synth = window.speechSynthesis;

        if (activeTab === 'player' && isPlaying && selectedModule?.type === 'audio-script') {
            synth.cancel();

            const rawText = typeof selectedModule.content === 'string'
                ? selectedModule.content
                : (selectedModule.content.result || "No audio content available.");

            // Clean markdown characters like **, #, -, etc. so the TTS doesn't read them
            const textToRead = rawText
                .replace(/\*\*/g, '') // bold
                .replace(/\*/g, '')   // italic
                .replace(/#/g, '')    // headers
                .replace(/__/g, '')   // underline
                .replace(/`/g, '')    // code
                .trim();

            utterance = new SpeechSynthesisUtterance(textToRead);
            utterance.rate = speechRate;
            utterance.pitch = speechPitch;

            if (selectedVoice) {
                utterance.voice = selectedVoice;
            }

            utterance.onend = () => setIsPlaying(false);
            utterance.onerror = (e) => {
                console.error("Speech error", e);
                setIsPlaying(false);
            };

            synth.speak(utterance);
        } else {
            synth.cancel();
        }

        return () => {
            synth.cancel();
        };
    }, [isPlaying, activeTab, selectedModule, speechRate, speechPitch, selectedVoice]);


    if (loading) return <DashboardLayout currentPage="/learn"><LoadingSpinner /></DashboardLayout>;

    return (
        <DashboardLayout currentPage="/learn">
            <Toaster position="top-center" />

            <div className={`min-h-[80vh] flex flex-col ${isDarkMode ? 'text-gray-100' : 'text-gray-900'} relative`}>

                {/* Header Section */}
                <div className="mb-6 flex items-center justify-between">
                    <div>
                        <h1 className="text-3xl font-bold flex items-center gap-3">
                            <span className="p-2 bg-gradient-to-r from-blue-600 to-purple-600 rounded-lg text-white">
                                <Sparkles size={24} />
                            </span>
                            Learn Your Way
                        </h1>
                        <p className={`mt-2 ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>
                            AI-Powered Personal Learning Environment
                        </p>
                    </div>

                    {activeTab !== 'library' && (
                        <button
                            onClick={() => setActiveTab('library')}
                            className="px-4 py-2 rounded-lg bg-gray-200 dark:bg-gray-700 hover:bg-gray-300 dark:hover:bg-gray-600 transition-colors"
                        >
                            Back to Library
                        </button>
                    )}
                </div>

                {/* Content Area */}
                <div className="flex-1 bg-white dark:bg-gray-900 rounded-2xl shadow-sm border border-gray-200 dark:border-gray-800 overflow-hidden relative min-h-[500px]">

                    {/* LIBRARY VIEW */}
                    {activeTab === 'library' && (
                        <div className="p-6 h-full overflow-y-auto custom-scrollbar">

                            <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">

                                {/* Summary Sources Section */}
                                <div>
                                    <div className="flex justify-between items-center mb-4">
                                        <h2 className="text-lg font-bold flex items-center gap-2">
                                            <BookOpen size={20} className="text-blue-500" />
                                            Library & Uploads
                                        </h2>
                                        <button
                                            onClick={() => setShowUploadModal(true)}
                                            className="px-3 py-1.5 text-sm bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition-colors flex items-center gap-2"
                                        >
                                            <Upload size={16} />
                                            Add New
                                        </button>
                                    </div>

                                    <div className="space-y-4">
                                        {/* User Uploads */}
                                        {uploads.map((upload) => (
                                            <div key={upload.id} className="p-4 rounded-xl border border-gray-200 dark:border-gray-700 hover:border-blue-500 transition-colors bg-blue-50/50 dark:bg-blue-900/20 group relative">
                                                <div className="flex justify-between items-start mb-3">
                                                    <div>
                                                        <h3 className="font-semibold text-base flex items-center gap-2 pr-8">
                                                            <FileText size={16} className="text-blue-500" />
                                                            {upload.title}
                                                        </h3>
                                                        <span className="text-xs text-gray-500">Uploaded {new Date(upload.created_at).toLocaleDateString()}</span>
                                                    </div>
                                                    <button
                                                        onClick={() => deleteUpload(upload.id)}
                                                        className="absolute top-3 right-3 p-1.5 rounded-lg text-gray-400 hover:text-red-500 hover:bg-red-50 dark:hover:bg-red-900/20 opacity-0 group-hover:opacity-100 transition-all z-10"
                                                        title="Delete upload"
                                                    >
                                                        <Trash2 size={16} />
                                                    </button>
                                                </div>
                                                <div className="flex gap-2 mt-2">
                                                    <button
                                                        disabled={isProcessing}
                                                        onClick={() => handleGenerateContent(upload.id, 'upload', 'audio-script')}
                                                        className="flex-1 py-1.5 rounded-lg bg-blue-100 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400 text-xs font-medium hover:bg-blue-200 dark:hover:bg-blue-900/50 transition-colors flex items-center justify-center gap-2 disabled:opacity-50"
                                                    >
                                                        <Headphones size={14} /> Audio
                                                    </button>
                                                    <button
                                                        disabled={isProcessing}
                                                        onClick={() => handleGenerateContent(upload.id, 'upload', 'mindmap')}
                                                        className="flex-1 py-1.5 rounded-lg bg-purple-100 dark:bg-purple-900/30 text-purple-600 dark:text-purple-400 text-xs font-medium hover:bg-purple-200 dark:hover:bg-purple-900/50 transition-colors flex items-center justify-center gap-2 disabled:opacity-50"
                                                    >
                                                        <BrainCircuit size={14} /> Map
                                                    </button>
                                                    <button
                                                        disabled={isProcessing}
                                                        onClick={() => handleGenerateContent(upload.id, 'upload', 'quiz')}
                                                        className="flex-1 py-1.5 rounded-lg bg-orange-100 dark:bg-orange-900/30 text-orange-600 dark:text-orange-400 text-xs font-medium hover:bg-orange-200 dark:hover:bg-orange-900/50 transition-colors flex items-center justify-center gap-2 disabled:opacity-50"
                                                    >
                                                        <Layout size={14} /> Quiz
                                                    </button>
                                                </div>
                                            </div>
                                        ))}

                                        {/* Official Summaries */}
                                        {summaries.map((summary) => (
                                            <div key={summary.id} className="p-4 rounded-xl border border-gray-200 dark:border-gray-700 hover:border-blue-500 transition-colors bg-gray-50 dark:bg-gray-800/50">
                                                <div className="flex justify-between items-start mb-3">
                                                    <div>
                                                        <h3 className="font-semibold text-base">{summary.title}</h3>
                                                        <span className="text-xs font-mono text-gray-500 bg-gray-200 dark:bg-gray-700 px-2 py-0.5 rounded">{summary.course_code}</span>
                                                    </div>
                                                </div>

                                                <div className="flex gap-2 mt-2">
                                                    <button
                                                        disabled={isProcessing}
                                                        onClick={() => handleGenerateContent(summary.id, 'summary', 'audio-script')}
                                                        className="flex-1 py-1.5 rounded-lg bg-blue-100 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400 text-xs font-medium hover:bg-blue-200 dark:hover:bg-blue-900/50 transition-colors flex items-center justify-center gap-2 disabled:opacity-50"
                                                    >
                                                        <Headphones size={14} /> Audio
                                                    </button>
                                                    <button
                                                        disabled={isProcessing}
                                                        onClick={() => handleGenerateContent(summary.id, 'summary', 'mindmap')}
                                                        className="flex-1 py-1.5 rounded-lg bg-purple-100 dark:bg-purple-900/30 text-purple-600 dark:text-purple-400 text-xs font-medium hover:bg-purple-200 dark:hover:bg-purple-900/50 transition-colors flex items-center justify-center gap-2 disabled:opacity-50"
                                                    >
                                                        <BrainCircuit size={14} /> Map
                                                    </button>
                                                    <button
                                                        disabled={isProcessing}
                                                        onClick={() => handleGenerateContent(summary.id, 'summary', 'quiz')}
                                                        className="flex-1 py-1.5 rounded-lg bg-orange-100 dark:bg-orange-900/30 text-orange-600 dark:text-orange-400 text-xs font-medium hover:bg-orange-200 dark:hover:bg-orange-900/50 transition-colors flex items-center justify-center gap-2 disabled:opacity-50"
                                                    >
                                                        <Layout size={14} /> Quiz
                                                    </button>
                                                </div>
                                            </div>
                                        ))}
                                        {summaries.length === 0 && uploads.length === 0 && <p className="text-gray-500 italic">No content available. Add a PDF!</p>}
                                    </div>
                                </div>

                                {/* Generated Modules List */}
                                <div>
                                    <h2 className="text-lg font-bold mb-4 flex items-center gap-2">
                                        <Sparkles size={20} className="text-yellow-500" />
                                        Your AI Library
                                    </h2>
                                    <div className="space-y-3">
                                        {modules.map((module) => (
                                            <div
                                                key={module.id}
                                                className="flex items-center gap-4 p-4 rounded-xl border border-gray-200 dark:border-gray-700 hover:shadow-md bg-white dark:bg-gray-800 transition-all group relative"
                                            >
                                                <div
                                                    onClick={() => openModule(module)}
                                                    className="flex items-center gap-4 flex-1 cursor-pointer"
                                                >
                                                    <div className={`w-12 h-12 rounded-full flex items-center justify-center text-white shadow-lg ${module.type === 'audio-script' ? 'bg-gradient-to-br from-blue-400 to-blue-600' :
                                                        module.type === 'mindmap' ? 'bg-gradient-to-br from-purple-400 to-purple-600' :
                                                            'bg-gradient-to-br from-orange-400 to-orange-600'
                                                        }`}>
                                                        {module.type === 'audio-script' ? <Play size={20} fill="currentColor" className="ml-1" /> :
                                                            module.type === 'mindmap' ? <BrainCircuit size={20} /> : <CheckCircle size={20} />}
                                                    </div>
                                                    <div className="flex-1">
                                                        <h3 className="font-semibold text-gray-900 dark:text-white line-clamp-1 pr-6">{module.title}</h3>
                                                        <p className="text-sm text-gray-500 dark:text-gray-400">
                                                            {new Date(module.created_at || Date.now()).toLocaleDateString()}
                                                        </p>
                                                    </div>
                                                    <div className="text-gray-400">
                                                        <SkipForward size={20} />
                                                    </div>
                                                </div>
                                                <button
                                                    onClick={(e) => { e.stopPropagation(); deleteModule(module.id); }}
                                                    className="absolute top-3 right-3 p-1.5 rounded-lg text-gray-400 hover:text-red-500 hover:bg-red-50 dark:hover:bg-red-900/20 opacity-0 group-hover:opacity-100 transition-all z-10"
                                                    title="Delete"
                                                >
                                                    <Trash2 size={16} />
                                                </button>
                                            </div>
                                        ))}
                                        {modules.length === 0 && <p className="text-gray-500 italic">No AI content generated yet.</p>}
                                    </div>
                                </div>
                            </div>
                        </div>
                    )}

                    {/* PLAYER VIEW */}
                    {activeTab === 'player' && selectedModule && (
                        <div className="h-full flex flex-col items-center justify-center p-8 bg-gradient-to-b from-gray-50 to-white dark:from-gray-900 dark:to-gray-800">
                            <div className="w-full max-w-2xl text-center z-10">
                                {/* Album Art / Visualizer */}
                                <div className="relative w-56 h-56 mx-auto mb-8 group">
                                    <div className={`absolute inset-0 rounded-full bg-blue-500 blur-3xl opacity-20 transition-opacity duration-1000 ${isPlaying ? 'opacity-50 animate-pulse' : ''}`}></div>
                                    <div className={`relative w-full h-full rounded-full bg-gradient-to-tr from-gray-800 to-gray-900 border-4 border-gray-700 shadow-2xl flex items-center justify-center overflow-hidden transition-transform duration-500 ${isPlaying ? 'animate-spin' : ''}`} style={{ animationDuration: '10s' }}>
                                        {/* Visualizer Lines */}
                                        {isPlaying && (
                                            <div className="absolute inset-x-0 bottom-0 h-1/2 flex items-end justify-center gap-1 opacity-50">
                                                {[...Array(10)].map((_, i) => (
                                                    <div key={i} className="w-2 bg-blue-500 rounded-t-full animate-bounce" style={{ height: `${Math.random() * 50 + 20}%`, animationDuration: `${Math.random() * 0.5 + 0.5}s` }}></div>
                                                ))}
                                            </div>
                                        )}
                                        <Headphones size={70} className="text-white relative z-10" />
                                    </div>
                                </div>

                                <h2 className="text-2xl font-bold mb-2 text-gray-900 dark:text-white">{selectedModule.title}</h2>
                                <span className="inline-block px-3 py-1 rounded-full bg-blue-100 dark:bg-blue-900 text-blue-600 dark:text-blue-300 text-sm font-medium mb-6">
                                    {selectedVoice?.name || 'Audio Lesson'}
                                </span>

                                {/* Playback Controls */}
                                <div className="flex items-center justify-center gap-6 mb-6">
                                    <button className="p-3 rounded-full text-gray-400 hover:text-gray-900 dark:hover:text-white hover:bg-gray-100 dark:hover:bg-gray-800 transition-all">
                                        <Rewind size={24} />
                                    </button>
                                    <button
                                        onClick={() => setIsPlaying(!isPlaying)}
                                        className="w-16 h-16 rounded-full bg-blue-600 text-white flex items-center justify-center shadow-lg hover:bg-blue-700 hover:scale-105 active:scale-95 transition-all"
                                    >
                                        {isPlaying ? <Pause size={28} fill="currentColor" /> : <Play size={28} fill="currentColor" className="ml-1" />}
                                    </button>
                                    <button className="p-3 rounded-full text-gray-400 hover:text-gray-900 dark:hover:text-white hover:bg-gray-100 dark:hover:bg-gray-800 transition-all">
                                        <SkipForward size={24} />
                                    </button>
                                    <button
                                        onClick={() => setShowAudioSettings(!showAudioSettings)}
                                        className={`p-3 rounded-full transition-all ${showAudioSettings ? 'bg-blue-100 dark:bg-blue-900 text-blue-600' : 'text-gray-400 hover:text-gray-900 dark:hover:text-white hover:bg-gray-100 dark:hover:bg-gray-800'}`}
                                    >
                                        <Settings2 size={24} />
                                    </button>
                                </div>

                                {/* Audio Settings Panel */}
                                {showAudioSettings && (
                                    <div className="bg-white dark:bg-gray-800 rounded-xl p-5 mb-6 shadow-lg border border-gray-200 dark:border-gray-700 text-left animate-in fade-in duration-200">
                                        <h3 className="text-sm font-semibold text-gray-500 dark:text-gray-400 uppercase tracking-wider mb-4 flex items-center gap-2">
                                            <Volume2 size={16} />
                                            Audio Settings
                                        </h3>

                                        {/* Speed Control */}
                                        <div className="mb-4">
                                            <div className="flex justify-between items-center mb-2">
                                                <label className="text-sm font-medium text-gray-700 dark:text-gray-300">Speed</label>
                                                <span className="text-sm font-bold text-blue-600 dark:text-blue-400">{speechRate.toFixed(1)}x</span>
                                            </div>
                                            <input
                                                type="range"
                                                min="0.5"
                                                max="2"
                                                step="0.1"
                                                value={speechRate}
                                                onChange={(e) => setSpeechRate(parseFloat(e.target.value))}
                                                className="w-full h-2 bg-gray-200 dark:bg-gray-700 rounded-lg appearance-none cursor-pointer accent-blue-600"
                                            />
                                            <div className="flex justify-between text-xs text-gray-400 mt-1">
                                                <span>Slow</span>
                                                <span>Normal</span>
                                                <span>Fast</span>
                                            </div>
                                        </div>

                                        {/* Pitch Control */}
                                        <div className="mb-4">
                                            <div className="flex justify-between items-center mb-2">
                                                <label className="text-sm font-medium text-gray-700 dark:text-gray-300">Pitch</label>
                                                <span className="text-sm font-bold text-blue-600 dark:text-blue-400">{speechPitch.toFixed(1)}</span>
                                            </div>
                                            <input
                                                type="range"
                                                min="0.5"
                                                max="2"
                                                step="0.1"
                                                value={speechPitch}
                                                onChange={(e) => setSpeechPitch(parseFloat(e.target.value))}
                                                className="w-full h-2 bg-gray-200 dark:bg-gray-700 rounded-lg appearance-none cursor-pointer accent-blue-600"
                                            />
                                            <div className="flex justify-between text-xs text-gray-400 mt-1">
                                                <span>Deep</span>
                                                <span>Normal</span>
                                                <span>High</span>
                                            </div>
                                        </div>

                                        {/* Voice Selection */}
                                        <div>
                                            <label className="text-sm font-medium text-gray-700 dark:text-gray-300 mb-2 block">Voice</label>
                                            <select
                                                value={selectedVoice?.name || ''}
                                                onChange={(e) => {
                                                    const voice = availableVoices.find(v => v.name === e.target.value);
                                                    if (voice) setSelectedVoice(voice);
                                                }}
                                                className="w-full px-4 py-2.5 rounded-lg border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                                            >
                                                {availableVoices.map(voice => (
                                                    <option key={voice.name} value={voice.name}>
                                                        {voice.name} ({voice.lang})
                                                    </option>
                                                ))}
                                            </select>
                                        </div>

                                        {/* Quick Presets */}
                                        <div className="mt-4 pt-4 border-t border-gray-200 dark:border-gray-700">
                                            <label className="text-sm font-medium text-gray-700 dark:text-gray-300 mb-2 block">Quick Presets</label>
                                            <div className="flex gap-2 flex-wrap">
                                                <button
                                                    onClick={() => { setSpeechRate(0.8); setSpeechPitch(1.0); }}
                                                    className="flex items-center gap-2 px-3 py-1.5 text-sm bg-gray-100 dark:bg-gray-700 hover:bg-gray-200 dark:hover:bg-gray-600 rounded-lg transition-colors"
                                                >
                                                    <BookOpen size={14} />
                                                    Study Mode
                                                </button>
                                                <button
                                                    onClick={() => { setSpeechRate(1.0); setSpeechPitch(1.0); }}
                                                    className="flex items-center gap-2 px-3 py-1.5 text-sm bg-gray-100 dark:bg-gray-700 hover:bg-gray-200 dark:hover:bg-gray-600 rounded-lg transition-colors"
                                                >
                                                    <Headphones size={14} />
                                                    Normal
                                                </button>
                                                <button
                                                    onClick={() => { setSpeechRate(1.5); setSpeechPitch(1.0); }}
                                                    className="flex items-center gap-2 px-3 py-1.5 text-sm bg-gray-100 dark:bg-gray-700 hover:bg-gray-200 dark:hover:bg-gray-600 rounded-lg transition-colors"
                                                >
                                                    <Zap size={14} />
                                                    Speed Review
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                )}

                                {/* Transcript */}
                                <div className="bg-gray-100 dark:bg-gray-800 rounded-xl p-4 max-h-32 overflow-y-auto text-left text-sm text-gray-600 dark:text-gray-300 font-medium leading-relaxed custom-scrollbar">
                                    <p className="text-xs text-gray-400 mb-2 font-semibold uppercase tracking-wider">Transcript</p>
                                    {typeof selectedModule.content === 'string' ? selectedModule.content : selectedModule.content?.result}
                                </div>
                            </div>
                        </div>
                    )}

                    {/* MIND MAP VIEW */}
                    {activeTab === 'mindmap' && selectedModule && (
                        <div className="flex h-[500px]">
                            {/* Mind Map Canvas */}
                            <div style={{ flex: selectedNodeData ? '1 1 60%' : '1 1 100%', height: '100%' }} className="bg-gray-50 dark:bg-gray-900 transition-all duration-300">
                                <ReactFlow
                                    nodes={nodes}
                                    edges={edges}
                                    onNodesChange={onNodesChange}
                                    onEdgesChange={onEdgesChange}
                                    onNodeClick={onNodeClick}
                                    nodeTypes={nodeTypes}
                                    edgeTypes={edgeTypes}
                                    fitView
                                    attributionPosition="bottom-right"
                                >
                                    <Background color={isDarkMode ? '#333' : '#aaa'} gap={16} />
                                    <Controls />
                                    <MiniMap style={isDarkMode ? { backgroundColor: '#333' } : {}} />
                                </ReactFlow>
                            </div>

                            {/* Node Details Panel */}
                            {selectedNodeData && (
                                <div className="w-[40%] h-full border-l border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-800 p-6 overflow-y-auto animate-in slide-in-from-right duration-300">
                                    <div className="flex justify-between items-start mb-4">
                                        <h3 className="text-xl font-bold text-gray-900 dark:text-white">{selectedNodeData.label}</h3>
                                        <button
                                            onClick={() => setSelectedNodeData(null)}
                                            className="p-2 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg transition-colors"
                                        >
                                            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                                            </svg>
                                        </button>
                                    </div>

                                    {selectedNodeData.summary && (
                                        <div className="mb-6">
                                            <h4 className="text-sm font-semibold text-gray-500 dark:text-gray-400 uppercase tracking-wider mb-2">Summary</h4>
                                            <p className="text-gray-700 dark:text-gray-300 leading-relaxed">
                                                {selectedNodeData.summary}
                                            </p>
                                        </div>
                                    )}

                                    {selectedNodeData.keypoints && selectedNodeData.keypoints.length > 0 && (
                                        <div>
                                            <h4 className="text-sm font-semibold text-gray-500 dark:text-gray-400 uppercase tracking-wider mb-3">Key Points</h4>
                                            <ul className="space-y-3">
                                                {selectedNodeData.keypoints.map((point, idx) => (
                                                    <li key={idx} className="flex items-start gap-3">
                                                        <span className="w-6 h-6 rounded-full bg-blue-100 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400 flex items-center justify-center text-sm font-bold flex-shrink-0">
                                                            {idx + 1}
                                                        </span>
                                                        <span className="text-gray-700 dark:text-gray-300">{point}</span>
                                                    </li>
                                                ))}
                                            </ul>
                                        </div>
                                    )}

                                    {!selectedNodeData.summary && (!selectedNodeData.keypoints || selectedNodeData.keypoints.length === 0) && (
                                        <p className="text-gray-500 italic">No additional details available for this topic.</p>
                                    )}
                                </div>
                            )}
                        </div>
                    )}

                    {/* QUIZ VIEW */}
                    {activeTab === 'quiz' && selectedModule && (
                        <div className="h-full flex items-center justify-center p-6 bg-gray-50 dark:bg-gray-900 overflow-auto">
                            <div className="w-full max-w-3xl bg-white dark:bg-gray-800 rounded-2xl shadow-xl overflow-hidden border border-gray-200 dark:border-gray-700">
                                {showQuizResult ? (
                                    <div className="p-12 text-center">
                                        <div className={`w-24 h-24 rounded-full flex items-center justify-center mx-auto mb-6 ${quizScore >= selectedModule.content.length * 0.7
                                            ? 'bg-green-100 dark:bg-green-900/30 text-green-600 dark:text-green-400'
                                            : quizScore >= selectedModule.content.length * 0.5
                                                ? 'bg-yellow-100 dark:bg-yellow-900/30 text-yellow-600 dark:text-yellow-400'
                                                : 'bg-red-100 dark:bg-red-900/30 text-red-600 dark:text-red-400'
                                            }`}>
                                            <CheckCircle size={48} />
                                        </div>
                                        <h2 className="text-3xl font-bold mb-2">Quiz Completed!</h2>
                                        <p className="text-5xl font-bold mb-2 bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
                                            {quizScore}/{selectedModule.content.length}
                                        </p>
                                        <p className="text-gray-500 mb-8">
                                            {quizScore >= selectedModule.content.length * 0.7
                                                ? "Excellent work! You've mastered this material."
                                                : quizScore >= selectedModule.content.length * 0.5
                                                    ? "Good job! Keep practicing to improve."
                                                    : "Keep studying. You'll get there!"}
                                        </p>
                                        <div className="flex gap-3 justify-center flex-wrap">
                                            <button
                                                onClick={resetQuiz}
                                                className="px-5 py-2.5 bg-blue-600 text-white rounded-xl font-medium hover:bg-blue-700 transition-colors flex items-center gap-2"
                                            >
                                                <Sparkles size={18} />
                                                Retry Quiz
                                            </button>
                                            <button
                                                onClick={() => handleRegenerate(selectedModule)}
                                                className="px-5 py-2.5 bg-purple-600 text-white rounded-xl font-medium hover:bg-purple-700 transition-colors flex items-center gap-2"
                                            >
                                                <Sparkles size={18} />
                                                Regenerate
                                            </button>
                                            <button
                                                onClick={() => setActiveTab('library')}
                                                className="px-5 py-2.5 border border-gray-300 dark:border-gray-600 rounded-xl font-medium hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors"
                                            >
                                                Back to Library
                                            </button>
                                        </div>
                                    </div>
                                ) : (
                                    <div className="p-8">
                                        {/* Header */}
                                        <div className="flex justify-between items-center mb-6">
                                            <div className="flex items-center gap-4">
                                                <span className="text-sm font-medium text-gray-500 uppercase tracking-wider">
                                                    Question {currentQuestionIndex + 1} of {selectedModule.content.length}
                                                </span>
                                                <span className="px-3 py-1 rounded-full bg-green-100 dark:bg-green-900/30 text-green-600 dark:text-green-400 text-xs font-bold">
                                                    Score: {quizScore}
                                                </span>
                                            </div>
                                            <span className="px-3 py-1 rounded-full bg-blue-100 dark:bg-blue-900 text-blue-600 dark:text-blue-300 text-xs font-bold">
                                                AI Generated
                                            </span>
                                        </div>

                                        {/* Question */}
                                        <h3 className="text-xl font-bold mb-6 leading-relaxed">
                                            {selectedModule.content[currentQuestionIndex].question}
                                        </h3>

                                        {/* Options */}
                                        <div className="space-y-3">
                                            {selectedModule.content[currentQuestionIndex].options.map((option: string, idx: number) => {
                                                const isAnswered = answeredQuestions[currentQuestionIndex] !== undefined;
                                                const userAnswer = answeredQuestions[currentQuestionIndex];
                                                const correctIndex = selectedModule.content[currentQuestionIndex].correctIndex;
                                                const isCorrect = idx === correctIndex;
                                                const isUserSelected = userAnswer === idx;

                                                return (
                                                    <button
                                                        key={idx}
                                                        onClick={() => handleQuizAnswer(currentQuestionIndex, idx, correctIndex)}
                                                        disabled={isAnswered}
                                                        className={`w-full text-left p-4 rounded-xl border-2 transition-all font-medium ${isAnswered
                                                            ? isCorrect
                                                                ? 'border-green-500 bg-green-50 dark:bg-green-900/20'
                                                                : isUserSelected
                                                                    ? 'border-red-500 bg-red-50 dark:bg-red-900/20'
                                                                    : 'border-gray-200 dark:border-gray-700 opacity-60'
                                                            : 'border-gray-200 dark:border-gray-700 hover:border-blue-500 dark:hover:border-blue-500 hover:bg-blue-50 dark:hover:bg-blue-900/20'
                                                            }`}
                                                    >
                                                        <div className="flex items-center justify-between">
                                                            <div>
                                                                <span className={`inline-block w-8 font-bold ${isAnswered && isCorrect ? 'text-green-600' :
                                                                    isAnswered && isUserSelected ? 'text-red-600' : 'text-gray-400'
                                                                    }`}>
                                                                    {String.fromCharCode(65 + idx)}.
                                                                </span>
                                                                {option}
                                                            </div>
                                                            {isAnswered && isCorrect && (
                                                                <CheckCircle size={20} className="text-green-600" />
                                                            )}
                                                            {isAnswered && isUserSelected && !isCorrect && (
                                                                <X size={20} className="text-red-600" />
                                                            )}
                                                        </div>
                                                    </button>
                                                );
                                            })}
                                        </div>

                                        {/* Explanation Section - Shows after answering */}
                                        {showExplanation === currentQuestionIndex && (
                                            <div className="mt-6 p-5 rounded-xl bg-gray-50 dark:bg-gray-900 border border-gray-200 dark:border-gray-700">
                                                {/* Built-in Explanation */}
                                                <div className="mb-4">
                                                    <h4 className="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-2">Explanation</h4>
                                                    <p className="text-gray-700 dark:text-gray-300">
                                                        {selectedModule.content[currentQuestionIndex].explanation || 'No explanation provided.'}
                                                    </p>
                                                </div>

                                                {/* Nexa Explain Button */}
                                                {!aiExplanation && (
                                                    <button
                                                        onClick={() => nexaExplainQuiz(
                                                            selectedModule.content[currentQuestionIndex].question,
                                                            selectedModule.content[currentQuestionIndex].options,
                                                            selectedModule.content[currentQuestionIndex].correctIndex,
                                                            answeredQuestions[currentQuestionIndex]
                                                        )}
                                                        disabled={isExplaining}
                                                        className="flex items-center gap-2 px-4 py-2 bg-gradient-to-r from-purple-600 to-blue-600 text-white rounded-lg font-medium hover:opacity-90 transition-all disabled:opacity-50"
                                                    >
                                                        {isExplaining ? (
                                                            <>
                                                                <Loader2 size={16} className="animate-spin" />
                                                                Nexa is thinking...
                                                            </>
                                                        ) : (
                                                            <>
                                                                <Sparkles size={16} />
                                                                Nexa Explain
                                                            </>
                                                        )}
                                                    </button>
                                                )}

                                                {/* AI Explanation */}
                                                {aiExplanation && (
                                                    <div className="mt-4 p-4 bg-gradient-to-r from-purple-50 to-blue-50 dark:from-purple-900/20 dark:to-blue-900/20 rounded-lg border border-purple-200 dark:border-purple-800">
                                                        <div className="flex items-center gap-2 mb-3">
                                                            <Sparkles size={16} className="text-purple-600" />
                                                            <h4 className="text-sm font-bold text-purple-600 dark:text-purple-400">Nexa AI Explanation</h4>
                                                        </div>
                                                        <div className="text-gray-700 dark:text-gray-300 text-sm leading-relaxed space-y-2">
                                                            {aiExplanation.split('\n').map((line, i) => {
                                                                // Handle headers
                                                                if (line.startsWith('### ')) {
                                                                    return <h5 key={i} className="text-base font-bold mt-4 mb-2 text-gray-900 dark:text-white">{line.replace('### ', '')}</h5>;
                                                                }
                                                                if (line.startsWith('## ')) {
                                                                    return <h4 key={i} className="text-lg font-bold mt-5 mb-3 text-gray-900 dark:text-white">{line.replace('## ', '')}</h4>;
                                                                }

                                                                // Handle bold text within lines
                                                                const parts = line.split(/(\*\*.*?\*\*)/g);
                                                                return (
                                                                    <p key={i} className="whitespace-pre-wrap">
                                                                        {parts.map((part, j) => {
                                                                            if (part.startsWith('**') && part.endsWith('**')) {
                                                                                return <strong key={j} className="font-bold text-gray-900 dark:text-white">{part.slice(2, -2)}</strong>;
                                                                            }
                                                                            return part;
                                                                        })}
                                                                    </p>
                                                                );
                                                            })}
                                                        </div>
                                                    </div>
                                                )}

                                                {/* Next Button */}
                                                <div className="mt-6 flex justify-end">
                                                    <button
                                                        onClick={goToNextQuestion}
                                                        className="px-6 py-2.5 bg-blue-600 text-white rounded-xl font-medium hover:bg-blue-700 transition-colors flex items-center gap-2"
                                                    >
                                                        {currentQuestionIndex < selectedModule.content.length - 1 ? 'Next Question' : 'See Results'}
                                                        <SkipForward size={18} />
                                                    </button>
                                                </div>
                                            </div>
                                        )}
                                    </div>
                                )}

                                {/* Progress Bar */}
                                <div className="h-2 bg-gray-100 dark:bg-gray-700 w-full">
                                    <div
                                        className="h-full bg-gradient-to-r from-blue-500 to-purple-500 transition-all duration-300"
                                        style={{ width: `${((currentQuestionIndex + (answeredQuestions[currentQuestionIndex] !== undefined ? 1 : 0)) / selectedModule.content.length) * 100}%` }}
                                    ></div>
                                </div>
                            </div>
                        </div>
                    )}

                </div>
            </div>

            {/* UPLOAD MODAL */}
            {showUploadModal && (
                <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/60 backdrop-blur-sm animate-in fade-in duration-200">
                    <div className="bg-white dark:bg-gray-900 rounded-2xl w-full max-w-xl p-6 shadow-2xl border border-gray-200 dark:border-gray-700 relative">
                        <button
                            onClick={() => setShowUploadModal(false)}
                            className="absolute top-4 right-4 p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors"
                        >
                            <X size={20} />
                        </button>

                        <h2 className="text-2xl font-bold mb-2">Upload Material</h2>
                        <p className="text-gray-500 dark:text-gray-400 mb-6">Upload a PDF to generate podcasts, quizzes, and mind maps.</p>

                        <div
                            onDragOver={(e) => { e.preventDefault(); setIsDragging(true); }}
                            onDragLeave={() => setIsDragging(false)}
                            onDrop={onDrop}
                            className={`border-2 border-dashed rounded-xl p-10 flex flex-col items-center justify-center text-center transition-all ${isDragging
                                ? 'border-blue-500 bg-blue-50 dark:bg-blue-900/20 scale-[1.02]'
                                : 'border-gray-300 dark:border-gray-700'
                                }`}
                        >
                            {uploading ? (
                                <div className="text-center">
                                    <Loader2 size={48} className="animate-spin text-blue-600 mb-4 mx-auto" />
                                    <p className="font-medium animate-pulse">Extracting text from PDF...</p>
                                </div>
                            ) : (
                                <>
                                    <div className="w-20 h-20 bg-blue-100 dark:bg-blue-900/30 rounded-full flex items-center justify-center mb-6 text-blue-600 dark:text-blue-400">
                                        <FileText size={40} />
                                    </div>
                                    <h3 className="text-xl font-semibold mb-2">Drag & Drop your PDF here</h3>
                                    <p className="text-gray-500 mb-6">or click to browse from your device</p>

                                    <label className="cursor-pointer px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white rounded-xl font-medium transition-colors shadow-lg shadow-blue-500/30">
                                        Browse Files
                                        <input
                                            type="file"
                                            accept=".pdf"
                                            className="hidden"
                                            onChange={(e) => e.target.files && e.target.files.length > 0 && handleFileUpload(e.target.files[0])}
                                        />
                                    </label>
                                </>
                            )}
                        </div>

                        <div className="mt-6 flex items-start gap-3 p-4 bg-gray-50 dark:bg-gray-800/50 rounded-lg text-sm text-gray-500">
                            <Sparkles size={16} className="mt-0.5 text-yellow-500" />
                            <p>Our AI will analyze your document and create personalized learning content instantly.</p>
                        </div>
                    </div>
                </div>
            )}

            {/* CONFIRMATION MODAL */}
            {confirmModal.show && (
                <div className="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-black/60 backdrop-blur-sm animate-in fade-in duration-200">
                    <div className="bg-white dark:bg-gray-900 rounded-2xl w-full max-w-md p-6 shadow-2xl border border-gray-200 dark:border-gray-700 animate-in zoom-in-95 duration-200">
                        <div className="flex items-center gap-4 mb-6">
                            <div className={`w-12 h-12 rounded-full flex items-center justify-center shrink-0 ${confirmModal.type === 'danger'
                                ? 'bg-red-100 dark:bg-red-900/30 text-red-600 dark:text-red-400'
                                : confirmModal.type === 'warning'
                                    ? 'bg-yellow-100 dark:bg-yellow-900/30 text-yellow-600 dark:text-yellow-400'
                                    : 'bg-blue-100 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400'
                                }`}>
                                {confirmModal.type === 'danger' ? <Trash size={24} /> : <AlertTriangle size={24} />}
                            </div>
                            <div>
                                <h3 className="text-xl font-bold text-gray-900 dark:text-white">{confirmModal.title}</h3>
                                <p className="text-gray-500 dark:text-gray-400 text-sm mt-1">{confirmModal.message}</p>
                            </div>
                        </div>

                        <div className="flex gap-3 justify-end">
                            <button
                                onClick={closeConfirmModal}
                                className="px-4 py-2 rounded-xl font-medium text-gray-600 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors"
                            >
                                Cancel
                            </button>
                            <button
                                onClick={confirmModal.onConfirm}
                                className={`px-6 py-2 rounded-xl font-medium text-white shadow-lg transition-all active:scale-95 ${confirmModal.type === 'danger'
                                    ? 'bg-red-600 hover:bg-red-700 shadow-red-500/20'
                                    : 'bg-blue-600 hover:bg-blue-700 shadow-blue-500/20'
                                    }`}
                            >
                                {confirmModal.confirmText || 'Confirm'}
                            </button>
                        </div>
                    </div>
                </div>
            )}
        </DashboardLayout>
    );
};

export default LearnPage;
