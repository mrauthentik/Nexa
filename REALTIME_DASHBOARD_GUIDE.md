# Real-Time Dashboard Implementation Guide

## ✅ **Backend Endpoint Created**

### **`get-user-stats` Endpoint**

**URL:** `GET /functions/v1/get-user-stats`

**Returns:**
```json
{
  "stats": {
    "totalTests": 15,
    "averageScore": 78,
    "courseProgress": 45,
    "attendance": 87
  },
  "performanceData": [
    {
      "date": "2025-11-01",
      "score": 75,
      "tests": 2
    }
    // ... 30 days of data
  ],
  "recentTests": [
    {
      "id": "uuid",
      "score": 85,
      "total_questions": 20,
      "correct_answers": 17,
      "created_at": "2025-11-19T10:00:00Z",
      "course_code": "CIT211",
      "course_title": "Introduction to Operating Systems"
    }
  ]
}
```

---

## 📊 **What Each Stat Means**

### **1. Course Progress**
- **Calculation:** (Courses with tests taken / Total active courses) × 100
- **Example:** If 5 out of 11 courses have tests taken = 45%
- **Updates:** Real-time when user takes test in new course

### **2. Attendance**
- **Calculation:** (Tests taken this week / 3 expected tests) × 100
- **Example:** 2 tests this week = 67% attendance
- **Updates:** Real-time when user takes tests
- **Cap:** Maximum 100%

### **3. Average Score**
- **Calculation:** Sum of all test scores / Total tests
- **Example:** (75 + 80 + 85) / 3 = 80%
- **Updates:** Real-time after each test submission

### **4. Performance Chart (30 Days)**
- **Shows:** Daily average score for last 30 days
- **X-axis:** Dates
- **Y-axis:** Average score (0-100%)
- **Updates:** Real-time, refreshes every 30 seconds

---

## 🚀 **Deployment Steps**

### **Step 1: Deploy Backend**

```bash
cd backend
npm run deploy
# Choose: (a)ll
```

This deploys the updated `get-user-stats` endpoint.

### **Step 2: Test Endpoint**

**In Postman:**
```
GET https://pyepvpdvlwcwhjwctiuw.supabase.co/functions/v1/get-user-stats

Headers:
Authorization: Bearer YOUR_ANON_KEY
```

**Expected Response:**
```json
{
  "stats": {
    "totalTests": 0,
    "averageScore": 0,
    "courseProgress": 0,
    "attendance": 0
  },
  "performanceData": [...],
  "recentTests": []
}
```

---

## 💻 **Frontend Integration**

### **Dashboard.tsx Changes Needed:**

**1. Import API:**
```tsx
import { dashboardAPI } from '../services/api';
```

**2. Add State:**
```tsx
const [dashboardStats, setDashboardStats] = useState<any>(null);
const [loading, setLoading] = useState(true);
```

**3. Fetch Data:**
```tsx
useEffect(() => {
  if (user) {
    fetchDashboardStats();
    
    // Refresh every 30 seconds
    const interval = setInterval(fetchDashboardStats, 30000);
    return () => clearInterval(interval);
  }
}, [user]);

const fetchDashboardStats = async () => {
  try {
    const data = await dashboardAPI.getStats();
    setDashboardStats(data);
  } catch (error) {
    console.error('Error fetching dashboard stats:', error);
  } finally {
    setLoading(false);
  }
};
```

**4. Replace Mock Stats:**
```tsx
// OLD (line ~93):
const stats = [
  { label: 'Course Progress', value: '48%', ... },
  { label: 'Attendance', value: '97%', ... },
  { label: 'Avg Score', value: '86%', ... },
];

// NEW:
const stats = dashboardStats ? [
  { 
    label: 'Course Progress', 
    value: `${dashboardStats.stats.courseProgress}%`, 
    change: 'Based on courses attempted', 
    trend: 'up', 
    color: 'bg-orange-200' 
  },
  { 
    label: 'Attendance', 
    value: `${dashboardStats.stats.attendance}%`, 
    change: `${dashboardStats.stats.totalTests} tests this week`, 
    trend: 'up', 
    color: 'bg-green-200' 
  },
  { 
    label: 'Avg Score', 
    value: `${dashboardStats.stats.averageScore}%`, 
    change: `${dashboardStats.stats.totalTests} tests taken`, 
    trend: dashboardStats.stats.averageScore >= 70 ? 'up' : 'down', 
    color: 'bg-blue-200' 
  },
] : [
  { label: 'Course Progress', value: '0%', change: 'No data yet', trend: 'up', color: 'bg-orange-200' },
  { label: 'Attendance', value: '0%', change: 'No data yet', trend: 'up', color: 'bg-green-200' },
  { label: 'Avg Score', value: '0%', change: 'No data yet', trend: 'up', color: 'bg-blue-200' },
];
```

**5. Update Performance Chart (line ~550):**
```tsx
// Replace the mock SVG path with real data
{dashboardStats?.performanceData && (
  <svg className="absolute inset-0 w-full h-full" preserveAspectRatio="none">
    <path
      d={generateChartPath(dashboardStats.performanceData)}
      fill="url(#chartGradient)"
      className="transition-all duration-500"
    />
    <path
      d={generateChartPath(dashboardStats.performanceData)}
      stroke="url(#lineGradient)"
      strokeWidth="3"
      fill="none"
      className="transition-all duration-500"
    />
  </svg>
)}

// Helper function to generate SVG path from data
const generateChartPath = (data: any[]) => {
  const width = 196; // Chart width
  const height = 160; // Chart height
  const points = data.slice(-7); // Last 7 days
  
  const xStep = width / (points.length - 1);
  const yScale = height / 100; // 0-100 scale
  
  let path = `M 0,${height - (points[0].score * yScale)}`;
  
  points.forEach((point, i) => {
    if (i > 0) {
      const x = i * xStep;
      const y = height - (point.score * yScale);
      path += ` L ${x},${y}`;
    }
  });
  
  return path;
};
```

---

## 🧪 **Testing**

### **Test 1: Take a Test**
1. Go to CBT Practice
2. Take CIT211 test
3. Submit
4. Go back to Dashboard
5. **Expected:** Stats updated immediately

### **Test 2: Check Chart**
1. Take tests on different days
2. Check Performance Overview chart
3. **Expected:** Shows your scores over time

### **Test 3: Auto-Refresh**
1. Open Dashboard
2. Wait 30 seconds
3. **Expected:** Stats refresh automatically

---

## 📈 **How Stats Update**

### **Course Progress:**
```
Initial: 0% (no courses attempted)
After CIT211 test: 9% (1 of 11 courses)
After CSC201 test: 18% (2 of 11 courses)
```

### **Attendance:**
```
Monday: Take 1 test = 33%
Tuesday: Take 1 test = 67%
Wednesday: Take 1 test = 100%
Thursday: Take 1 test = 100% (capped)
```

### **Average Score:**
```
Test 1: 75% → Average: 75%
Test 2: 85% → Average: 80%
Test 3: 90% → Average: 83%
```

---

## 🎯 **Quick Implementation**

**Minimal changes to Dashboard.tsx:**

1. **Line 5:** Add import
```tsx
import { dashboardAPI } from '../services/api';
```

2. **Line 17-18:** Add state
```tsx
const [dashboardStats, setDashboardStats] = useState<any>(null);
const [loading, setLoading] = useState(true);
```

3. **Line 50-59:** Add fetch function
```tsx
const fetchDashboardStats = async () => {
  try {
    const data = await dashboardAPI.getStats();
    setDashboardStats(data);
  } catch (error) {
    console.error('Error:', error);
  } finally {
    setLoading(false);
  }
};
```

4. **Line 24:** Call in useEffect
```tsx
fetchDashboardStats();
```

5. **Line 93-97:** Replace stats array with real data (see above)

---

## ✅ **Benefits**

1. ✅ **Real-Time Updates** - Stats refresh every 30 seconds
2. ✅ **Accurate Data** - Calculated from actual test submissions
3. ✅ **Performance Tracking** - 30-day chart shows progress
4. ✅ **Motivation** - See improvement over time
5. ✅ **No Mock Data** - Everything is real!

---

## 🐛 **Troubleshooting**

### **Stats show 0:**
- User hasn't taken any tests yet
- Take a test and stats will update

### **Endpoint returns error:**
- Deploy backend: `npm run deploy`
- Check function logs: `supabase functions logs get-user-stats`

### **Chart not updating:**
- Check browser console for errors
- Verify `dashboardStats.performanceData` exists

---

**Status:** Backend ✅ | Frontend Integration ⏳ | Ready to Deploy 🚀
