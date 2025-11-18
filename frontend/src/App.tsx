import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import { ThemeProvider } from './context/ThemeContext'
import { AuthProvider } from './context/AuthContext'
import ProtectedRoute from './components/ProtectedRoute'
import LandingPage from './pages/LandingPage'
import AuthPage from './pages/AuthPage'
import Dashboard from './pages/Dashboard'
import AdminDashboard from './pages/AdminDashboard'
import SettingsPage from './pages/SettingsPage'
import PricingPage from './pages/PricingPage'
import SummariesPage from './pages/SummariesPage'
import SummaryDetailPage from './pages/SummaryDetailPage'
import SchedulePage from './pages/SchedulePage'
import CBTPracticePage from './pages/CBTPracticePage'
import AdminAddSummary from './pages/AdminAddSummary'
import AdminAddQuestions from './pages/AdminAddQuestions'

function App() {
  return (
    <ThemeProvider>
      <AuthProvider>
        <Router>
          <Routes>
            <Route path="/" element={<LandingPage />} />
            <Route path="/auth" element={<AuthPage />} />
            <Route path="/pricing" element={<PricingPage />} />
            
            {/* Protected Student Routes */}
            <Route path="/dashboard" element={<ProtectedRoute><Dashboard /></ProtectedRoute>} />
            <Route path="/settings" element={<ProtectedRoute><SettingsPage /></ProtectedRoute>} />
            <Route path="/summaries" element={<ProtectedRoute><SummariesPage /></ProtectedRoute>} />
            <Route path="/summaries/:id" element={<ProtectedRoute><SummaryDetailPage /></ProtectedRoute>} />
            <Route path="/schedule" element={<ProtectedRoute><SchedulePage /></ProtectedRoute>} />
            <Route path="/cbt-practice" element={<ProtectedRoute><CBTPracticePage /></ProtectedRoute>} />
            
            {/* Admin Only Routes */}
            <Route path="/admin" element={<ProtectedRoute requireAdmin><AdminDashboard /></ProtectedRoute>} />
            <Route path="/admin/add-summary" element={<ProtectedRoute requireAdmin><AdminAddSummary /></ProtectedRoute>} />
            <Route path="/admin/add-questions" element={<ProtectedRoute requireAdmin><AdminAddQuestions /></ProtectedRoute>} />
          </Routes>
        </Router>
      </AuthProvider>
    </ThemeProvider>
  )
}

export default App
