# 🔌 NEXA Integration Guide

Complete guide to connect frontend components to backend APIs.

---

## 📋 Overview

The backend is **100% ready** with all APIs deployed. The frontend UI is **100% complete**. This guide shows you exactly how to connect them.

---

## 🎯 Quick Integration Checklist

### Phase 1: Authentication (30 minutes)
- [ ] Connect AuthPage to signup/signin APIs
- [ ] Add loading states
- [ ] Add error handling
- [ ] Test login flow

### Phase 2: Dashboard (45 minutes)
- [ ] Fetch user stats from API
- [ ] Load notifications
- [ ] Display assignments
- [ ] Add loading spinner

### Phase 3: Summaries (30 minutes)
- [ ] Fetch summaries list
- [ ] Implement search/filter
- [ ] Load summary details
- [ ] Track reading progress

### Phase 4: CBT Practice (45 minutes)
- [ ] Load available tests
- [ ] Fetch test questions
- [ ] Submit answers
- [ ] Display results

### Phase 5: Schedule (30 minutes)
- [ ] Load user schedule
- [ ] Create schedule items
- [ ] Update/delete items

### Phase 6: Admin Features (45 minutes)
- [ ] Connect admin dashboard
- [ ] Test summary creation
- [ ] Test question creation
- [ ] View analytics

---

## 🔧 Step-by-Step Integration

### 1. Connect AuthPage

**File**: `frontend/src/pages/AuthPage.tsx`

**Current Code** (lines 13-17):
```typescript
const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    // Handle authentication logic here
    console.log('Form submitted:', formData);
};
```

**Replace With**:
```typescript
import { useAuth } from '../context/AuthContext';
import { useNavigate } from 'react-router-dom';
import { useState } from 'react';

const AuthPage = () => {
    const { signIn, signUp } = useAuth();
    const navigate = useNavigate();
    const [isLogin, setIsLogin] = useState(true);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState('');
    const [formData, setFormData] = useState({
        email: '',
        password: '',
        confirmPassword: '',
        fullName: '',
    });

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setError('');
        setLoading(true);

        try {
            if (isLogin) {
                await signIn(formData.email, formData.password);
                navigate('/dashboard');
            } else {
                if (formData.password !== formData.confirmPassword) {
                    setError('Passwords do not match');
                    return;
                }
                await signUp(formData.email, formData.password, formData.fullName);
                navigate('/dashboard');
            }
        } catch (err: any) {
            setError(err.message || 'Authentication failed');
        } finally {
            setLoading(false);
        }
    };

    // ... rest of component
};
```

**Add Error Display** (after form):
```typescript
{error && (
    <div className="mt-4 p-3 bg-red-50 border border-red-200 rounded-lg">
        <p className="text-sm text-red-600">{error}</p>
    </div>
)}
```

**Update Submit Button**:
```typescript
<button
    type="submit"
    disabled={loading}
    className="flex-1 px-4 sm:px-6 py-2.5 sm:py-3 text-sm sm:text-base bg-primary-600 hover:bg-primary-700 rounded-lg transition-colors font-medium shadow-md hover:shadow-lg disabled:opacity-50"
    style={{ color: '#ffffff' }}
>
    {loading ? 'Please wait...' : (isLogin ? 'Sign In' : 'Sign Up')}
</button>
```

---

### 2. Connect Dashboard

**File**: `frontend/src/pages/Dashboard.tsx`

**Add at the top**:
```typescript
import { useEffect, useState } from 'react';
import { userAPI, notificationsAPI } from '../services/api';
import LoadingSpinner from '../components/LoadingSpinner';
import ErrorMessage from '../components/ErrorMessage';

const Dashboard = () => {
    const [stats, setStats] = useState<any>(null);
    const [notifications, setNotifications] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState('');

    useEffect(() => {
        fetchDashboardData();
    }, []);

    const fetchDashboardData = async () => {
        try {
            setLoading(true);
            const [statsData, notifData] = await Promise.all([
                userAPI.getStats(),
                notificationsAPI.getAll()
            ]);
            
            setStats(statsData);
            setNotifications(notifData.data || []);
        } catch (err: any) {
            setError(err.message);
        } finally {
            setLoading(false);
        }
    };

    if (loading) return <LoadingSpinner fullScreen message="Loading dashboard..." />;
    if (error) return <ErrorMessage message={error} onRetry={fetchDashboardData} />;

    // ... rest of component with real data
};
```

---

### 3. Connect SummariesPage

**File**: `frontend/src/pages/SummariesPage.tsx`

**Add at the top**:
```typescript
import { useEffect, useState } from 'react';
import { summariesAPI } from '../services/api';
import LoadingSpinner from '../components/LoadingSpinner';

const SummariesPage = () => {
    const [summaries, setSummaries] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [selectedCategory, setSelectedCategory] = useState('All Courses');
    const [searchQuery, setSearchQuery] = useState('');

    useEffect(() => {
        fetchSummaries();
    }, [selectedCategory, searchQuery]);

    const fetchSummaries = async () => {
        try {
            setLoading(true);
            const { data } = await summariesAPI.getAll(
                selectedCategory !== 'All Courses' ? selectedCategory : undefined,
                searchQuery || undefined
            );
            setSummaries(data || []);
        } catch (error) {
            console.error('Error fetching summaries:', error);
        } finally {
            setLoading(false);
        }
    };

    if (loading) return <LoadingSpinner fullScreen />;

    // ... rest of component
};
```

---

### 4. Connect CBTPracticePage

**File**: `frontend/src/pages/CBTPracticePage.tsx`

**Add at the top**:
```typescript
import { useEffect, useState } from 'react';
import { testsAPI } from '../services/api';
import { useToast } from '../hooks/useToast';

const CBTPracticePage = () => {
    const [tests, setTests] = useState<any[]>([]);
    const [selectedTest, setSelectedTest] = useState<any>(null);
    const [questions, setQuestions] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const { success, error: showError } = useToast();

    useEffect(() => {
        fetchTests();
    }, []);

    const fetchTests = async () => {
        try {
            const { data } = await testsAPI.getAll();
            setTests(data || []);
        } catch (err) {
            showError('Failed to load tests');
        } finally {
            setLoading(false);
        }
    };

    const startTest = async (test: any) => {
        try {
            const { questions: testQuestions } = await testsAPI.getQuestions(test.id);
            setQuestions(testQuestions);
            setSelectedTest(test);
            setExamStarted(true);
        } catch (err) {
            showError('Failed to load test questions');
        }
    };

    const handleSubmitExam = async () => {
        try {
            const result = await testsAPI.submit(
                selectedTest.id,
                answers,
                timeLeft
            );
            setScore(result.correctAnswers);
            setExamSubmitted(true);
            success(`Test submitted! Score: ${result.percentage}%`);
        } catch (err) {
            showError('Failed to submit test');
        }
    };

    // ... rest of component
};
```

---

### 5. Connect Admin Add Summary

**File**: `frontend/src/pages/AdminAddSummary.tsx`

**Update handleSubmit** (line 72):
```typescript
import { summariesAPI } from '../services/api';
import { useNavigate } from 'react-router-dom';
import { useToast } from '../hooks/useToast';

const AdminAddSummary = () => {
    const navigate = useNavigate();
    const { success, error: showError } = useToast();
    const [loading, setLoading] = useState(false);

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);

        try {
            const summaryData = {
                ...summaryForm,
                sections: sections
            };
            
            await summariesAPI.create(summaryData);
            success('Summary created successfully!');
            navigate('/admin');
        } catch (err: any) {
            showError(err.message || 'Failed to create summary');
        } finally {
            setLoading(false);
        }
    };

    // ... rest of component
};
```

---

### 6. Connect Admin Add Questions

**File**: `frontend/src/pages/AdminAddQuestions.tsx`

**Update handleSubmit** (line 66):
```typescript
import { testsAPI } from '../services/api';
import { useNavigate } from 'react-router-dom';
import { useToast } from '../hooks/useToast';

const AdminAddQuestions = () => {
    const navigate = useNavigate();
    const { success, error: showError } = useToast();
    const [loading, setLoading] = useState(false);

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);

        try {
            const testData = {
                ...testForm,
                questions: questions,
                totalQuestions: questions.length,
            };
            
            await testsAPI.create(testData);
            success('Test created successfully!');
            navigate('/admin');
        } catch (err: any) {
            showError(err.message || 'Failed to create test');
        } finally {
            setLoading(false);
        }
    };

    // ... rest of component
};
```

---

### 7. Add Protected Routes

**File**: `frontend/src/App.tsx`

**Update routes**:
```typescript
import ProtectedRoute from './components/ProtectedRoute';

function App() {
  return (
    <ThemeProvider>
      <AuthProvider>
        <Router>
          <Routes>
            <Route path="/" element={<LandingPage />} />
            <Route path="/auth" element={<AuthPage />} />
            
            {/* Protected Student Routes */}
            <Route path="/dashboard" element={
              <ProtectedRoute>
                <Dashboard />
              </ProtectedRoute>
            } />
            <Route path="/summaries" element={
              <ProtectedRoute>
                <SummariesPage />
              </ProtectedRoute>
            } />
            <Route path="/summaries/:id" element={
              <ProtectedRoute>
                <SummaryDetailPage />
              </ProtectedRoute>
            } />
            <Route path="/cbt-practice" element={
              <ProtectedRoute>
                <CBTPracticePage />
              </ProtectedRoute>
            } />
            <Route path="/schedule" element={
              <ProtectedRoute>
                <SchedulePage />
              </ProtectedRoute>
            } />
            <Route path="/settings" element={
              <ProtectedRoute>
                <SettingsPage />
              </ProtectedRoute>
            } />
            
            {/* Protected Admin Routes */}
            <Route path="/admin" element={
              <ProtectedRoute requireAdmin>
                <AdminDashboard />
              </ProtectedRoute>
            } />
            <Route path="/admin/add-summary" element={
              <ProtectedRoute requireAdmin>
                <AdminAddSummary />
              </ProtectedRoute>
            } />
            <Route path="/admin/add-questions" element={
              <ProtectedRoute requireAdmin>
                <AdminAddQuestions />
              </ProtectedRoute>
            } />
            
            <Route path="/pricing" element={<PricingPage />} />
          </Routes>
        </Router>
      </AuthProvider>
    </ThemeProvider>
  );
}
```

---

## 🧪 Testing Integration

### Test Authentication
```typescript
// 1. Go to /auth
// 2. Sign up with: test@example.com / password123 / Test User
// 3. Should redirect to /dashboard
// 4. Sign out
// 5. Sign in with same credentials
```

### Test Dashboard
```typescript
// 1. Sign in
// 2. Dashboard should show real stats
// 3. Notifications should load
// 4. Assignments should display
```

### Test Summaries
```typescript
// 1. Go to /summaries
// 2. Should see list of summaries
// 3. Click on a summary
// 4. Should see full content
```

### Test CBT
```typescript
// 1. Go to /cbt-practice
// 2. Select a test
// 3. Answer questions
// 4. Submit test
// 5. See results
```

### Test Admin
```typescript
// 1. Promote user to admin (SQL)
// 2. Go to /admin
// 3. Create new summary
// 4. Create new test
// 5. View analytics
```

---

## 🐛 Common Issues & Solutions

### Issue: "Unauthorized" error
**Solution**: Check that `.env` file has correct Supabase credentials

### Issue: CORS error
**Solution**: All functions include CORS headers. Check Supabase URL is correct

### Issue: "Cannot read property of undefined"
**Solution**: Add optional chaining (`?.`) and null checks

### Issue: Loading forever
**Solution**: Check browser console for errors. Verify API endpoint is correct

---

## 📊 Integration Progress Tracker

```
Authentication        [ ] Not Started  [ ] In Progress  [ ] Complete
Dashboard            [ ] Not Started  [ ] In Progress  [ ] Complete
Summaries            [ ] Not Started  [ ] In Progress  [ ] Complete
CBT Practice         [ ] Not Started  [ ] In Progress  [ ] Complete
Schedule             [ ] Not Started  [ ] In Progress  [ ] Complete
Notifications        [ ] Not Started  [ ] In Progress  [ ] Complete
Settings             [ ] Not Started  [ ] In Progress  [ ] Complete
Admin Dashboard      [ ] Not Started  [ ] In Progress  [ ] Complete
Admin Add Summary    [ ] Not Started  [ ] In Progress  [ ] Complete
Admin Add Questions  [ ] Not Started  [ ] In Progress  [ ] Complete
```

---

## ✅ Final Checklist

- [ ] All pages load without errors
- [ ] Authentication works (signup/signin/signout)
- [ ] Protected routes redirect to /auth
- [ ] Admin routes require admin role
- [ ] Loading states show while fetching
- [ ] Error messages display properly
- [ ] Success messages show on actions
- [ ] Dark mode persists
- [ ] Responsive on mobile
- [ ] All forms validate input

---

**Estimated Integration Time: 3-4 hours**

**You've got all the tools. Just connect the dots! 🚀**
