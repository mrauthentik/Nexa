import { useState } from 'react';
import { useTheme } from '../context/ThemeContext';
import { Star, ThumbsUp, ThumbsDown, X } from 'lucide-react';
import supabase from '../supabaseClient';
import toast from 'react-hot-toast';

interface SurveyModalProps {
  isOpen: boolean;
  onClose: () => void;
  userId: string;
  testResultId?: string;
}

const SurveyModal = ({ isOpen, onClose, userId, testResultId }: SurveyModalProps) => {
  const { isDarkMode } = useTheme();
  const [step, setStep] = useState(1);
  const [submitting, setSubmitting] = useState(false);
  
  const [formData, setFormData] = useState({
    overall_rating: 0,
    ease_of_use: 0,
    content_quality: 0,
    would_recommend: null as boolean | null,
    what_liked: '',
    what_improved: '',
    additional_comments: ''
  });

  if (!isOpen) return null;

  const handleSubmit = async () => {
    if (formData.overall_rating === 0) {
      toast.error('Please provide an overall rating');
      return;
    }

    setSubmitting(true);
    try {
      const { error } = await supabase
        .from('surveys')
        .insert({
          user_id: userId,
          test_result_id: testResultId,
          ...formData,
          is_first_test: true
        });

      if (error) throw error;
      
      toast.success('Thank you for your feedback! 🎉');
      onClose();
    } catch (error: any) {
      console.error('Error submitting survey:', error);
      toast.error('Failed to submit survey. Please try again.');
    } finally {
      setSubmitting(false);
    }
  };

  const StarRating = ({ value, onChange }: { value: number; onChange: (val: number) => void }) => (
    <div className="flex gap-2">
      {[1, 2, 3, 4, 5].map((star) => (
        <button
          key={star}
          type="button"
          onClick={() => onChange(star)}
          className="transition-transform hover:scale-110"
        >
          <Star
            className={`w-8 h-8 ${
              star <= value ? 'fill-yellow-400 text-yellow-400' : 'text-gray-400'
            }`}
          />
        </button>
      ))}
    </div>
  );

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
      <div className={`max-w-lg w-full ${isDarkMode ? 'bg-gray-800' : 'bg-white'} rounded-2xl shadow-2xl p-6 max-h-[90vh] overflow-y-auto`}>
        <div className="flex items-center justify-between mb-6">
          <h2 className={`text-2xl font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>
            🎉 How was your experience?
          </h2>
          <button
            onClick={onClose}
            className={`p-2 rounded-lg ${isDarkMode ? 'hover:bg-gray-700' : 'hover:bg-gray-100'}`}
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {step === 1 && (
          <div className="space-y-6">
            <div>
              <label className={`block text-sm font-medium mb-2 ${isDarkMode ? 'text-gray-300' : 'text-gray-700'}`}>
                Overall, how would you rate your experience? *
              </label>
              <StarRating
                value={formData.overall_rating}
                onChange={(val) => setFormData({ ...formData, overall_rating: val })}
              />
            </div>

            <div>
              <label className={`block text-sm font-medium mb-2 ${isDarkMode ? 'text-gray-300' : 'text-gray-700'}`}>
                How easy was it to use the platform?
              </label>
              <StarRating
                value={formData.ease_of_use}
                onChange={(val) => setFormData({ ...formData, ease_of_use: val })}
              />
            </div>

            <div>
              <label className={`block text-sm font-medium mb-2 ${isDarkMode ? 'text-gray-300' : 'text-gray-700'}`}>
                How would you rate the quality of the content?
              </label>
              <StarRating
                value={formData.content_quality}
                onChange={(val) => setFormData({ ...formData, content_quality: val })}
              />
            </div>

            <div>
              <label className={`block text-sm font-medium mb-3 ${isDarkMode ? 'text-gray-300' : 'text-gray-700'}`}>
                Would you recommend NEXA to a friend?
              </label>
              <div className="flex gap-4">
                <button
                  type="button"
                  onClick={() => setFormData({ ...formData, would_recommend: true })}
                  className={`flex-1 py-3 px-4 rounded-lg border-2 transition-all ${
                    formData.would_recommend === true
                      ? 'border-green-500 bg-green-50 dark:bg-green-900/20'
                      : isDarkMode
                      ? 'border-gray-600 hover:border-gray-500'
                      : 'border-gray-300 hover:border-gray-400'
                  }`}
                >
                  <ThumbsUp className={`w-6 h-6 mx-auto ${formData.would_recommend === true ? 'text-green-600' : 'text-gray-400'}`} />
                  <span className={`block mt-2 text-sm font-medium ${formData.would_recommend === true ? 'text-green-600' : 'text-gray-600'}`}>
                    Yes
                  </span>
                </button>
                <button
                  type="button"
                  onClick={() => setFormData({ ...formData, would_recommend: false })}
                  className={`flex-1 py-3 px-4 rounded-lg border-2 transition-all ${
                    formData.would_recommend === false
                      ? 'border-red-500 bg-red-50 dark:bg-red-900/20'
                      : isDarkMode
                      ? 'border-gray-600 hover:border-gray-500'
                      : 'border-gray-300 hover:border-gray-400'
                  }`}
                >
                  <ThumbsDown className={`w-6 h-6 mx-auto ${formData.would_recommend === false ? 'text-red-600' : 'text-gray-400'}`} />
                  <span className={`block mt-2 text-sm font-medium ${formData.would_recommend === false ? 'text-red-600' : 'text-gray-600'}`}>
                    No
                  </span>
                </button>
              </div>
            </div>

            <button
              onClick={() => setStep(2)}
              disabled={formData.overall_rating === 0}
              className={`w-full py-3 rounded-lg font-medium transition-colors ${
                formData.overall_rating === 0
                  ? 'bg-gray-300 text-gray-500 cursor-not-allowed'
                  : 'bg-primary-600 text-white hover:bg-primary-700'
              }`}
            >
              Next
            </button>
          </div>
        )}

        {step === 2 && (
          <div className="space-y-6">
            <div>
              <label className={`block text-sm font-medium mb-2 ${isDarkMode ? 'text-gray-300' : 'text-gray-700'}`}>
                What did you like most about NEXA?
              </label>
              <textarea
                value={formData.what_liked}
                onChange={(e) => setFormData({ ...formData, what_liked: e.target.value })}
                rows={3}
                className={`w-full px-4 py-2 rounded-lg border ${
                  isDarkMode
                    ? 'bg-gray-700 border-gray-600 text-white'
                    : 'bg-white border-gray-300 text-gray-900'
                } focus:ring-2 focus:ring-primary-500 focus:border-transparent`}
                placeholder="Share what you enjoyed..."
              />
            </div>

            <div>
              <label className={`block text-sm font-medium mb-2 ${isDarkMode ? 'text-gray-300' : 'text-gray-700'}`}>
                What could we improve?
              </label>
              <textarea
                value={formData.what_improved}
                onChange={(e) => setFormData({ ...formData, what_improved: e.target.value })}
                rows={3}
                className={`w-full px-4 py-2 rounded-lg border ${
                  isDarkMode
                    ? 'bg-gray-700 border-gray-600 text-white'
                    : 'bg-white border-gray-300 text-gray-900'
                } focus:ring-2 focus:ring-primary-500 focus:border-transparent`}
                placeholder="Help us get better..."
              />
            </div>

            <div>
              <label className={`block text-sm font-medium mb-2 ${isDarkMode ? 'text-gray-300' : 'text-gray-700'}`}>
                Any additional comments?
              </label>
              <textarea
                value={formData.additional_comments}
                onChange={(e) => setFormData({ ...formData, additional_comments: e.target.value })}
                rows={3}
                className={`w-full px-4 py-2 rounded-lg border ${
                  isDarkMode
                    ? 'bg-gray-700 border-gray-600 text-white'
                    : 'bg-white border-gray-300 text-gray-900'
                } focus:ring-2 focus:ring-primary-500 focus:border-transparent`}
                placeholder="Anything else you'd like to share..."
              />
            </div>

            <div className="flex gap-3">
              <button
                onClick={() => setStep(1)}
                className={`px-6 py-3 rounded-lg font-medium ${
                  isDarkMode
                    ? 'bg-gray-700 text-white hover:bg-gray-600'
                    : 'bg-gray-200 text-gray-700 hover:bg-gray-300'
                }`}
              >
                Back
              </button>
              <button
                onClick={handleSubmit}
                disabled={submitting}
                className={`flex-1 py-3 rounded-lg font-medium transition-colors ${
                  submitting
                    ? 'bg-gray-300 text-gray-500 cursor-not-allowed'
                    : 'bg-primary-600 text-white hover:bg-primary-700'
                }`}
              >
                {submitting ? 'Submitting...' : 'Submit Feedback'}
              </button>
            </div>

            <button
              onClick={onClose}
              className={`w-full text-sm ${isDarkMode ? 'text-gray-400 hover:text-gray-300' : 'text-gray-600 hover:text-gray-700'}`}
            >
              Skip for now
            </button>
          </div>
        )}
      </div>
    </div>
  );
};

export default SurveyModal;
