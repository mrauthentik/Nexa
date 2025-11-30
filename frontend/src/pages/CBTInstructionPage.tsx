import { useState, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { useTheme } from '../context/ThemeContext';
import supabase from '../supabaseClient';
import { courseQuestionsAPI } from '../services/api';
import toast, { Toaster } from 'react-hot-toast';
import { Clock, FileText, AlertCircle, Play, ArrowLeft } from 'lucide-react';

interface Course {
  id: string;
  code: string;
  title: string;
  credits: number;
  department: string;
  level: string;
}

const CBTInstructionPage = () => {
  const { isDarkMode } = useTheme();
  const navigate = useNavigate();
  const { courseId } = useParams();
  
  const [course, setCourse] = useState<Course | null>(null);
  const [loading, setLoading] = useState(true);
  const [questionCount, setQuestionCount] = useState(20);
  const [timeLimit, setTimeLimit] = useState(30);
  const [agreedToTerms, setAgreedToTerms] = useState(false);
  const [availableQuestions, setAvailableQuestions] = useState(0);

  useEffect(() => {
    if (courseId) {
      fetchCourseDetails();
      fetchAvailableQuestions();
    }
  }, [courseId]);

  const fetchCourseDetails = async () => {
    try {
      const { data, error } = await supabase
        .from('courses')
        .select('*')
        .eq('id', courseId)
        .single();

      if (error) throw error;
      setCourse(data);
    } catch (error: any) {
      toast.error('Failed to load course details');
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  const fetchAvailableQuestions = async () => {
    try {
      // Use the API endpoint to get question count
      const response = await courseQuestionsAPI.getQuestionCount(courseId!);
      
      if (response.error) {
        console.error('Error fetching question count:', response.error);
        setAvailableQuestions(0);
        return;
      }
      
      setAvailableQuestions(response.count || 0);
    } catch (error: any) {
      console.error('Error fetching question count:', error);
      setAvailableQuestions(0);
    }
  };

  const handleStartTest = () => {
    if (!agreedToTerms) {
      toast.error('Please agree to the test instructions');
      return;
    }

    if (availableQuestions === 0) {
      toast.error('No questions available for this course yet');
      return;
    }

    if (questionCount > availableQuestions) {
      toast.error(`Only ${availableQuestions} questions available`);
      return;
    }

    // Navigate to test page with settings
    navigate(`/cbt/test/${courseId}`, {
      state: {
        questionCount,
        timeLimit,
        course
      }
    });
  };

  if (loading) {
    return (
      <div className={`min-h-screen flex items-center justify-center ${isDarkMode ? 'bg-gray-900' : 'bg-gray-50'}`}>
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600 mx-auto"></div>
          <p className={`mt-4 ${isDarkMode ? 'text-gray-300' : 'text-gray-600'}`}>Loading course...</p>
        </div>
      </div>
    );
  }

  if (!course) {
    return (
      <div className={`min-h-screen flex items-center justify-center ${isDarkMode ? 'bg-gray-900' : 'bg-gray-50'}`}>
        <div className="text-center">
          <p className={`text-xl ${isDarkMode ? 'text-gray-300' : 'text-gray-600'}`}>Course not found</p>
          <button
            onClick={() => navigate('/cbt')}
            className="mt-4 px-6 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700"
          >
            Back to Courses
          </button>
        </div>
      </div>
    );
  }

  return (
    <>
      <Toaster position="top-center" reverseOrder={false} />
      <div className={`min-h-screen ${isDarkMode ? 'bg-gray-900' : 'bg-gray-50'}`}>
        {/* Header */}
        <header className={`${isDarkMode ? 'bg-gray-800 border-gray-700' : 'bg-white border-gray-200'} border-b sticky top-0 z-50 backdrop-blur-sm bg-opacity-95`}>
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-3 sm:py-4">
            <div className="flex items-center justify-between">
              <button
                onClick={() => navigate('/cbt')}
                className={`flex items-center gap-2 px-3 py-2 rounded-lg transition-colors ${isDarkMode ? 'text-gray-300 hover:text-white hover:bg-gray-700' : 'text-gray-600 hover:text-gray-900 hover:bg-gray-100'}`}
              >
                <ArrowLeft size={18} className="sm:w-5 sm:h-5" />
                <span className="text-sm sm:text-base font-medium">Back to Courses</span>
              </button>
              <div className="flex items-center gap-2">
                <div className="w-7 h-7 sm:w-8 sm:h-8 bg-gradient-to-br from-primary-600 to-primary-700 rounded-lg flex items-center justify-center shadow-md">
                  <span className="text-white font-bold text-sm sm:text-base">N</span>
                </div>
                <span className={`text-lg sm:text-xl font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>NEXA</span>
              </div>
            </div>
          </div>
        </header>

        {/* Main Content */}
        <main className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-6 sm:py-8 lg:py-12">
          {/* Course Info Card - Modern Professional Design */}
          <div className={`relative overflow-hidden ${isDarkMode ? 'bg-gradient-to-br from-gray-800 via-gray-850 to-gray-900' : 'bg-gradient-to-br from-white via-gray-50 to-blue-50'} rounded-3xl shadow-2xl mb-8`}>
            {/* Decorative Background Elements */}
            <div className="absolute top-0 right-0 w-64 h-64 bg-primary-500/10 rounded-full blur-3xl"></div>
            <div className="absolute bottom-0 left-0 w-48 h-48 bg-blue-500/10 rounded-full blur-3xl"></div>
            
            <div className="relative p-6 sm:p-8 lg:p-10">
              {/* Header Section */}
              <div className="flex flex-col lg:flex-row lg:items-start lg:justify-between gap-6 mb-8">
                <div className="flex-1 space-y-4">
                  {/* Course Title */}
                  <div>
                    <h1 className={`text-2xl sm:text-3xl lg:text-4xl font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'} leading-tight mb-3`}>
                      {course.title}
                    </h1>
                    <p className={`text-sm sm:text-base ${isDarkMode ? 'text-gray-400' : 'text-gray-600'} max-w-2xl`}>
                      Prepare yourself for this comprehensive assessment. Review the configuration and instructions carefully before starting.
                    </p>
                  </div>
                  
                  {/* Course Meta Information */}
                  <div className="flex flex-wrap items-center gap-3">
                    {/* Course Code Badge */}
                    <div className={`inline-flex items-center gap-2 px-4 py-2 rounded-xl ${isDarkMode ? 'bg-primary-900/40 border border-primary-700/50' : 'bg-primary-50 border border-primary-200'} backdrop-blur-sm`}>
                      <div className={`w-2 h-2 rounded-full ${isDarkMode ? 'bg-gray-400' : 'bg-primary-600'} animate-pulse`}></div>
                      <span className={`text-sm font-bold ${isDarkMode ? 'text-white' : 'text-primary-700'} tracking-wide`}>
                        {course.code}
                      </span>
                    </div>
                    
                    {/* Level Badge */}
                    <div className={`inline-flex items-center gap-2 px-4 py-2 rounded-xl ${isDarkMode ? 'bg-blue-900/30 border border-blue-700/50' : 'bg-blue-50 border border-blue-200'}`}>
                      <svg className={`w-4 h-4 ${isDarkMode ? 'text-blue-400' : 'text-blue-600'}`} fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
                      </svg>
                      <span className={`text-sm font-semibold ${isDarkMode ? 'text-blue-300' : 'text-blue-700'}`}>
                        {course.level}
                      </span>
                    </div>
                    
                    {/* Department Badge */}
                    <div className={`inline-flex items-center gap-2 px-4 py-2 rounded-xl ${isDarkMode ? 'bg-purple-900/30 border border-purple-700/50' : 'bg-purple-50 border border-purple-200'}`}>
                      <svg className={`w-4 h-4 ${isDarkMode ? 'text-purple-400' : 'text-purple-600'}`} fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                      </svg>
                      <span className={`text-sm font-semibold ${isDarkMode ? 'text-purple-300' : 'text-purple-700'}`}>
                        {course.department}
                      </span>
                    </div>
                  </div>
                </div>
                
                {/* Questions Available Card */}
                <div className={`${isDarkMode ? 'bg-gradient-to-br from-green-900/40 to-emerald-900/40 border-green-700/50' : 'bg-gradient-to-br from-green-50 to-emerald-50 border-green-200'} border rounded-2xl p-5 sm:p-6 shadow-lg backdrop-blur-sm min-w-[200px]`}>
                  <div className="flex items-center gap-3 mb-2">
                    <div className={`w-10 h-10 rounded-xl ${isDarkMode ? 'bg-green-800/50' : 'bg-green-100'} flex items-center justify-center`}>
                      <FileText size={20} className={isDarkMode ? 'text-green-400' : 'text-green-600'} />
                    </div>
                    <div>
                      <p className={`text-xs font-medium ${isDarkMode ? 'text-green-400/80' : 'text-green-700/80'} uppercase tracking-wider`}>
                        Available
                      </p>
                      <p className={`text-3xl font-bold ${isDarkMode ? 'text-green-400' : 'text-green-600'} leading-none`}>
                        {availableQuestions}
                      </p>
                    </div>
                  </div>
                  <p className={`text-xs ${isDarkMode ? 'text-green-300/60' : 'text-green-700/70'} mt-2`}>
                    Questions in question bank
                  </p>
                </div>
              </div>
              
              {/* Quick Stats Bar */}
              <div className={`grid grid-cols-2 sm:grid-cols-3 gap-4 p-4 sm:p-5 rounded-2xl ${isDarkMode ? 'bg-gray-800/50 border border-gray-700/50' : 'bg-white/60 border border-gray-200/50'} backdrop-blur-sm`}>
                <div className="flex items-center gap-3">
                  <div className={`w-10 h-10 rounded-lg ${isDarkMode ? 'bg-orange-900/30' : 'bg-orange-100'} flex items-center justify-center`}>
                    <Clock size={18} className={isDarkMode ? 'text-orange-400' : 'text-orange-600'} />
                  </div>
                  <div>
                    <p className={`text-xs ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>Duration</p>
                    <p className={`text-sm font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>Flexible</p>
                  </div>
                </div>
                
                <div className="flex items-center gap-3">
                  <div className={`w-10 h-10 rounded-lg ${isDarkMode ? 'bg-indigo-900/30' : 'bg-indigo-100'} flex items-center justify-center`}>
                    <svg className={`w-5 h-5 ${isDarkMode ? 'text-indigo-400' : 'text-indigo-600'}`} fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                  </div>
                  <div>
                    <p className={`text-xs ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>Pass Mark</p>
                    <p className={`text-sm font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>50%</p>
                  </div>
                </div>
                
                <div className="flex items-center gap-3 col-span-2 sm:col-span-1">
                  <div className={`w-10 h-10 rounded-lg ${isDarkMode ? 'bg-pink-900/30' : 'bg-pink-100'} flex items-center justify-center`}>
                    <svg className={`w-5 h-5 ${isDarkMode ? 'text-pink-400' : 'text-pink-600'}`} fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                    </svg>
                  </div>
                  <div>
                    <p className={`text-xs ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>Credits</p>
                    <p className={`text-sm font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>{course.credits} Units</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* Test Configuration - Modern Design */}
          <div className={`${isDarkMode ? 'bg-gradient-to-br from-gray-800 to-gray-900' : 'bg-gradient-to-br from-white to-gray-50'} rounded-2xl shadow-xl p-8 mb-6 border ${isDarkMode ? 'border-gray-700' : 'border-gray-100'}`}>
            <div className="flex items-center gap-3 mb-8">
              <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-primary-500 to-primary-600 flex items-center justify-center shadow-lg">
                <FileText size={20} className="text-white" />
              </div>
              <h2 className={`text-2xl font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>
                Customize Your Test
              </h2>
            </div>

            <div className="grid md:grid-cols-2 gap-6">
              {/* Number of Questions Card */}
              <div className={`${isDarkMode ? 'bg-gray-800/50' : 'bg-white'} rounded-xl p-6 border ${isDarkMode ? 'border-gray-700' : 'border-gray-200'} shadow-sm hover:shadow-md transition-shadow`}>
                <div className="flex items-center justify-between mb-4">
                  <div className="flex items-center gap-3">
                    <div className={`w-12 h-12 rounded-lg ${isDarkMode ? 'bg-blue-900/30' : 'bg-blue-50'} flex items-center justify-center`}>
                      <FileText size={24} className={isDarkMode ? 'text-blue-400' : 'text-blue-600'} />
                    </div>
                    <div>
                      <h3 className={`font-semibold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>
                        Questions
                      </h3>
                      <p className={`text-xs ${isDarkMode ? 'text-gray-400' : 'text-gray-500'}`}>
                        Total to attempt
                      </p>
                    </div>
                  </div>
                  <div className={`px-4 py-2 rounded-lg ${isDarkMode ? 'bg-blue-900/30' : 'bg-blue-100'}`}>
                    <span className={`text-2xl font-bold ${isDarkMode ? 'text-blue-400' : 'text-blue-600'}`}>
                      {questionCount}
                    </span>
                  </div>
                </div>
                
                <div className="space-y-3">
                  <input
                    type="range"
                    min="5"
                    max={Math.min(50, availableQuestions)}
                    value={questionCount}
                    onChange={(e) => setQuestionCount(parseInt(e.target.value))}
                    className={`w-full h-2 rounded-lg appearance-none cursor-pointer ${
                      isDarkMode 
                        ? 'bg-gray-700 accent-blue-500' 
                        : 'bg-gray-200 accent-blue-600'
                    }`}
                    style={{
                      background: isDarkMode
                        ? `linear-gradient(to right, #3b82f6 0%, #3b82f6 ${((questionCount - 5) / (Math.min(50, availableQuestions) - 5)) * 100}%, #374151 ${((questionCount - 5) / (Math.min(50, availableQuestions) - 5)) * 100}%, #374151 100%)`
                        : `linear-gradient(to right, #2563eb 0%, #2563eb ${((questionCount - 5) / (Math.min(50, availableQuestions) - 5)) * 100}%, #e5e7eb ${((questionCount - 5) / (Math.min(50, availableQuestions) - 5)) * 100}%, #e5e7eb 100%)`
                    }}
                    disabled={availableQuestions === 0}
                  />
                  <div className="flex justify-between items-center">
                    <span className={`text-xs font-medium ${isDarkMode ? 'text-gray-400' : 'text-gray-500'}`}>
                      Min: 5
                    </span>
                    <span className={`text-xs font-medium ${isDarkMode ? 'text-gray-400' : 'text-gray-500'}`}>
                      Max: {Math.min(50, availableQuestions)}
                    </span>
                  </div>
                </div>
              </div>

              {/* Time Limit Card */}
              <div className={`${isDarkMode ? 'bg-gray-800/50' : 'bg-white'} rounded-xl p-6 border ${isDarkMode ? 'border-gray-700' : 'border-gray-200'} shadow-sm hover:shadow-md transition-shadow`}>
                <div className="flex items-center justify-between mb-4">
                  <div className="flex items-center gap-3">
                    <div className={`w-12 h-12 rounded-lg ${isDarkMode ? 'bg-purple-900/30' : 'bg-purple-50'} flex items-center justify-center`}>
                      <Clock size={24} className={isDarkMode ? 'text-purple-400' : 'text-purple-600'} />
                    </div>
                    <div>
                      <h3 className={`font-semibold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>
                        Time Limit
                      </h3>
                      <p className={`text-xs ${isDarkMode ? 'text-gray-400' : 'text-gray-500'}`}>
                        Duration in minutes
                      </p>
                    </div>
                  </div>
                  <div className={`px-4 py-2 rounded-lg ${isDarkMode ? 'bg-purple-900/30' : 'bg-purple-100'}`}>
                    <span className={`text-2xl font-bold ${isDarkMode ? 'text-purple-400' : 'text-purple-600'}`}>
                      {timeLimit}m
                    </span>
                  </div>
                </div>
                
                <div className="space-y-3">
                  <input
                    type="range"
                    min="10"
                    max="120"
                    step="5"
                    value={timeLimit}
                    onChange={(e) => setTimeLimit(parseInt(e.target.value))}
                    className={`w-full h-2 rounded-lg appearance-none cursor-pointer ${
                      isDarkMode 
                        ? 'bg-gray-700 accent-purple-500' 
                        : 'bg-gray-200 accent-purple-600'
                    }`}
                    style={{
                      background: isDarkMode
                        ? `linear-gradient(to right, #a855f7 0%, #a855f7 ${((timeLimit - 10) / 110) * 100}%, #374151 ${((timeLimit - 10) / 110) * 100}%, #374151 100%)`
                        : `linear-gradient(to right, #9333ea 0%, #9333ea ${((timeLimit - 10) / 110) * 100}%, #e5e7eb ${((timeLimit - 10) / 110) * 100}%, #e5e7eb 100%)`
                    }}
                  />
                  <div className="flex justify-between items-center">
                    <span className={`text-xs font-medium ${isDarkMode ? 'text-gray-400' : 'text-gray-500'}`}>
                      Min: 10m
                    </span>
                    <span className={`text-xs font-medium ${isDarkMode ? 'text-gray-400' : 'text-gray-500'}`}>
                      Max: 120m
                    </span>
                  </div>
                </div>
              </div>
            </div>

            {/* Recommendation Banner */}
            <div className={`mt-6 p-4 rounded-xl ${isDarkMode ? 'bg-gradient-to-r from-amber-900/20 to-orange-900/20 border border-amber-800/30' : 'bg-gradient-to-r from-amber-50 to-orange-50 border border-amber-200'}`}>
              <div className="flex items-start gap-3">
                <div className={`w-8 h-8 rounded-lg ${isDarkMode ? 'bg-amber-900/40' : 'bg-amber-100'} flex items-center justify-center flex-shrink-0`}>
                  <AlertCircle size={18} className={isDarkMode ? 'text-amber-400' : 'text-amber-600'} />
                </div>
                <div>
                  <p className={`text-sm font-semibold ${isDarkMode ? 'text-amber-400' : 'text-amber-900'} mb-1`}>
                    💡 Recommended Settings
                  </p>
                  <p className={`text-sm ${isDarkMode ? 'text-amber-300/80' : 'text-amber-800'}`}>
                    For {questionCount} questions, we recommend at least <span className="font-bold">{Math.ceil(questionCount * 1.5)} minutes</span> to ensure you have enough time to review your answers.
                  </p>
                </div>
              </div>
            </div>
          </div>

          {/* Instructions */}
          <div className={`${isDarkMode ? 'bg-gradient-to-br from-gray-800 to-gray-900' : 'bg-gradient-to-br from-white to-gray-50'} rounded-2xl shadow-xl p-6 sm:p-8 mb-6 sm:mb-8 border ${isDarkMode ? 'border-gray-700' : 'border-gray-100'}`}>
            <div className="flex items-center gap-3 mb-6">
              <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-orange-500 to-red-500 flex items-center justify-center shadow-lg">
                <AlertCircle size={20} className="text-white" />
              </div>
              <h2 className={`text-xl sm:text-2xl font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>
                Test Instructions
              </h2>
            </div>
            <ul className={`space-y-3 sm:space-y-4 ${isDarkMode ? 'text-gray-300' : 'text-gray-700'} text-sm sm:text-base`}>
              <li className="flex items-start gap-3 sm:gap-4">
                <div className={`w-7 h-7 sm:w-8 sm:h-8 rounded-lg ${isDarkMode ? 'bg-primary-900/40' : 'bg-primary-100'} flex items-center justify-center flex-shrink-0`}>
                  <span className={`text-sm sm:text-base font-bold ${isDarkMode ? 'text-primary-400' : 'text-primary-600'}`}>1</span>
                </div>
                <span className="flex-1 pt-1">This is a timed test. The timer will start as soon as you begin.</span>
              </li>
              <li className="flex items-start gap-3 sm:gap-4">
                <div className={`w-7 h-7 sm:w-8 sm:h-8 rounded-lg ${isDarkMode ? 'bg-primary-900/40' : 'bg-primary-100'} flex items-center justify-center flex-shrink-0`}>
                  <span className={`text-sm sm:text-base font-bold ${isDarkMode ? 'text-primary-400' : 'text-primary-600'}`}>2</span>
                </div>
                <span className="flex-1 pt-1">You can navigate between questions using the navigation buttons.</span>
              </li>
              <li className="flex items-start gap-3 sm:gap-4">
                <div className={`w-7 h-7 sm:w-8 sm:h-8 rounded-lg ${isDarkMode ? 'bg-primary-900/40' : 'bg-primary-100'} flex items-center justify-center flex-shrink-0`}>
                  <span className={`text-sm sm:text-base font-bold ${isDarkMode ? 'text-primary-400' : 'text-primary-600'}`}>3</span>
                </div>
                <span className="flex-1 pt-1">You can review and change your answers before submitting.</span>
              </li>
              <li className="flex items-start gap-3 sm:gap-4">
                <div className={`w-7 h-7 sm:w-8 sm:h-8 rounded-lg ${isDarkMode ? 'bg-primary-900/40' : 'bg-primary-100'} flex items-center justify-center flex-shrink-0`}>
                  <span className={`text-sm sm:text-base font-bold ${isDarkMode ? 'text-primary-400' : 'text-primary-600'}`}>4</span>
                </div>
                <span className="flex-1 pt-1">The test will auto-submit when time expires.</span>
              </li>
              <li className="flex items-start gap-3 sm:gap-4">
                <div className={`w-7 h-7 sm:w-8 sm:h-8 rounded-lg ${isDarkMode ? 'bg-primary-900/40' : 'bg-primary-100'} flex items-center justify-center flex-shrink-0`}>
                  <span className={`text-sm sm:text-base font-bold ${isDarkMode ? 'text-primary-400' : 'text-primary-600'}`}>5</span>
                </div>
                <span className="flex-1 pt-1">Make sure you have a stable internet connection.</span>
              </li>
              <li className="flex items-start gap-3 sm:gap-4">
                <div className={`w-7 h-7 sm:w-8 sm:h-8 rounded-lg ${isDarkMode ? 'bg-primary-900/40' : 'bg-primary-100'} flex items-center justify-center flex-shrink-0`}>
                  <span className={`text-sm sm:text-base font-bold ${isDarkMode ? 'text-primary-400' : 'text-primary-600'}`}>6</span>
                </div>
                <span className="flex-1 pt-1">Do not refresh the page during the test to avoid losing your progress.</span>
              </li>
              <li className="flex items-start gap-3 sm:gap-4">
                <div className={`w-7 h-7 sm:w-8 sm:h-8 rounded-lg ${isDarkMode ? 'bg-primary-900/40' : 'bg-primary-100'} flex items-center justify-center flex-shrink-0`}>
                  <span className={`text-sm sm:text-base font-bold ${isDarkMode ? 'text-primary-400' : 'text-primary-600'}`}>7</span>
                </div>
                <span className="flex-1 pt-1">Your results will be displayed immediately after submission.</span>
              </li>
            </ul>

            {/* Agreement Checkbox */}
            <div className={`mt-6 pt-6 border-t ${isDarkMode ? 'border-gray-700' : 'border-gray-200'}`}>
              <label className="flex items-start gap-3 sm:gap-4 cursor-pointer group">
                <input
                  type="checkbox"
                  checked={agreedToTerms}
                  onChange={(e) => setAgreedToTerms(e.target.checked)}
                  className="mt-1 w-5 h-5 sm:w-6 sm:h-6 text-primary-600 border-gray-300 rounded focus:ring-primary-500 cursor-pointer"
                />
                <span className={`text-sm sm:text-base ${isDarkMode ? 'text-gray-300 group-hover:text-white' : 'text-gray-700 group-hover:text-gray-900'} transition-colors`}>
                  I have read and understood the test instructions. I agree to follow all guidelines and complete the test honestly.
                </span>
              </label>
            </div>
          </div>

          {/* Start Button */}
          <div className="flex flex-col sm:flex-row justify-center items-center gap-4">
            <button
              onClick={handleStartTest}
              disabled={!agreedToTerms || availableQuestions === 0}
              className={`w-full sm:w-auto px-6 sm:px-8 py-3 sm:py-4 rounded-xl font-semibold text-base sm:text-lg flex items-center justify-center gap-2 sm:gap-3 transition-all transform ${
                agreedToTerms && availableQuestions > 0
                  ? 'bg-gradient-to-r from-green-600 to-emerald-600 text-white hover:from-green-700 hover:to-emerald-700 shadow-lg hover:shadow-xl hover:scale-105 active:scale-95'
                  : 'bg-gray-300 text-gray-500 cursor-not-allowed'
              }`}
            >
              <Play size={20} className="sm:w-6 sm:h-6" />
              <span>Start Test Now</span>
            </button>
          </div>

          {availableQuestions === 0 && (
            <div className={`mt-6 p-4 rounded-xl ${isDarkMode ? 'bg-orange-900/20 border border-orange-800/30' : 'bg-orange-50 border border-orange-200'} text-center`}>
              <p className={`text-sm sm:text-base ${isDarkMode ? 'text-orange-400' : 'text-orange-600'} font-medium`}>
                ⚠️ Questions for this course will be available soon
              </p>
            </div>
          )}
        </main>
      </div>
    </>
  );
};

export default CBTInstructionPage;
