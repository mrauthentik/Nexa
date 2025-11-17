import { useState } from 'react';
import { 
  LayoutDashboard, 
  Users, 
  BookOpen, 
  FileText,
  Settings,
  BarChart3,
  TrendingUp,
  TrendingDown,
  ChevronLeft,
  ChevronRight
} from 'lucide-react';

const AdminDashboard = () => {
  const [currentDate, setCurrentDate] = useState(new Date(2023, 0, 1));

  const stats = [
    { label: 'Total Students', value: '1,248', change: '+12% this month', trend: 'up', color: 'bg-blue-200' },
    { label: 'Active Tests', value: '45', change: '+8 new this week', trend: 'up', color: 'bg-green-200' },
    { label: 'Avg Performance', value: '78%', change: '+5% from last month', trend: 'up', color: 'bg-purple-200' },
  ];

  const recentTests = [
    { 
      id: 1, 
      title: 'Data Structure Final', 
      course: 'CSC 201',
      students: 145,
      avgScore: '82%',
      date: 'JAN 15, 2025',
      status: 'Active',
      icon: '📊'
    },
    { 
      id: 2, 
      title: 'System Analysis Midterm', 
      course: 'CSC 301',
      students: 128,
      avgScore: '75%',
      date: 'JAN 12, 2025',
      status: 'Completed',
      icon: '🔍'
    },
    { 
      id: 3, 
      title: 'Database Management Quiz', 
      course: 'CSC 205',
      students: 156,
      avgScore: '88%',
      date: 'JAN 18, 2025',
      status: 'Scheduled',
      icon: '💾'
    },
    { 
      id: 4, 
      title: 'Web Development Test', 
      course: 'CSC 305',
      students: 134,
      avgScore: '79%',
      date: 'JAN 20, 2025',
      status: 'Scheduled',
      icon: '🌐'
    },
  ];

  const topStudents = [
    { id: 1, name: 'Alice Johnson', score: '95%', tests: 12 },
    { id: 2, name: 'Bob Smith', score: '92%', tests: 11 },
    { id: 3, name: 'Carol Williams', score: '90%', tests: 10 },
    { id: 4, name: 'David Brown', score: '88%', tests: 12 },
    { id: 5, name: 'Eve Davis', score: '87%', tests: 9 },
  ];

  return (
    <div className="flex h-screen bg-gray-50">
      {/* Sidebar */}
      <aside className="w-64 bg-gray-900 text-white flex flex-col">
        <div className="p-6">
          <div className="flex items-center gap-2">
            <div className="w-8 h-8 bg-primary-600 rounded-lg flex items-center justify-center">
              <span className="text-white font-bold">N</span>
            </div>
            <span className="text-xl font-bold">NEXA Admin</span>
          </div>
        </div>

        <nav className="flex-1 px-4">
          <a href="#" className="flex items-center gap-3 px-4 py-3 bg-gray-800 rounded-lg mb-2">
            <LayoutDashboard size={20} />
            <span>Dashboard</span>
          </a>
          <a href="#" className="flex items-center gap-3 px-4 py-3 hover:bg-gray-800 rounded-lg mb-2 transition-colors">
            <Users size={20} />
            <span>Students</span>
          </a>
          <a href="#" className="flex items-center gap-3 px-4 py-3 hover:bg-gray-800 rounded-lg mb-2 transition-colors">
            <BookOpen size={20} />
            <span>Tests</span>
          </a>
          <a href="#" className="flex items-center gap-3 px-4 py-3 hover:bg-gray-800 rounded-lg mb-2 transition-colors">
            <FileText size={20} />
            <span>Courses</span>
          </a>
          <a href="#" className="flex items-center gap-3 px-4 py-3 hover:bg-gray-800 rounded-lg mb-2 transition-colors">
            <BarChart3 size={20} />
            <span>Analytics</span>
          </a>
        </nav>

        <div className="p-4 border-t border-gray-800">
          <a href="#" className="flex items-center gap-3 px-4 py-3 hover:bg-gray-800 rounded-lg transition-colors">
            <Settings size={20} />
            <span>Settings</span>
          </a>
        </div>
      </aside>

      {/* Main Content */}
      <main className="flex-1 overflow-auto">
        {/* Header */}
        <header className="bg-white border-b px-8 py-4 flex items-center justify-between">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Admin Dashboard</h1>
            <p className="text-sm text-gray-500">Welcome back, Administrator</p>
          </div>
          <div className="flex items-center gap-4">
            <button className="px-4 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-colors">
              + Create Test
            </button>
            <div className="w-10 h-10 bg-gray-900 rounded-full flex items-center justify-center text-white font-semibold">
              A
            </div>
          </div>
        </header>

        {/* Dashboard Content */}
        <div className="p-8">
          {/* Stats Cards */}
          <div className="grid grid-cols-3 gap-6 mb-6">
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

          <div className="grid grid-cols-3 gap-6">
            {/* Performance Overview */}
            <div className="col-span-2 bg-white rounded-2xl p-6">
              <div className="flex items-center justify-between mb-6">
                <h3 className="text-lg font-semibold">Student Performance Overview</h3>
                <select className="px-3 py-1 border rounded-lg text-sm">
                  <option>This Month</option>
                  <option>Last Month</option>
                  <option>This Year</option>
                </select>
              </div>
              <div className="h-64 flex items-end justify-between gap-2">
                {/* Simplified chart */}
                {[65, 78, 85, 72, 88, 75, 82].map((height, i) => (
                  <div 
                    key={i}
                    className="flex-1 bg-gradient-to-t from-primary-500 to-primary-300 rounded-t-lg hover:opacity-80 transition-opacity cursor-pointer"
                    style={{ height: `${height}%` }}
                  ></div>
                ))}
              </div>
              <div className="flex justify-between mt-4 text-xs text-gray-500">
                <span>Week 1</span>
                <span>Week 2</span>
                <span>Week 3</span>
                <span>Week 4</span>
              </div>
            </div>

            {/* Top Students */}
            <div className="bg-white rounded-2xl p-6">
              <h3 className="text-lg font-semibold mb-6">Top Performers</h3>
              <div className="space-y-4">
                {topStudents.map((student, index) => (
                  <div key={student.id} className="flex items-center gap-3">
                    <div className={`w-8 h-8 rounded-full flex items-center justify-center font-semibold text-sm ${
                      index === 0 ? 'bg-yellow-400 text-yellow-900' :
                      index === 1 ? 'bg-gray-300 text-gray-700' :
                      index === 2 ? 'bg-orange-400 text-orange-900' :
                      'bg-gray-100 text-gray-600'
                    }`}>
                      {index + 1}
                    </div>
                    <div className="flex-1">
                      <h4 className="font-medium text-sm">{student.name}</h4>
                      <p className="text-xs text-gray-500">{student.tests} tests completed</p>
                    </div>
                    <div className="text-sm font-semibold text-primary-600">
                      {student.score}
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>

          {/* Recent Tests */}
          <div className="mt-6 bg-white rounded-2xl p-6">
            <div className="flex items-center justify-between mb-6">
              <h3 className="text-lg font-semibold">Recent Tests</h3>
              <a href="#" className="text-sm text-primary-600 hover:text-primary-700">
                View all →
              </a>
            </div>
            <div className="space-y-4">
              {recentTests.map((test) => (
                <div key={test.id} className="flex items-center gap-4 p-4 hover:bg-gray-50 rounded-lg transition-colors">
                  <div className="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center text-2xl">
                    {test.icon}
                  </div>
                  <div className="flex-1">
                    <h4 className="font-semibold text-gray-900">{test.title}</h4>
                    <p className="text-sm text-gray-500">{test.course}</p>
                  </div>
                  <div className="text-center">
                    <p className="text-sm font-medium text-gray-900">{test.students}</p>
                    <p className="text-xs text-gray-500">Students</p>
                  </div>
                  <div className="text-center">
                    <p className="text-sm font-medium text-gray-900">{test.avgScore}</p>
                    <p className="text-xs text-gray-500">Avg Score</p>
                  </div>
                  <div className="text-right">
                    <p className="text-sm font-medium text-gray-900">{test.date}</p>
                  </div>
                  <div>
                    <span className={`px-4 py-1 rounded-full text-sm font-medium ${
                      test.status === 'Active' ? 'bg-green-100 text-green-700' :
                      test.status === 'Completed' ? 'bg-gray-100 text-gray-700' :
                      'bg-blue-100 text-blue-700'
                    }`}>
                      {test.status}
                    </span>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </main>
    </div>
  );
};

export default AdminDashboard;
