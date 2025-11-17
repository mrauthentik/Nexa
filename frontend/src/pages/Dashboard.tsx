import { useState } from 'react';
import { 
  LayoutDashboard, 
  FileText, 
  BookOpen, 
  Calendar, 
  FolderOpen,
  Settings,
  HelpCircle,
  ChevronLeft,
  ChevronRight,
  TrendingUp,
  TrendingDown,
  Moon,
  Sun,
  Menu,
  X as CloseIcon
} from 'lucide-react';

const Dashboard = () => {
  const [currentDate, setCurrentDate] = useState(new Date(2023, 0, 1)); // January 2023
  const [selectedDate, setSelectedDate] = useState(7);
  const [isDarkMode, setIsDarkMode] = useState(false);
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);

  // Mock data
  const stats = [
    { label: 'Course Progress', value: '48%', change: '15% this week', trend: 'up', color: 'bg-orange-200' },
    { label: 'Attendance', value: '97%', change: '30.10 this week', trend: 'up', color: 'bg-green-200' },
    { label: 'Avg Score', value: '86%', change: '30-70% this week', trend: 'down', color: 'bg-blue-200' },
  ];

  const assignments = [
    { 
      id: 1, 
      title: 'Data Structure', 
      subject: 'CSC 201',
      date: 'JAN 10, 2025',
      time: 'At 08:00 PM',
      marks: '20 Marks',
      status: 'Pending',
      icon: '📊',
      color: 'bg-orange-100'
    },
    { 
      id: 2, 
      title: 'System Analysis', 
      subject: 'CSC 301',
      date: 'JAN 09, 2025',
      time: 'At 08:00 PM',
      marks: '10 Marks',
      status: 'Submitted',
      icon: '🔍',
      color: 'bg-green-100'
    },
    { 
      id: 3, 
      title: 'Information Design', 
      subject: 'CSC 205',
      date: 'JAN 15, 2025',
      time: 'At 08:00 PM',
      marks: '20 Marks',
      status: 'Pending',
      icon: '💡',
      color: 'bg-purple-100'
    },
    { 
      id: 4, 
      title: 'Business Development', 
      subject: 'CSC 305',
      date: 'JAN 25, 2025',
      time: 'At 08:00 PM',
      marks: '55 Marks',
      status: 'Pending',
      icon: '💼',
      color: 'bg-blue-100'
    },
  ];

  const tasks = [
    { id: 1, title: 'Math Class', subject: 'Class', date: 'JAN 02, 2025', time: 'At 01:00 PM' },
    { id: 2, title: 'Batch Re-Union', subject: 'Cultural Activity', date: 'JAN 02, 2025', time: 'At 05:00 AM' },
    { id: 3, title: 'Gardening Campaign', subject: 'Class', date: 'JAN 02, 2025', time: 'At 01:00 PM' },
    { id: 4, title: 'System Analysis Class', subject: 'Class', date: 'JAN 02, 2025', time: 'At 01:00 PM' },
    { id: 5, title: 'Data Structure Class', subject: 'Class', date: 'JAN 02, 2025', time: 'At 02:00 PM' },
  ];

  const getDaysInMonth = (date: Date) => {
    const year = date.getFullYear();
    const month = date.getMonth();
    const firstDay = new Date(year, month, 1).getDay();
    const daysInMonth = new Date(year, month + 1, 0).getDate();
    return { firstDay, daysInMonth };
  };

  const { firstDay, daysInMonth } = getDaysInMonth(currentDate);
  const monthName = currentDate.toLocaleString('default', { month: 'long', year: 'numeric' });

  return (
    <div className={`flex h-screen ${isDarkMode ? 'bg-gray-900' : 'bg-gray-50'}`}>
      {/* Mobile Sidebar Overlay */}
      {isSidebarOpen && (
        <div 
          className="fixed inset-0 bg-black bg-opacity-50 z-40 lg:hidden"
          onClick={() => setIsSidebarOpen(false)}
        ></div>
      )}

      {/* Sidebar */}
      <aside className={`fixed lg:static inset-y-0 left-0 z-50 w-64 bg-gray-900 text-white flex flex-col transform transition-transform duration-300 ease-in-out ${
        isSidebarOpen ? 'translate-x-0' : '-translate-x-full lg:translate-x-0'
      }`}>
        <div className="p-6">
          <div className="flex items-center gap-2">
            <div className="w-8 h-8 bg-primary-600 rounded-lg flex items-center justify-center">
              <span className="text-white font-bold">N</span>
            </div>
            <span className="text-xl font-bold">NEXA</span>
          </div>
        </div>

        <nav className="flex-1 px-4">
          <a href="/dashboard" className="flex items-center gap-3 px-4 py-3 bg-gray-800 rounded-lg mb-2">
            <LayoutDashboard size={20} />
            <span>Dashboard</span>
          </a>
          <a href="#" className="flex items-center gap-3 px-4 py-3 hover:bg-gray-800 rounded-lg mb-2 transition-colors">
            <FileText size={20} />
            <span>Summaries</span>
          </a>
          <a href="#" className="flex items-center gap-3 px-4 py-3 hover:bg-gray-800 rounded-lg mb-2 transition-colors">
            <BookOpen size={20} />
            <span>CBT Practice</span>
          </a>
          <a href="#" className="flex items-center gap-3 px-4 py-3 hover:bg-gray-800 rounded-lg mb-2 transition-colors">
            <Calendar size={20} />
            <span>Schedule</span>
          </a>
          <a href="#" className="flex items-center gap-3 px-4 py-3 hover:bg-gray-800 rounded-lg mb-2 transition-colors">
            <FolderOpen size={20} />
            <span>Resources</span>
          </a>
        </nav>

        <div className="p-4 border-t border-gray-800">
          <a href="#" className="flex items-center gap-3 px-4 py-3 hover:bg-gray-800 rounded-lg mb-2 transition-colors">
            <HelpCircle size={20} />
            <span>Get Help</span>
          </a>
          <a href="/settings" className="flex items-center gap-3 px-4 py-3 hover:bg-gray-800 rounded-lg transition-colors">
            <Settings size={20} />
            <span>Settings</span>
          </a>
        </div>
      </aside>

      {/* Main Content */}
      <main className="flex-1 overflow-auto">
        {/* Header */}
        <header className={`${isDarkMode ? 'bg-gray-800 border-gray-700' : 'bg-white border-b'} px-4 sm:px-8 py-4 flex items-center justify-between`}>
          <div className="flex items-center gap-4 flex-1">
            <button 
              className="lg:hidden p-2 hover:bg-gray-100 rounded-lg"
              onClick={() => setIsSidebarOpen(!isSidebarOpen)}
            >
              <Menu size={24} className={isDarkMode ? 'text-white' : 'text-gray-900'} />
            </button>
            <input
              type="text"
              placeholder="Search or type a command"
              className={`w-full max-w-md px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 ${
                isDarkMode ? 'bg-gray-700 text-white placeholder-gray-400' : 'bg-gray-100'
              }`}
            />
          </div>
          <div className="flex items-center gap-2 sm:gap-4">
            <button 
              onClick={() => setIsDarkMode(!isDarkMode)}
              className={`p-2 rounded-lg ${isDarkMode ? 'hover:bg-gray-700' : 'hover:bg-gray-100'}`}
            >
              {isDarkMode ? <Sun size={20} className="text-yellow-400" /> : <Moon size={20} />}
            </button>
            <button className={`relative p-2 rounded-lg ${isDarkMode ? 'hover:bg-gray-700' : 'hover:bg-gray-100'}`}>
              <span className="text-xl">🔔</span>
              <span className="absolute top-1 right-1 w-2 h-2 bg-red-500 rounded-full"></span>
            </button>
            <div className="w-8 h-8 sm:w-10 sm:h-10 bg-primary-600 rounded-full flex items-center justify-center text-white font-semibold text-sm sm:text-base">
              U
            </div>
          </div>
        </header>

        {/* Dashboard Content */}
        <div className="p-4 sm:p-6 lg:p-8">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 sm:gap-6 mb-6">
            {/* Stats Cards */}
            {stats.map((stat, index) => (
              <div key={index} className={`${stat.color} rounded-2xl p-6`}>
                <div className="flex items-start justify-between mb-4">
                  <div>
                    <p className="text-sm text-gray-700 mb-1">{stat.label}</p>
                    <h3 className="text-4xl font-bold text-gray-900">{stat.value}</h3>
                  </div>
                  {stat.trend === 'up' ? (
                    <TrendingUp className="text-green-600" size={24} />
                  ) : (
                    <TrendingDown className="text-red-600" size={24} />
                  )}
                </div>
                <p className="text-xs text-gray-600">{stat.change}</p>
              </div>
            ))}
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-3 gap-4 sm:gap-6">
            {/* Performance Chart */}
            <div className={`lg:col-span-2 ${isDarkMode ? 'bg-gray-800' : 'bg-white'} rounded-2xl p-4 sm:p-6`}>
              <div className="flex items-center justify-between mb-6">
                <h3 className={`text-lg font-semibold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>Performance</h3>
                <div className="flex items-center gap-4">
                  <div className="flex items-center gap-2">
                    <div className="w-3 h-3 bg-primary-500 rounded-full"></div>
                    <span className={`text-sm ${isDarkMode ? 'text-gray-300' : 'text-gray-600'}`}>Progress</span>
                  </div>
                  <select className={`px-3 py-1 border rounded-lg text-sm ${isDarkMode ? 'bg-gray-700 text-white border-gray-600' : ''}`}>
                    <option>Weekly</option>
                    <option>Monthly</option>
                  </select>
                </div>
              </div>
              <div className="h-64 flex items-end justify-between gap-2">
                {/* Simplified chart visualization */}
                <div className="flex-1 bg-gradient-to-t from-primary-200 to-primary-100 rounded-t-lg" style={{ height: '60%' }}></div>
                <div className="flex-1 bg-gradient-to-t from-primary-200 to-primary-100 rounded-t-lg" style={{ height: '75%' }}></div>
                <div className="flex-1 bg-gradient-to-t from-primary-200 to-primary-100 rounded-t-lg relative" style={{ height: '85%' }}>
                  <div className="absolute -top-8 left-1/2 transform -translate-x-1/2 bg-primary-500 text-white px-3 py-1 rounded-lg text-sm font-semibold">
                    85%
                  </div>
                </div>
                <div className="flex-1 bg-gradient-to-t from-primary-200 to-primary-100 rounded-t-lg" style={{ height: '70%' }}></div>
                <div className="flex-1 bg-gradient-to-t from-primary-200 to-primary-100 rounded-t-lg" style={{ height: '65%' }}></div>
                <div className="flex-1 bg-gradient-to-t from-primary-200 to-primary-100 rounded-t-lg" style={{ height: '55%' }}></div>
              </div>
            </div>

            {/* Calendar */}
            <div className={`${isDarkMode ? 'bg-gray-800' : 'bg-white'} rounded-2xl p-4 sm:p-6`}>
              <div className="flex items-center justify-between mb-4">
                <h3 className={`font-semibold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>{monthName}</h3>
                <div className="flex gap-2">
                  <button className={`p-1 rounded ${isDarkMode ? 'hover:bg-gray-700' : 'hover:bg-gray-100'}`}>
                    <ChevronLeft size={20} className={isDarkMode ? 'text-white' : 'text-gray-900'} />
                  </button>
                  <button className={`p-1 rounded ${isDarkMode ? 'hover:bg-gray-700' : 'hover:bg-gray-100'}`}>
                    <ChevronRight size={20} className={isDarkMode ? 'text-white' : 'text-gray-900'} />
                  </button>
                </div>
              </div>
              <div className="grid grid-cols-7 gap-2 mb-2">
                {['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'].map((day) => (
                  <div key={day} className={`text-center text-xs font-semibold ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>
                    {day}
                  </div>
                ))}
              </div>
              <div className="grid grid-cols-7 gap-2">
                {Array.from({ length: firstDay }).map((_, i) => (
                  <div key={`empty-${i}`}></div>
                ))}
                {Array.from({ length: daysInMonth }).map((_, i) => {
                  const day = i + 1;
                  const isSelected = day === selectedDate;
                  return (
                    <button
                      key={day}
                      className={`aspect-square flex items-center justify-center text-sm rounded-lg ${
                        isSelected
                          ? 'bg-orange-500 text-white font-semibold'
                          : 'hover:bg-gray-100'
                      }`}
                    >
                      {day}
                    </button>
                  );
                })}
              </div>
            </div>
          </div>

          {/* Assignments and Tasks */}
          <div className="grid grid-cols-3 gap-6 mt-6">
            {/* Assignments */}
            <div className="col-span-2 bg-white rounded-2xl p-6">
              <div className="flex items-center justify-between mb-6">
                <h3 className="text-lg font-semibold">Assignments</h3>
                <a href="#" className="text-sm text-primary-600 hover:text-primary-700">
                  View all →
                </a>
              </div>
              <div className="space-y-4">
                {assignments.map((assignment) => (
                  <div key={assignment.id} className="flex items-center gap-4 p-4 hover:bg-gray-50 rounded-lg transition-colors">
                    <div className={`w-12 h-12 ${assignment.color} rounded-lg flex items-center justify-center text-2xl`}>
                      {assignment.icon}
                    </div>
                    <div className="flex-1">
                      <h4 className="font-semibold text-gray-900">{assignment.title}</h4>
                      <p className="text-sm text-gray-500">{assignment.subject}</p>
                    </div>
                    <div className="text-right">
                      <p className="text-sm font-medium text-gray-900">{assignment.date}</p>
                      <p className="text-xs text-gray-500">{assignment.time}</p>
                    </div>
                    <div className="text-sm font-medium text-gray-700">
                      {assignment.marks}
                    </div>
                    <div>
                      <span className={`px-4 py-1 rounded-full text-sm font-medium ${
                        assignment.status === 'Pending' 
                          ? 'bg-orange-100 text-orange-700' 
                          : 'bg-green-100 text-green-700'
                      }`}>
                        {assignment.status}
                      </span>
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* Tasks */}
            <div className="bg-white rounded-2xl p-6">
              <div className="flex items-center justify-between mb-6">
                <h3 className="text-lg font-semibold">Tasks</h3>
                <a href="#" className="text-sm text-primary-600 hover:text-primary-700">
                  View all
                </a>
              </div>
              <div className="space-y-4">
                {tasks.map((task) => (
                  <div key={task.id} className="flex items-start gap-3">
                    <input type="checkbox" className="mt-1 w-4 h-4 text-primary-600 rounded" />
                    <div className="flex-1">
                      <h4 className="font-medium text-gray-900 text-sm">{task.title}</h4>
                      <p className="text-xs text-gray-500">{task.subject}</p>
                      <p className="text-xs text-gray-400 mt-1">
                        {task.date}<br />{task.time}
                      </p>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
};

export default Dashboard;
