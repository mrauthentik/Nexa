import { lazy, Suspense } from 'react'
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom'
import { ThemeProvider } from './context/ThemeContext'
import { AuthProvider } from './context/AuthContext'
import './App.css'
import ProtectedRoute from './components/ProtectedRoute'
import ErrorBoundary from './components/ErrorBoundary'
import LoadingSpinner from './components/LoadingSpinner'
import CookieConsent from './components/CookieConsent'
import AuthCallback from './components/AuthCallback'

// ─── Public Pages (lazy loaded) ───────────────────────────────────────────────
const LandingPage       = lazy(() => import('./pages/LandingPage'))
const AuthPage          = lazy(() => import('./pages/AuthPage'))
const ForgotPasswordPage = lazy(() => import('./pages/ForgotPasswordPage'))
const PricingPage       = lazy(() => import('./pages/PricingPage'))
const FeaturesPage      = lazy(() => import('./pages/FeaturesPage'))
const BlogPage          = lazy(() => import('./pages/BlogPage'))
const DocumentationPage = lazy(() => import('./pages/DocumentationPage'))
const PrivacyPolicyPage = lazy(() => import('./pages/PrivacyPolicyPage'))
const TermsOfServicePage = lazy(() => import('./pages/TermsOfServicePage'))
const CookiePolicyPage  = lazy(() => import('./pages/CookiePolicyPage'))
const SitemapPage       = lazy(() => import('./pages/SitemapPage'))
const ContactPage       = lazy(() => import('./pages/ContactPage'))
const NounCentersPage   = lazy(() => import('./pages/NounCentersPage'))
const NotFoundPage      = lazy(() => import('./pages/NotFoundPage'))

// ─── Protected Student Pages (lazy loaded) ───────────────────────────────────
const Dashboard         = lazy(() => import('./pages/Dashboard'))
const SettingsPage      = lazy(() => import('./pages/SettingsPage'))
const BillingPage       = lazy(() => import('./pages/BillingPage'))
const WalletPage        = lazy(() => import('./pages/WalletPage'))
const LearnPage         = lazy(() => import('./pages/LearnPage'))
const SummariesPage     = lazy(() => import('./pages/SummariesPage'))
const SummaryDetailPage = lazy(() => import('./pages/SummaryDetailPage'))
const SchedulePage      = lazy(() => import('./pages/SchedulePage'))
const CBTPracticePage   = lazy(() => import('./pages/CBTPracticePage'))
const CBTInstructionPage = lazy(() => import('./pages/CBTInstructionPage'))
const CBTTestPage       = lazy(() => import('./pages/CBTTestPage'))
const CBTResultsPage    = lazy(() => import('./pages/CBTResultsPage'))
const NotificationsPage = lazy(() => import('./pages/NotificationsPage'))
const GetHelpPage       = lazy(() => import('./pages/GetHelpPage'))

// ─── Admin-only Pages (lazy loaded, separate chunk) ───────────────────────────
// These are in a separate group so they can be in their own JS chunk.
// Students never download admin code.
const AdminDashboard    = lazy(() => import('./pages/AdminDashboard'))
const AdminStudents     = lazy(() => import('./pages/AdminStudents'))
const AdminAnalytics    = lazy(() => import('./pages/AdminAnalytics'))
const AdminMessages     = lazy(() => import('./pages/AdminMessages'))
const AdminAnnouncements = lazy(() => import('./pages/AdminAnnouncements'))
const AdminBlog         = lazy(() => import('./pages/AdminBlog'))
const AdminSurveysPage  = lazy(() => import('./pages/AdminSurveysPage'))
const AdminAddSummary   = lazy(() => import('./pages/AdminAddSummary'))
const AdminAddQuestions = lazy(() => import('./pages/AdminAddQuestions'))

// ─── Page Loading Fallback ────────────────────────────────────────────────────
const PageLoader = () => (
  <div className="min-h-screen flex items-center justify-center bg-gray-50 dark:bg-gray-900">
    <LoadingSpinner />
  </div>
)

function App() {
  return (
    <ErrorBoundary>
      <ThemeProvider>
        <AuthProvider>
          <Router>
            <CookieConsent />
            <Suspense fallback={<PageLoader />}>
              <Routes>
                {/* Public Routes */}
                <Route path="/" element={<LandingPage />} />
                <Route path="/auth" element={<AuthPage />} />
                <Route path="/auth/callback" element={<AuthCallback />} />
                <Route path="/forgot-password" element={<ForgotPasswordPage />} />
                <Route path="/pricing" element={<PricingPage />} />
                <Route path="/features" element={<FeaturesPage />} />
                <Route path="/blog" element={<BlogPage />} />
                <Route path="/docs" element={<DocumentationPage />} />
                <Route path="/privacy" element={<PrivacyPolicyPage />} />
                <Route path="/terms" element={<TermsOfServicePage />} />
                <Route path="/cookie-policy" element={<CookiePolicyPage />} />
                <Route path="/sitemap" element={<SitemapPage />} />
                <Route path="/contact" element={<ContactPage />} />
                <Route path="/centers" element={<NounCentersPage />} />

                {/* Protected Student Routes */}
                <Route path="/dashboard" element={<ProtectedRoute><Dashboard /></ProtectedRoute>} />
                <Route path="/settings" element={<ProtectedRoute><SettingsPage /></ProtectedRoute>} />
                <Route path="/billing" element={<ProtectedRoute><BillingPage /></ProtectedRoute>} />
                <Route path="/wallet" element={<ProtectedRoute><WalletPage /></ProtectedRoute>} />
                <Route path="/learn" element={<ProtectedRoute><LearnPage /></ProtectedRoute>} />
                <Route path="/summaries" element={<ProtectedRoute><SummariesPage /></ProtectedRoute>} />
                <Route path="/summaries/:id" element={<ProtectedRoute><SummaryDetailPage /></ProtectedRoute>} />
                <Route path="/schedule" element={<ProtectedRoute><SchedulePage /></ProtectedRoute>} />
                <Route path="/cbt" element={<ProtectedRoute><CBTPracticePage /></ProtectedRoute>} />
                <Route path="/cbt-practice" element={<Navigate to="/cbt" replace />} />
                <Route path="/cbt/instruction/:courseId" element={<ProtectedRoute><CBTInstructionPage /></ProtectedRoute>} />
                <Route path="/cbt/test/:courseId" element={<ProtectedRoute><CBTTestPage /></ProtectedRoute>} />
                <Route path="/cbt/results" element={<ProtectedRoute><CBTResultsPage /></ProtectedRoute>} />
                <Route path="/notifications" element={<ProtectedRoute><NotificationsPage /></ProtectedRoute>} />
                <Route path="/help" element={<ProtectedRoute><GetHelpPage /></ProtectedRoute>} />

                {/* Admin Only Routes */}
                <Route path="/admin" element={<ProtectedRoute requireAdmin><AdminDashboard /></ProtectedRoute>} />
                <Route path="/admin/students" element={<ProtectedRoute requireAdmin><AdminStudents /></ProtectedRoute>} />
                <Route path="/admin/analytics" element={<ProtectedRoute requireAdmin><AdminAnalytics /></ProtectedRoute>} />
                <Route path="/admin/messages" element={<ProtectedRoute requireAdmin><AdminMessages /></ProtectedRoute>} />
                <Route path="/admin/announcements" element={<ProtectedRoute requireAdmin><AdminAnnouncements /></ProtectedRoute>} />
                <Route path="/admin/blog" element={<ProtectedRoute requireAdmin><AdminBlog /></ProtectedRoute>} />
                <Route path="/admin/surveys" element={<ProtectedRoute requireAdmin><AdminSurveysPage /></ProtectedRoute>} />
                <Route path="/admin/add-summary" element={<ProtectedRoute requireAdmin><AdminAddSummary /></ProtectedRoute>} />
                <Route path="/admin/add-questions" element={<ProtectedRoute requireAdmin><AdminAddQuestions /></ProtectedRoute>} />

                {/* 404 Page */}
                <Route path="*" element={<NotFoundPage />} />
              </Routes>
            </Suspense>
          </Router>
        </AuthProvider>
      </ThemeProvider>
    </ErrorBoundary>
  )
}

export default App
