import { useEffect, useState } from 'react';
import { useTheme } from '../context/ThemeContext';

interface LoadingStatusProps {
  isLoading: boolean;
  message?: string;
}

const loadingMessages = [
  "Hang on a bit... 🚀",
  "Almost there... ⏳",
  "Getting your data ready... 📦",
  "Just a moment... ✨",
  "Loading your content... 📚",
  "Fetching the good stuff... 🎯",
  "Preparing something awesome... 🌟",
];

const slowNetworkMessages = [
  "Your network seems a bit slow... 🐌",
  "Taking longer than usual... 🕐",
  "Still working on it... ⏰",
  "Network's being sluggish, but we got you... 🔄",
  "Patience is a virtue... we're almost done! 🙏",
];

/**
 * LoadingStatus — Replaced spinner with a shimmering skeleton card + status message
 */
const LoadingStatus = ({ isLoading, message }: LoadingStatusProps) => {
  const { isDarkMode } = useTheme();
  const [currentMessage, setCurrentMessage] = useState(loadingMessages[0]);
  const [isSlowNetwork, setIsSlowNetwork] = useState(false);

  useEffect(() => {
    if (!isLoading) {
      setIsSlowNetwork(false);
      return;
    }

    let messageIdx = 0;
    const messageInterval = setInterval(() => {
      messageIdx = (messageIdx + 1) % loadingMessages.length;
      setCurrentMessage(loadingMessages[messageIdx]);
    }, 3000);

    const slowNetworkTimeout = setTimeout(() => {
      setIsSlowNetwork(true);
      setCurrentMessage(slowNetworkMessages[0]);
      
      let slowIndex = 0;
      const slowInterval = setInterval(() => {
        slowIndex = (slowIndex + 1) % slowNetworkMessages.length;
        setCurrentMessage(slowNetworkMessages[slowIndex]);
      }, 4000);

      return () => clearInterval(slowInterval);
    }, 5000);

    return () => {
      clearInterval(messageInterval);
      clearTimeout(slowNetworkTimeout);
    };
  }, [isLoading]);

  if (!isLoading) return null;

  return (
    <div className={`w-full p-6 rounded-2xl border ${isDarkMode ? 'bg-gray-800/80 border-gray-700/60' : 'bg-white border-gray-200/80'} shadow-sm animate-pulse space-y-4`}>
      <div className="flex items-center gap-3">
        <div className={`h-10 w-10 rounded-full ${isSlowNetwork ? 'bg-orange-500/20' : isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`} />
        <div className="space-y-2 flex-1">
          <div className={`h-4 w-48 rounded ${isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`} />
          <p className={`text-xs font-medium ${isSlowNetwork ? 'text-orange-500' : isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>
            {message || currentMessage}
          </p>
        </div>
      </div>
      <div className={`h-20 w-full rounded-xl ${isDarkMode ? 'bg-gray-700/40' : 'bg-gray-100'}`} />
    </div>
  );
};

export default LoadingStatus;
