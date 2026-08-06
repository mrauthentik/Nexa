import React from 'react';
import DashboardSkeleton from './DashboardSkeleton';
import { useTheme } from '../context/ThemeContext';

interface LoadingSpinnerProps {
    size?: 'sm' | 'md' | 'lg';
    fullScreen?: boolean;
    message?: string;
}

/**
 * Universal Skeleton Loader (Replaces legacy circle spinner)
 * Displays layout-matched shimmering card skeletons instead of spinning circles.
 */
const LoadingSpinner: React.FC<LoadingSpinnerProps> = ({ fullScreen = false }) => {
    const { isDarkMode } = useTheme();

    if (fullScreen) {
        return <DashboardSkeleton />;
    }

    return (
        <div className={`w-full p-6 rounded-2xl border ${isDarkMode ? 'bg-gray-800/80 border-gray-700/60' : 'bg-white border-gray-200/80'} shadow-sm animate-pulse space-y-4`}>
            <div className="flex items-center justify-between">
                <div className={`h-5 w-40 rounded-lg ${isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`} />
                <div className={`h-8 w-24 rounded-lg ${isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`} />
            </div>
            <div className={`h-24 w-full rounded-xl ${isDarkMode ? 'bg-gray-700/60' : 'bg-gray-100'}`} />
            <div className="grid grid-cols-3 gap-3 pt-2">
                <div className={`h-4 w-full rounded ${isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`} />
                <div className={`h-4 w-full rounded ${isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`} />
                <div className={`h-4 w-full rounded ${isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`} />
            </div>
        </div>
    );
};

export default LoadingSpinner;
