import React from 'react';
import { useTheme } from '../context/ThemeContext';

/**
 * Premium Dashboard Skeleton Loader
 * Displays pulse-animated card placeholders while dashboard data is initializing or suspended.
 * Replaces generic spinning loaders with an elegant layout-matched skeleton UI.
 */
const DashboardSkeleton: React.FC = () => {
  const { isDarkMode } = useTheme();

  return (
    <div className={`min-h-screen ${isDarkMode ? 'bg-gray-900 text-white' : 'bg-gray-50 text-gray-900'} p-4 md:p-8 animate-pulse`}>
      <div className="max-w-7xl mx-auto space-y-8">
        
        {/* Top Header Skeleton */}
        <div className="flex flex-col md:flex-row md:items-center justify-between gap-4 pb-6 border-b border-gray-200 dark:border-gray-800">
          <div className="space-y-3">
            <div className={`h-8 w-64 rounded-xl ${isDarkMode ? 'bg-gray-800' : 'bg-gray-200'}`} />
            <div className={`h-4 w-40 rounded-lg ${isDarkMode ? 'bg-gray-800/60' : 'bg-gray-200/60'}`} />
          </div>
          <div className="flex items-center gap-3">
            <div className={`h-10 w-10 rounded-full ${isDarkMode ? 'bg-gray-800' : 'bg-gray-200'}`} />
            <div className={`h-10 w-32 rounded-xl ${isDarkMode ? 'bg-gray-800' : 'bg-gray-200'}`} />
          </div>
        </div>

        {/* 3 Metric Stat Cards Skeleton Grid */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {[1, 2, 3].map((i) => (
            <div
              key={i}
              className={`p-6 rounded-2xl border ${
                isDarkMode ? 'bg-gray-800/80 border-gray-700/60' : 'bg-white border-gray-200/80'
              } shadow-sm space-y-4`}
            >
              <div className="flex items-center justify-between">
                <div className={`h-4 w-28 rounded-lg ${isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`} />
                <div className={`h-8 w-8 rounded-lg ${isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`} />
              </div>
              <div className={`h-9 w-20 rounded-xl ${isDarkMode ? 'bg-gray-700' : 'bg-gray-300'}`} />
              <div className={`h-3 w-36 rounded-md ${isDarkMode ? 'bg-gray-700/60' : 'bg-gray-200/60'}`} />
            </div>
          ))}
        </div>

        {/* Main Content Grid: Performance Chart + Calendar/Tasks */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          
          {/* Left 2 Cols: Performance Chart Skeleton */}
          <div
            className={`lg:col-span-2 p-6 rounded-2xl border ${
              isDarkMode ? 'bg-gray-800/80 border-gray-700/60' : 'bg-white border-gray-200/80'
            } shadow-sm space-y-6`}
          >
            <div className="flex items-center justify-between">
              <div className={`h-6 w-44 rounded-lg ${isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`} />
              <div className={`h-8 w-28 rounded-lg ${isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`} />
            </div>
            {/* Chart Area Bars Placeholder */}
            <div className="h-64 flex items-end justify-between gap-3 pt-8">
              {[40, 65, 30, 85, 60, 95, 70, 50, 80, 90, 45, 75].map((h, idx) => (
                <div
                  key={idx}
                  style={{ height: `${h}%` }}
                  className={`w-full rounded-t-lg ${isDarkMode ? 'bg-gray-700/70' : 'bg-gray-200'}`}
                />
              ))}
            </div>
          </div>

          {/* Right Col: Todo / Activity Skeleton */}
          <div
            className={`p-6 rounded-2xl border ${
              isDarkMode ? 'bg-gray-800/80 border-gray-700/60' : 'bg-white border-gray-200/80'
            } shadow-sm space-y-6`}
          >
            <div className={`h-6 w-36 rounded-lg ${isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`} />
            <div className="space-y-4">
              {[1, 2, 3, 4].map((i) => (
                <div key={i} className="flex items-center gap-3">
                  <div className={`h-5 w-5 rounded ${isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`} />
                  <div className="space-y-2 flex-1">
                    <div className={`h-4 w-full rounded ${isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`} />
                    <div className={`h-3 w-2/3 rounded ${isDarkMode ? 'bg-gray-700/50' : 'bg-gray-200/60'}`} />
                  </div>
                </div>
              ))}
            </div>
          </div>

        </div>

        {/* Bottom Section: Recent Summaries / Course Modules Skeleton */}
        <div className="space-y-4 pt-4">
          <div className={`h-6 w-48 rounded-lg ${isDarkMode ? 'bg-gray-800' : 'bg-gray-200'}`} />
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {[1, 2, 3].map((i) => (
              <div
                key={i}
                className={`p-5 rounded-xl border ${
                  isDarkMode ? 'bg-gray-800/60 border-gray-700/40' : 'bg-white border-gray-200/60'
                } space-y-3`}
              >
                <div className={`h-5 w-3/4 rounded ${isDarkMode ? 'bg-gray-700' : 'bg-gray-200'}`} />
                <div className={`h-4 w-1/2 rounded ${isDarkMode ? 'bg-gray-700/60' : 'bg-gray-200/60'}`} />
                <div className={`h-2 w-full rounded-full ${isDarkMode ? 'bg-gray-700/40' : 'bg-gray-200/40'}`} />
              </div>
            ))}
          </div>
        </div>

      </div>
    </div>
  );
};

export default DashboardSkeleton;
