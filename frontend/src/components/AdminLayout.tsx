import { useState } from 'react';
import type { ReactNode } from 'react';
import AdminSidebar from './AdminSidebar';
import AdminNotificationDropdown from './AdminNotificationDropdown';
import ProfileAvatar from './ProfileAvatar';
import { useAuth } from '../context/AuthContext';
import { useTheme } from '../context/ThemeContext';
import { Toaster } from 'react-hot-toast';

interface AdminLayoutProps {
  children: ReactNode;
  title: string;
  subtitle?: string;
}

const AdminLayout = ({ children, title, subtitle }: AdminLayoutProps) => {
  const { user, profile } = useAuth();
  const { isDarkMode, toggleDarkMode } = useTheme();
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);
  const [isSidebarCollapsed, setIsSidebarCollapsed] = useState(false);

  return (
    <div className={`flex h-screen ${isDarkMode ? 'bg-gray-900' : 'bg-gray-50'}`}>
      <Toaster position="top-center" reverseOrder={false} />
      
      {/* Mobile Sidebar Overlay */}
      {isSidebarOpen && (
        <div 
          className="fixed inset-0 bg-black bg-opacity-50 z-40 lg:hidden"
          onClick={() => setIsSidebarOpen(false)}
        ></div>
      )}

      {/* Sidebar */}
      <AdminSidebar
        isOpen={isSidebarOpen}
        isCollapsed={isSidebarCollapsed}
        onClose={() => setIsSidebarOpen(false)}
        onToggleCollapse={() => setIsSidebarCollapsed(!isSidebarCollapsed)}
      />

      {/* Main Content */}
      <main className="flex-1 overflow-auto">
        {/* Header - Fully Responsive */}
        <header className={`sticky top-0 z-30 ${isDarkMode ? 'bg-gray-800 border-gray-700' : 'bg-white border-gray-200'} border-b shadow-sm`}>
          <div className="px-3 sm:px-4 md:px-6 lg:px-8 py-3 sm:py-4">
            <div className="flex items-center justify-between gap-2 sm:gap-4">
              {/* Left Section: Hamburger + Title */}
              <div className="flex items-center gap-2 sm:gap-3 flex-1 min-w-0">
                {/* Hamburger Menu Button - Mobile Only */}
                <button
                  onClick={() => setIsSidebarOpen(true)}
                  className={`lg:hidden p-2 rounded-lg transition-colors ${
                    isDarkMode 
                      ? 'hover:bg-gray-700 text-gray-200' 
                      : 'hover:bg-gray-100 text-gray-900'
                  }`}
                  aria-label="Open menu"
                >
                  <svg className="w-5 h-5 sm:w-6 sm:h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
                  </svg>
                </button>
                
                {/* Title Section */}
                <div className="flex-1 min-w-0">
                  <h1 className={`text-base sm:text-xl md:text-2xl font-bold truncate ${
                    isDarkMode ? 'text-white' : 'text-gray-900'
                  }`}>
                    {title}
                  </h1>
                  {subtitle && (
                    <p className={`text-xs sm:text-sm mt-0.5 truncate ${
                      isDarkMode ? 'text-gray-400' : 'text-gray-500'
                    } hidden sm:block`}>
                      {subtitle}
                    </p>
                  )}
                </div>
              </div>
              
              {/* Right Section: Action Buttons + Notifications + Profile */}
              <div className="flex items-center gap-1 sm:gap-2 md:gap-3">
                {/* Quick Action Buttons - Hidden on Mobile */}
                <a 
                  href="/admin/add-summary" 
                  className={`hidden md:inline-flex items-center gap-1.5 px-3 py-2 rounded-lg transition-all text-xs lg:text-sm font-medium ${
                    isDarkMode
                      ? 'bg-green-600 hover:bg-green-700 text-white'
                      : 'bg-green-600 hover:bg-green-700 text-white'
                  } shadow-sm hover:shadow`}
                >
                  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
                  </svg>
                  <span className="hidden lg:inline">Add Summary</span>
                  <span className="lg:hidden">Summary</span>
                </a>
                <a 
                  href="/admin/add-questions" 
                  className={`hidden md:inline-flex items-center gap-1.5 px-3 py-2 rounded-lg transition-all text-xs lg:text-sm font-medium ${
                    isDarkMode
                      ? 'bg-primary-600 hover:bg-primary-700 text-white'
                      : 'bg-primary-600 hover:bg-primary-700 text-white'
                  } shadow-sm hover:shadow`}
                >
                  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
                  </svg>
                  <span className="hidden lg:inline">Add Questions</span>
                  <span className="lg:hidden">Questions</span>
                </a>
                
                {/* Dark Mode Toggle */}
                <button
                  onClick={toggleDarkMode}
                  className={`p-2 rounded-lg transition-colors ${
                    isDarkMode
                      ? 'hover:bg-gray-700 text-gray-200'
                      : 'hover:bg-gray-100 text-gray-700'
                  }`}
                  aria-label="Toggle dark mode"
                  title={isDarkMode ? 'Switch to light mode' : 'Switch to dark mode'}
                >
                  {isDarkMode ? (
                    <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z" />
                    </svg>
                  ) : (
                    <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z" />
                    </svg>
                  )}
                </button>

                {/* Notifications */}
                <div className="flex-shrink-0">
                  <AdminNotificationDropdown />
                </div>
                
                {/* Profile Avatar */}
                <div className="flex-shrink-0">
                  <ProfileAvatar 
                    avatarUrl={profile?.avatar_url}
                    fullName={profile?.full_name || user?.email?.split('@')[0] || 'Admin'}
                    size="sm"
                    className="w-7 h-7 sm:w-9 sm:h-9 md:w-10 md:h-10"
                  />
                </div>
              </div>
            </div>
          </div>
        </header>

        {/* Page Content */}
        <div className="p-4 sm:p-6 lg:p-8">
          {children}
        </div>
      </main>
    </div>
  );
};

export default AdminLayout;
