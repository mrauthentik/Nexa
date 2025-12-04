import { useState, useEffect } from 'react';
import { useTheme } from '../context/ThemeContext';
import { useAuth } from '../context/AuthContext';
import { useNavigate } from 'react-router-dom';
import DashboardLayout from '../components/DashboardLayout';
import { Star, ThumbsUp, ThumbsDown, Calendar, User, MessageSquare } from 'lucide-react';
import supabase from '../supabaseClient';
import toast from 'react-hot-toast';

interface Survey {
  id: string;
  user_id: string;
  overall_rating: number;
  ease_of_use: number;
  content_quality: number;
  would_recommend: boolean | null;
  what_liked: string;
  what_improved: string;
  additional_comments: string;
  created_at: string;
  profiles: {
    full_name: string;
    email: string;
  };
}

const AdminSurveysPage = () => {
  const { isDarkMode } = useTheme();
  const { isAdmin } = useAuth();
  const navigate = useNavigate();
  const [surveys, setSurveys] = useState<Survey[]>([]);
  const [loading, setLoading] = useState(true);
  const [stats, setStats] = useState({
    totalSurveys: 0,
    avgOverallRating: 0,
    avgEaseOfUse: 0,
    avgContentQuality: 0,
    recommendPercentage: 0,
  });

  useEffect(() => {
    if (!isAdmin) {
      toast.error('Access denied');
      navigate('/dashboard');
      return;
    }
    fetchSurveys();
  }, [isAdmin, navigate]);

  const fetchSurveys = async () => {
    try {
      const { data, error } = await supabase
        .from('surveys')
        .select(`
          *,
          profiles (
            full_name,
            email
          )
        `)
        .order('created_at', { ascending: false });

      if (error) throw error;

      setSurveys(data || []);
      calculateStats(data || []);
    } catch (error: any) {
      console.error('Error fetching surveys:', error);
      toast.error('Failed to load surveys');
    } finally {
      setLoading(false);
    }
  };

  const calculateStats = (surveyData: Survey[]) => {
    if (surveyData.length === 0) {
      setStats({
        totalSurveys: 0,
        avgOverallRating: 0,
        avgEaseOfUse: 0,
        avgContentQuality: 0,
        recommendPercentage: 0,
      });
      return;
    }

    const totalSurveys = surveyData.length;
    const avgOverallRating = surveyData.reduce((sum, s) => sum + (s.overall_rating || 0), 0) / totalSurveys;
    const avgEaseOfUse = surveyData.reduce((sum, s) => sum + (s.ease_of_use || 0), 0) / totalSurveys;
    const avgContentQuality = surveyData.reduce((sum, s) => sum + (s.content_quality || 0), 0) / totalSurveys;
    const recommendCount = surveyData.filter(s => s.would_recommend === true).length;
    const recommendPercentage = (recommendCount / totalSurveys) * 100;

    setStats({
      totalSurveys,
      avgOverallRating: Math.round(avgOverallRating * 10) / 10,
      avgEaseOfUse: Math.round(avgEaseOfUse * 10) / 10,
      avgContentQuality: Math.round(avgContentQuality * 10) / 10,
      recommendPercentage: Math.round(recommendPercentage),
    });
  };

  const StarRating = ({ rating }: { rating: number }) => (
    <div className="flex gap-1">
      {[1, 2, 3, 4, 5].map((star) => (
        <Star
          key={star}
          className={`w-4 h-4 ${
            star <= rating ? 'fill-yellow-400 text-yellow-400' : 'text-gray-400'
          }`}
        />
      ))}
    </div>
  );

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'short',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
    });
  };

  return (
    <DashboardLayout currentPage="/admin/surveys">
      <div className="max-w-7xl mx-auto">
        <div className="mb-8">
          <h1 className={`text-3xl font-bold mb-2 ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>
            User Surveys
          </h1>
          <p className={isDarkMode ? 'text-gray-400' : 'text-gray-600'}>
            View feedback from first-time test takers
          </p>
        </div>

        {/* Stats Cards */}
        <div className="grid grid-cols-1 md:grid-cols-5 gap-4 mb-8">
          <div className={`p-4 rounded-lg ${isDarkMode ? 'bg-gray-800' : 'bg-white'} shadow`}>
            <p className={`text-sm ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>Total Surveys</p>
            <p className={`text-2xl font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>
              {stats.totalSurveys}
            </p>
          </div>
          <div className={`p-4 rounded-lg ${isDarkMode ? 'bg-gray-800' : 'bg-white'} shadow`}>
            <p className={`text-sm ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>Avg Overall</p>
            <div className="flex items-center gap-2">
              <p className={`text-2xl font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>
                {stats.avgOverallRating}
              </p>
              <Star className="w-5 h-5 fill-yellow-400 text-yellow-400" />
            </div>
          </div>
          <div className={`p-4 rounded-lg ${isDarkMode ? 'bg-gray-800' : 'bg-white'} shadow`}>
            <p className={`text-sm ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>Ease of Use</p>
            <div className="flex items-center gap-2">
              <p className={`text-2xl font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>
                {stats.avgEaseOfUse}
              </p>
              <Star className="w-5 h-5 fill-yellow-400 text-yellow-400" />
            </div>
          </div>
          <div className={`p-4 rounded-lg ${isDarkMode ? 'bg-gray-800' : 'bg-white'} shadow`}>
            <p className={`text-sm ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>Content Quality</p>
            <div className="flex items-center gap-2">
              <p className={`text-2xl font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>
                {stats.avgContentQuality}
              </p>
              <Star className="w-5 h-5 fill-yellow-400 text-yellow-400" />
            </div>
          </div>
          <div className={`p-4 rounded-lg ${isDarkMode ? 'bg-gray-800' : 'bg-white'} shadow`}>
            <p className={`text-sm ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>Would Recommend</p>
            <p className={`text-2xl font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>
              {stats.recommendPercentage}%
            </p>
          </div>
        </div>

        {/* Surveys List */}
        <div className="space-y-4">
          {loading ? (
            <div className="text-center py-8">
              <p className={isDarkMode ? 'text-gray-400' : 'text-gray-600'}>Loading surveys...</p>
            </div>
          ) : surveys.length === 0 ? (
            <div className={`text-center py-12 rounded-lg ${isDarkMode ? 'bg-gray-800' : 'bg-white'}`}>
              <MessageSquare className={`w-12 h-12 mx-auto mb-4 ${isDarkMode ? 'text-gray-600' : 'text-gray-400'}`} />
              <p className={isDarkMode ? 'text-gray-400' : 'text-gray-600'}>No surveys yet</p>
            </div>
          ) : (
            surveys.map((survey) => (
              <div
                key={survey.id}
                className={`p-6 rounded-lg ${isDarkMode ? 'bg-gray-800' : 'bg-white'} shadow`}
              >
                {/* Header */}
                <div className="flex items-start justify-between mb-4">
                  <div className="flex items-center gap-3">
                    <div className={`w-10 h-10 rounded-full flex items-center justify-center ${isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`}>
                      <User className="w-5 h-5" />
                    </div>
                    <div>
                      <p className={`font-semibold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>
                        {survey.profiles?.full_name || 'Anonymous'}
                      </p>
                      <p className={`text-sm ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>
                        {survey.profiles?.email}
                      </p>
                    </div>
                  </div>
                  <div className="flex items-center gap-2 text-sm text-gray-500">
                    <Calendar className="w-4 h-4" />
                    {formatDate(survey.created_at)}
                  </div>
                </div>

                {/* Ratings */}
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
                  <div>
                    <p className={`text-sm mb-1 ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>
                      Overall Rating
                    </p>
                    <StarRating rating={survey.overall_rating || 0} />
                  </div>
                  <div>
                    <p className={`text-sm mb-1 ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>
                      Ease of Use
                    </p>
                    <StarRating rating={survey.ease_of_use || 0} />
                  </div>
                  <div>
                    <p className={`text-sm mb-1 ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>
                      Content Quality
                    </p>
                    <StarRating rating={survey.content_quality || 0} />
                  </div>
                </div>

                {/* Recommendation */}
                {survey.would_recommend !== null && (
                  <div className="flex items-center gap-2 mb-4">
                    {survey.would_recommend ? (
                      <>
                        <ThumbsUp className="w-5 h-5 text-green-600" />
                        <span className="text-green-600 font-medium">Would recommend</span>
                      </>
                    ) : (
                      <>
                        <ThumbsDown className="w-5 h-5 text-red-600" />
                        <span className="text-red-600 font-medium">Would not recommend</span>
                      </>
                    )}
                  </div>
                )}

                {/* Feedback */}
                <div className="space-y-3">
                  {survey.what_liked && (
                    <div>
                      <p className={`text-sm font-medium mb-1 ${isDarkMode ? 'text-gray-300' : 'text-gray-700'}`}>
                        What they liked:
                      </p>
                      <p className={`text-sm ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>
                        {survey.what_liked}
                      </p>
                    </div>
                  )}
                  {survey.what_improved && (
                    <div>
                      <p className={`text-sm font-medium mb-1 ${isDarkMode ? 'text-gray-300' : 'text-gray-700'}`}>
                        What could be improved:
                      </p>
                      <p className={`text-sm ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>
                        {survey.what_improved}
                      </p>
                    </div>
                  )}
                  {survey.additional_comments && (
                    <div>
                      <p className={`text-sm font-medium mb-1 ${isDarkMode ? 'text-gray-300' : 'text-gray-700'}`}>
                        Additional comments:
                      </p>
                      <p className={`text-sm ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>
                        {survey.additional_comments}
                      </p>
                    </div>
                  )}
                </div>
              </div>
            ))
          )}
        </div>
      </div>
    </DashboardLayout>
  );
};

export default AdminSurveysPage;
