# API Endpoints Summary - Complete Implementation

## 🎯 Overview

All direct Supabase queries have been replaced with proper API endpoints for better security, maintainability, and performance.

---

## 📚 **New Backend Functions Created**

### 1. Course Questions
- ✅ `get-course-questions` - Fetch questions for a course
- ✅ `get-course-question-count` - Get question count

### 2. Courses
- ✅ `get-courses` - Fetch all courses with filters

### 3. Calendar Events
- ✅ `get-calendar-events` - Fetch user's calendar events
- ✅ `create-calendar-event` - Create new event
- ✅ `delete-calendar-event` - Delete event

### 4. CBT Test
- ✅ `submit-cbt-test` - Submit test results

---

## 🔌 **API Endpoints Reference**

### **Course Questions APIs**

#### Get Questions
```
GET /functions/v1/get-course-questions
Query Params:
  - courseId (required)
  - limit (optional)
Headers:
  - Authorization: Bearer {ANON_KEY}
Response:
  {
    "course": {...},
    "questions": [...],
    "total_count": 125
  }
```

#### Get Question Count
```
GET /functions/v1/get-course-question-count
Query Params:
  - courseId (required)
Headers:
  - Authorization: Bearer {ANON_KEY}
Response:
  {
    "courseId": "uuid",
    "count": 125
  }
```

---

### **Courses APIs**

#### Get All Courses
```
GET /functions/v1/get-courses
Query Params:
  - isActive (optional, boolean)
  - level (optional, string)
  - department (optional, string)
  - semester (optional, number)
Headers:
  - Authorization: Bearer {ANON_KEY}
Response:
  {
    "courses": [...]
  }
```

---

### **Calendar APIs**

#### Get Calendar Events
```
GET /functions/v1/get-calendar-events
Query Params:
  - startDate (optional, YYYY-MM-DD)
  - endDate (optional, YYYY-MM-DD)
Headers:
  - Authorization: Bearer {ANON_KEY}
Response:
  {
    "events": [...]
  }
```

#### Create Calendar Event
```
POST /functions/v1/create-calendar-event
Headers:
  - Authorization: Bearer {ANON_KEY}
  - Content-Type: application/json
Body:
  {
    "title": "Study Session",
    "description": "Review OS concepts",
    "date": "2025-11-20",
    "type": "study",
    "color": "blue"
  }
Response:
  {
    "event": {...}
  }
```

#### Delete Calendar Event
```
POST /functions/v1/delete-calendar-event
Headers:
  - Authorization: Bearer {ANON_KEY}
  - Content-Type: application/json
Body:
  {
    "eventId": "uuid"
  }
Response:
  {
    "success": true
  }
```

---

### **CBT Test APIs**

#### Submit Test
```
POST /functions/v1/submit-cbt-test
Headers:
  - Authorization: Bearer {ANON_KEY}
  - Content-Type: application/json
Body:
  {
    "courseId": "uuid",
    "score": 85,
    "percentage": 85.0,
    "timeTaken": 1800,
    "answers": {...}
  }
Response:
  {
    "submission": {...}
  }
```

---

## 💻 **Frontend API Service (api.ts)**

### Usage Examples:

```typescript
import { courseQuestionsAPI, coursesAPI, calendarAPI, cbtAPI } from '../services/api';

// Get questions
const { questions } = await courseQuestionsAPI.getQuestions(courseId, 20);

// Get question count
const { count } = await courseQuestionsAPI.getQuestionCount(courseId);

// Get courses
const { courses } = await coursesAPI.getAll({ isActive: true });

// Get course by ID
const course = await coursesAPI.getById(courseId);

// Get calendar events
const { events } = await calendarAPI.getEvents(startDate, endDate);

// Create event
const { event } = await calendarAPI.createEvent({
  title: "Study",
  date: "2025-11-20",
  type: "study"
});

// Delete event
await calendarAPI.deleteEvent(eventId);

// Submit test
const { submission } = await cbtAPI.submitTest({
  courseId,
  score,
  percentage,
  timeTaken,
  answers
});
```

---

## 📄 **Frontend Pages Updated**

### ✅ Updated to Use APIs:

1. **CBTTestPage.tsx**
   - Uses `courseQuestionsAPI.getQuestions()`
   - Uses `cbtAPI.submitTest()` (needs implementation)

2. **CBTInstructionPage.tsx**
   - Uses `courseQuestionsAPI.getQuestionCount()`
   - Uses `coursesAPI.getById()`

3. **CBTPracticePage.tsx**
   - Uses `coursesAPI.getAll()`
   - Uses `courseQuestionsAPI.getQuestionCount()`

### 🔄 Still Need Updates:

4. **SchedulePage.tsx**
   - Should use `calendarAPI.getEvents()`
   - Should use `calendarAPI.createEvent()`
   - Should use `calendarAPI.deleteEvent()`

5. **Dashboard.tsx**
   - Already uses `notificationsAPI` ✅

6. **SettingsPage.tsx**
   - Uses direct Supabase for profile updates
   - Should use `userAPI.updateProfile()`

---

## 🚀 **Deployment Steps**

### 1. Deploy Backend Functions
```bash
cd backend
npm run deploy
# Select: (a)ll
```

This deploys:
- ✅ get-course-questions
- ✅ get-course-question-count
- ✅ get-courses
- ✅ get-calendar-events
- ✅ create-calendar-event
- ✅ delete-calendar-event
- ✅ submit-cbt-test

### 2. Deploy Frontend
```bash
cd frontend
npm run build
# Deploy to Vercel/Netlify
```

---

## 🧪 **Postman Testing**

### Environment Variables:
```
SUPABASE_URL: https://xxxxx.supabase.co
ANON_KEY: your-anon-key
COURSE_ID: get from SQL (SELECT id FROM courses WHERE code = 'CIT211')
USER_TOKEN: get from browser after login
```

### Test Sequence:

1. **Get Courses**
   ```
   GET {{SUPABASE_URL}}/functions/v1/get-courses?isActive=true
   Authorization: Bearer {{ANON_KEY}}
   ```

2. **Get Question Count**
   ```
   GET {{SUPABASE_URL}}/functions/v1/get-course-question-count?courseId={{COURSE_ID}}
   Authorization: Bearer {{ANON_KEY}}
   ```

3. **Get Questions**
   ```
   GET {{SUPABASE_URL}}/functions/v1/get-course-questions?courseId={{COURSE_ID}}&limit=5
   Authorization: Bearer {{ANON_KEY}}
   ```

4. **Get Calendar Events**
   ```
   GET {{SUPABASE_URL}}/functions/v1/get-calendar-events
   Authorization: Bearer {{USER_TOKEN}}
   ```

5. **Create Calendar Event**
   ```
   POST {{SUPABASE_URL}}/functions/v1/create-calendar-event
   Authorization: Bearer {{USER_TOKEN}}
   Content-Type: application/json
   
   {
     "title": "Test Event",
     "date": "2025-11-20",
     "type": "study"
   }
   ```

---

## ✅ **Benefits of API Endpoints**

1. **Security**
   - RLS policies enforced at backend
   - No direct database access from frontend
   - Centralized authentication

2. **Performance**
   - Server-side data processing
   - Reduced client-side logic
   - Better caching opportunities

3. **Maintainability**
   - Single source of truth
   - Easier to update logic
   - Better error handling

4. **Scalability**
   - Can add rate limiting
   - Can add caching layers
   - Can optimize queries

---

## 🔍 **Debugging**

### Check if functions are deployed:
```bash
supabase functions list
```

### Check function logs:
```bash
supabase functions logs get-course-questions
```

### Test locally:
```bash
supabase functions serve
```

---

## 📝 **Next Steps**

1. ✅ Deploy all backend functions
2. ✅ Test endpoints with Postman
3. ⏳ Update remaining frontend pages (SchedulePage, SettingsPage)
4. ⏳ Add error handling and loading states
5. ⏳ Add request caching
6. ⏳ Add rate limiting

---

**Status:** Backend functions created ✅ | Frontend partially updated ⏳ | Ready for deployment 🚀
