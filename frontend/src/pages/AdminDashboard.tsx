import { useState, useEffect } from 'react';
import { adminExtendedAPI } from '../services/api';
import { Award, TrendingUp, BookOpen, Eye } from 'lucide-react';
import AdminLayout from '../components/AdminLayout';

const AdminDashboard = () => {
  const [topPerformers, setTopPerformers] = useState<any[]>([]);
  const [loadingPerformers, setLoadingPerformers] = useState(true);
  const [selectedPerformer, setSelectedPerformer] = useState<any>(null);

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
      icon: 'chart'
    },
    { 
      id: 2, 
      title: 'System Analysis Midterm', 
      course: 'CSC 301',
      students: 128,
      avgScore: '75%',
      date: 'JAN 12, 2025',
      status: 'Completed',
      icon: 'search'
    },
    { 
      id: 3, 
      title: 'Database Management Quiz', 
      course: 'CSC 205',
      students: 156,
      avgScore: '88%',
      date: 'JAN 18, 2025',
      status: 'Scheduled',
      icon: 'database'
    },
    { 
      id: 4, 
      title: 'Web Development Test', 
      course: 'CSC 305',
      students: 134,
      avgScore: '79%',
      date: 'JAN 20, 2025',
      status: 'Scheduled',
      icon: 'globe'
    },
  ];

  useEffect(() => {
    fetchTopPerformers();
  }, []);

  const fetchTopPerformers = async () => {
    try {
      const { topPerformers: data } = await adminExtendedAPI.getTopPerformers();
      setTopPerformers(data || []);
    } catch (error) {
      console.error('Error fetching top performers:', error);
    } finally {
      setLoadingPerformers(false);
    }
  };

  return (
    <AdminLayout title="Admin Dashboard" subtitle="Welcome back, Administrator">
      <div>
        {/* Stats Cards */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 sm:gap-6 mb-6">
            {stats.map((stat, index) => (
              <div key={index} className={`${stat.color} rounded-2xl p-6`}>
                <div className="flex items-start justify-between mb-4">
                  <div>
                    <p className="text-sm text-gray-700 mb-1">{stat.label}</p>
                    <h3 className="text-4xl font-bold text-gray-900">{stat.value}</h3>
                  </div>
                  {stat.trend === 'up' ? (
                    <svg className="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6" />
                    </svg>
                  ) : (
                    <svg className="w-6 h-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 17h8m0 0V9m0 8l-8-8-4 4-6-6" />
                    </svg>
                  )}
                </div>
                <p className="text-xs text-gray-600">{stat.change}</p>
              </div>
            ))}
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
            {/* Performance Overview */}
            <div className="lg:col-span-2 bg-white rounded-2xl p-4 sm:p-6">
              <div className="flex items-center justify-between mb-6">
                <div>
                  <h3 className="text-lg font-semibold text-gray-900">Student Performance Overview</h3>
                  <p className="text-sm text-gray-500">Average test scores across all courses</p>
                </div>
                <select className="px-3 py-1 border border-gray-300 rounded-lg text-sm">
                  <option>This Month</option>
                  <option>Last Month</option>
                  <option>This Year</option>
                </select>
              </div>
              
              {/* Chart Container */}
              <div className="relative h-64">
                {/* Y-axis labels */}
                <div className="absolute left-0 top-0 bottom-0 flex flex-col justify-between text-xs text-gray-400 pr-2">
                  <span>100%</span>
                  <span>75%</span>
                  <span>50%</span>
                  <span>25%</span>
                  <span>0%</span>
                </div>
                
                {/* Chart area */}
                <div className="ml-8 h-full relative">
                  {/* Grid lines */}
                  <div className="absolute inset-0 flex flex-col justify-between">
                    {[0, 1, 2, 3, 4].map((i) => (
                      <div key={i} className="border-t border-gray-200"></div>
                    ))}
                  </div>
                  
                  {/* Bar Chart */}
                  <div className="absolute inset-0 flex items-end justify-between gap-2 px-2">
                    {[
                      { height: 65, color: 'from-blue-400 to-blue-600', label: '65%' },
                      { height: 78, color: 'from-indigo-400 to-indigo-600', label: '78%' },
                      { height: 85, color: 'from-purple-400 to-purple-600', label: '85%' },
                      { height: 72, color: 'from-pink-400 to-pink-600', label: '72%' },
                      { height: 88, color: 'from-rose-400 to-rose-600', label: '88%' },
                      { height: 75, color: 'from-orange-400 to-orange-600', label: '75%' },
                      { height: 82, color: 'from-amber-400 to-amber-600', label: '82%' }
                    ].map((bar, i) => (
                      <div key={i} className="flex-1 flex flex-col items-center group">
                        <div className="relative w-full">
                          {/* Tooltip */}
                          <div className="absolute -top-8 left-1/2 transform -translate-x-1/2 bg-gray-900 text-white px-2 py-1 rounded text-xs font-semibold opacity-0 group-hover:opacity-100 transition-opacity whitespace-nowrap">
                            {bar.label}
                          </div>
                          {/* Bar */}
                          <div 
                            className={`w-full bg-gradient-to-t ${bar.color} rounded-t-lg transition-all duration-300 hover:scale-105 cursor-pointer shadow-lg`}
                            style={{ height: `${bar.height * 2.5}px` }}
                          >
                            {/* Shine effect */}
                            <div className="w-full h-full bg-gradient-to-r from-white/20 to-transparent rounded-t-lg"></div>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
                
                {/* X-axis labels */}
                <div className="absolute bottom-0 left-8 right-0 flex justify-between text-xs text-gray-400 mt-2 px-2">
                  <span>Week 1</span>
                  <span>Week 2</span>
                  <span>Week 3</span>
                  <span>Week 4</span>
                </div>
              </div>
              
              {/* Stats below chart */}
              <div className="grid grid-cols-4 gap-4 mt-6 pt-4 border-t border-gray-200">
                <div className="text-center">
                  <p className="text-2xl font-bold text-gray-900">88%</p>
                  <p className="text-xs text-gray-500">Peak</p>
                </div>
                <div className="text-center">
                  <p className="text-2xl font-bold text-gray-900">77.8%</p>
                  <p className="text-xs text-gray-500">Average</p>
                </div>
                <div className="text-center">
                  <p className="text-2xl font-bold text-green-500">+8.5%</p>
                  <p className="text-xs text-gray-500">Growth</p>
                </div>
                <div className="text-center">
                  <p className="text-2xl font-bold text-blue-500">1,248</p>
                  <p className="text-xs text-gray-500">Students</p>
                </div>
              </div>
            </div>

            {/* Top Students */}
            <div className="bg-white rounded-2xl p-6">
              <div className="flex items-center justify-between mb-6">
                <h3 className="text-lg font-semibold">Top Performers</h3>
                <a href="/admin/students" className="text-sm text-primary-600 hover:text-primary-700">
                  View all →
                </a>
              </div>
              {loadingPerformers ? (
                <div className="space-y-4">
                  {[1, 2, 3, 4, 5].map((i) => (
                    <div key={i} className="flex items-center gap-3 animate-pulse">
                      <div className="w-8 h-8 rounded-full bg-gray-200"></div>
                      <div className="flex-1">
                        <div className="h-4 bg-gray-200 rounded w-32 mb-2"></div>
                        <div className="h-3 bg-gray-200 rounded w-24"></div>
                      </div>
                      <div className="h-4 bg-gray-200 rounded w-12"></div>
                    </div>
                  ))}
                </div>
              ) : topPerformers.length === 0 ? (
                <div className="text-center py-8 text-gray-500">
                  <Award className="w-12 h-12 mx-auto mb-2 opacity-50" />
                  <p>No top performers yet</p>
                </div>
              ) : (
                <div className="space-y-3">
                  {topPerformers.slice(0, 10).map((performer, index) => (
                    <div
                      key={performer.student.id}
                      onClick={() => setSelectedPerformer(performer)}
                      className="flex items-center gap-3 p-3 hover:bg-gray-50 rounded-lg transition-colors cursor-pointer group"
                    >
                      <div className={`w-8 h-8 rounded-full flex items-center justify-center font-semibold text-sm flex-shrink-0 ${
                        index === 0 ? 'bg-yellow-400 text-yellow-900' :
                        index === 1 ? 'bg-gray-300 text-gray-700' :
                        index === 2 ? 'bg-orange-400 text-orange-900' :
                        'bg-gray-100 text-gray-600'
                      }`}>
                        {index + 1}
                      </div>
                      <div className="flex-1 min-w-0">
                        <h4 className="font-medium text-sm truncate">{performer.student.name}</h4>
                        <p className="text-xs text-gray-500">{performer.stats.totalTests} tests • {performer.student.department || 'N/A'}</p>
                      </div>
                      <div className="text-right">
                        <div className="text-sm font-semibold text-primary-600">
                          {performer.stats.averageScore}%
                        </div>
                        <div className="text-xs text-gray-500">avg score</div>
                      </div>
                      <Eye className="w-4 h-4 text-gray-400 opacity-0 group-hover:opacity-100 transition-opacity" />
                    </div>
                  ))}
                </div>
              )}
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
                  <div className="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center">
                    {test.icon === 'chart' && (
                      <svg className="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                      </svg>
                    )}
                    {test.icon === 'search' && (
                      <svg className="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                      </svg>
                    )}
                    {test.icon === 'database' && (
                      <svg className="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4" />
                      </svg>
                    )}
                    {test.icon === 'globe' && (
                      <svg className="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9" />
                      </svg>
                    )}
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

        {/* Performer Details Modal */}
        {selectedPerformer && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">
            <div className="p-6 border-b">
              <div className="flex items-start justify-between">
                <div className="flex items-center gap-4">
                  <div className="w-16 h-16 rounded-full bg-gradient-to-br from-primary-500 to-purple-600 flex items-center justify-center text-white font-bold text-2xl">
                    {selectedPerformer.student.name.charAt(0).toUpperCase()}
                  </div>
                  <div>
                    <h2 className="text-2xl font-bold text-gray-900">
                      {selectedPerformer.student.name}
                    </h2>
                    <p className="text-gray-600">{selectedPerformer.student.email}</p>
                  </div>
                </div>
                <button
                  onClick={() => setSelectedPerformer(null)}
                  className="p-2 hover:bg-gray-100 rounded-lg"
                >
                  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                  </svg>
                </button>
              </div>
            </div>

            <div className="p-6 space-y-6">
              {/* Performance Stats */}
              <div>
                <h3 className="text-lg font-semibold mb-3 flex items-center gap-2">
                  <TrendingUp className="w-5 h-5 text-primary-600" />
                  Performance Statistics
                </h3>
                <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                  <div className="p-4 bg-gray-50 rounded-lg">
                    <p className="text-sm text-gray-600">Total Tests</p>
                    <p className="text-2xl font-bold text-gray-900">{selectedPerformer.stats.totalTests}</p>
                  </div>
                  <div className="p-4 bg-blue-50 rounded-lg">
                    <p className="text-sm text-gray-600">Avg Score</p>
                    <p className="text-2xl font-bold text-blue-600">{selectedPerformer.stats.averageScore}%</p>
                  </div>
                  <div className="p-4 bg-green-50 rounded-lg">
                    <p className="text-sm text-gray-600">Highest</p>
                    <p className="text-2xl font-bold text-green-600">{selectedPerformer.stats.highestScore}%</p>
                  </div>
                  <div className="p-4 bg-orange-50 rounded-lg">
                    <p className="text-sm text-gray-600">Lowest</p>
                    <p className="text-2xl font-bold text-orange-600">{selectedPerformer.stats.lowestScore || 'N/A'}</p>
                  </div>
                </div>
              </div>

              {/* Course Performance */}
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                {selectedPerformer.stats.mostTakenCourse && (
                  <div className="p-4 bg-blue-50 rounded-lg border-2 border-blue-200">
                    <div className="flex items-center gap-2 mb-2">
                      <BookOpen className="w-5 h-5 text-blue-600" />
                      <h4 className="font-semibold text-gray-900">Most Taken Course</h4>
                    </div>
                    <p className="text-lg font-bold text-blue-600">
                      {selectedPerformer.stats.mostTakenCourse.code}
                    </p>
                    <p className="text-sm text-gray-600">
                      {selectedPerformer.stats.mostTakenCourse.title}
                    </p>
                    <p className="text-xs text-gray-500 mt-1">
                      {selectedPerformer.stats.mostTakenCourse.count} tests taken
                    </p>
                  </div>
                )}

                {selectedPerformer.stats.bestPerformingCourse && (
                  <div className="p-4 bg-green-50 rounded-lg border-2 border-green-200">
                    <div className="flex items-center gap-2 mb-2">
                      <Award className="w-5 h-5 text-green-600" />
                      <h4 className="font-semibold text-gray-900">Best Performing Course</h4>
                    </div>
                    <p className="text-lg font-bold text-green-600">
                      {selectedPerformer.stats.bestPerformingCourse.code}
                    </p>
                    <p className="text-sm text-gray-600">
                      {selectedPerformer.stats.bestPerformingCourse.title}
                    </p>
                    <p className="text-xs text-gray-500 mt-1">
                      Average: {selectedPerformer.stats.bestPerformingCourse.average}%
                    </p>
                  </div>
                )}
              </div>

              {/* Highest Scoring Test */}
              {selectedPerformer.stats.highestScoringTest && (
                <div className="p-4 bg-yellow-50 rounded-lg border-2 border-yellow-200">
                  <div className="flex items-center gap-2 mb-2">
                    <Award className="w-5 h-5 text-yellow-600" />
                    <h4 className="font-semibold text-gray-900">Highest Scoring Test</h4>
                  </div>
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="font-medium text-gray-900">
                        {selectedPerformer.stats.highestScoringTest.course} - {selectedPerformer.stats.highestScoringTest.title}
                      </p>
                    </div>
                    <span className="px-3 py-1 bg-yellow-200 text-yellow-900 rounded-full text-sm font-bold">
                      {selectedPerformer.stats.highestScoringTest.score}%
                    </span>
                  </div>
                </div>
              )}

              {/* Action Buttons */}
              <div className="flex gap-3 pt-4">
                <a
                  href={`/admin/students?student_id=${selectedPerformer.student.id}`}
                  className="flex-1 px-4 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700 text-center"
                >
                  View Full Profile
                </a>
                <button
                  onClick={() => setSelectedPerformer(null)}
                  className="px-4 py-2 border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50"
                >
                  Close
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
      </div>
    </AdminLayout>
  );
};

export default AdminDashboard;
