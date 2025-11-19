# Notification System - Complete Implementation Guide

## 🔔 **Overview**

A comprehensive notification system with automatic triggers, backend endpoints, and a beautiful UI notification center.

---

## 📦 **Components**

### **1. Database Triggers (Auto-Notifications)**
Location: `backend/supabase/migrations/014_notification_triggers.sql`

**Triggers Created:**
1. ✅ **Test Submission** - Notifies when user submits a test
   - Score ≥ 80%: "Excellent Performance! 🎉"
   - Score ≥ 50%: "Test Completed ✅"
   - Score < 50%: "Keep Practicing! 💪"

2. ✅ **Perfect Score** - Special notification for 100% scores
   - "Perfect Score! 🌟"

3. ✅ **Study Streak** - Milestone notifications
   - Triggers at: 3, 5, 7, 10, 14, 21, 30 days
   - "Study Streak! 🔥"

4. ✅ **Event Creation** - When user creates calendar event
   - "Event Created 📅"

5. ✅ **Event Reminders** - Daily reminders for tomorrow's events
   - "Upcoming Event Reminder 🔔"
   - Run via cron job

6. ✅ **Welcome Message** - For new users
   - "Welcome to NEXA! 🎉"

---

### **2. Backend Endpoints**

**Existing:**
- ✅ `GET /get-notifications` - Fetch all notifications
- ✅ `POST /mark-notification-read` - Mark single as read

**New:**
- ✅ `POST /delete-notification` - Delete notification
- ✅ `POST /mark-all-notifications-read` - Mark all as read

---

### **3. Frontend Components**

**New Component:**
- ✅ `NotificationCenter.tsx` - Beautiful slide-in notification panel

**Features:**
- ✅ Unread count badge
- ✅ Filter: All / Unread
- ✅ Mark as read (single)
- ✅ Mark all as read
- ✅ Delete notification
- ✅ Time ago display
- ✅ Icon per notification type
- ✅ Link to related page
- ✅ Dark mode support

---

## 🚀 **Deployment Steps**

### **Step 1: Deploy Database Triggers**

Run in Supabase SQL Editor:
```sql
-- Copy entire content of 014_notification_triggers.sql
-- Paste and run in SQL Editor
```

Or via migration:
```bash
cd backend
npm run deploy
# Select: (a)ll
```

---

### **Step 2: Verify Triggers**

Check if triggers exist:
```sql
SELECT 
  trigger_name,
  event_object_table,
  action_statement
FROM information_schema.triggers
WHERE trigger_schema = 'public'
ORDER BY event_object_table;
```

Expected triggers:
- `test_submission_notification` on `test_submissions`
- `perfect_score_notification` on `test_submissions`
- `study_streak_notification` on `test_submissions`
- `event_creation_notification` on `calendar_events`
- `new_user_notification` on `profiles`

---

### **Step 3: Test Notifications**

**Test 1: Submit a test**
```
1. Go to CBT Practice
2. Take a test
3. Submit
4. Check notifications - should see test score notification
```

**Test 2: Create calendar event**
```
1. Go to Schedule
2. Create new event
3. Check notifications - should see event creation notification
```

**Test 3: Perfect score**
```
1. Take a test
2. Answer all correctly (100%)
3. Submit
4. Check notifications - should see perfect score notification
```

---

## 🎨 **Notification Types & Icons**

| Type | Icon | Color | Use Case |
|------|------|-------|----------|
| `success` | ✓ CheckCircle | Green | Test passed, action completed |
| `info` | ℹ Info | Blue | General information |
| `warning` | ⚠ AlertCircle | Yellow | Low score, attention needed |
| `error` | ✕ AlertCircle | Red | Failed action, error |
| `achievement` | 🏆 Award | Purple | Perfect score, streak milestone |
| `reminder` | 📅 Calendar | Blue | Upcoming events |
| `announcement` | ✨ Sparkles | Pink | Welcome, updates |

---

## 💻 **Frontend Integration**

### **Add to Dashboard/Layout:**

```tsx
import { useState } from 'react';
import { Bell } from 'lucide-react';
import NotificationCenter from '../components/NotificationCenter';

const YourComponent = () => {
  const [showNotifications, setShowNotifications] = useState(false);
  const [unreadCount, setUnreadCount] = useState(0);

  return (
    <>
      {/* Notification Bell Button */}
      <button
        onClick={() => setShowNotifications(true)}
        className="relative p-2 rounded-lg hover:bg-gray-100"
      >
        <Bell size={24} />
        {unreadCount > 0 && (
          <span className="absolute -top-1 -right-1 bg-red-500 text-white text-xs font-bold rounded-full w-5 h-5 flex items-center justify-center">
            {unreadCount}
          </span>
        )}
      </button>

      {/* Notification Center */}
      <NotificationCenter
        isOpen={showNotifications}
        onClose={() => setShowNotifications(false)}
      />
    </>
  );
};
```

---

## 🔄 **API Usage**

```typescript
import { notificationsAPI } from '../services/api';

// Get all notifications
const { data, unreadCount } = await notificationsAPI.getAll();

// Mark as read
await notificationsAPI.markAsRead(notificationId);

// Mark all as read
await notificationsAPI.markAllAsRead();

// Delete notification
await notificationsAPI.delete(notificationId);
```

---

## 📊 **Database Schema**

```sql
CREATE TABLE notifications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  type TEXT NOT NULL, -- success, info, warning, error, achievement, reminder, announcement
  title TEXT NOT NULL,
  message TEXT NOT NULL,
  link TEXT, -- Optional link to related page
  read BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index for performance
CREATE INDEX idx_notifications_user_id ON notifications(user_id);
CREATE INDEX idx_notifications_read ON notifications(read);
CREATE INDEX idx_notifications_created_at ON notifications(created_at DESC);
```

---

## 🎯 **Notification Scenarios**

### **Test Submission:**
```
Trigger: User submits test
Condition: Always
Notification:
  - Score ≥ 80: "Excellent Performance! 🎉" (success)
  - Score ≥ 50: "Test Completed ✅" (info)
  - Score < 50: "Keep Practicing! 💪" (warning)
```

### **Perfect Score:**
```
Trigger: User scores 100%
Condition: score = 100
Notification: "Perfect Score! 🌟" (achievement)
```

### **Study Streak:**
```
Trigger: User submits test
Condition: Consecutive days = 3, 5, 7, 10, 14, 21, 30
Notification: "Study Streak! 🔥 You've practiced for X days" (achievement)
```

### **Event Creation:**
```
Trigger: User creates calendar event
Condition: Always
Notification: "Event Created 📅" (info)
```

### **Event Reminder:**
```
Trigger: Daily cron job
Condition: Event date = tomorrow
Notification: "Upcoming Event Reminder 🔔" (reminder)
```

### **Welcome Message:**
```
Trigger: New user signs up
Condition: New profile created
Notification: "Welcome to NEXA! 🎉" (announcement)
```

---

## 🔧 **Customization**

### **Add New Notification Type:**

1. **Create trigger function:**
```sql
CREATE OR REPLACE FUNCTION notify_custom_event()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO notifications (user_id, type, title, message, link)
  VALUES (
    NEW.user_id,
    'info',
    'Custom Event!',
    'Your custom message here',
    '/custom-link'
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```

2. **Create trigger:**
```sql
CREATE TRIGGER custom_event_notification
AFTER INSERT ON your_table
FOR EACH ROW
EXECUTE FUNCTION notify_custom_event();
```

---

## 🐛 **Troubleshooting**

### **Notifications not appearing:**
1. Check if triggers are created:
   ```sql
   SELECT * FROM information_schema.triggers WHERE trigger_schema = 'public';
   ```

2. Check if notifications table has data:
   ```sql
   SELECT * FROM notifications ORDER BY created_at DESC LIMIT 10;
   ```

3. Check trigger function logs:
   ```sql
   SELECT * FROM pg_stat_user_functions WHERE funcname LIKE 'notify%';
   ```

### **Trigger not firing:**
1. Verify trigger exists on correct table
2. Check trigger event (AFTER INSERT, BEFORE UPDATE, etc.)
3. Test trigger function manually:
   ```sql
   SELECT notify_test_submission();
   ```

### **Frontend not showing notifications:**
1. Check browser console for errors
2. Verify API endpoint is deployed
3. Check authentication token
4. Verify CORS headers

---

## ✅ **Testing Checklist**

- [ ] Test submission creates notification
- [ ] Perfect score creates achievement notification
- [ ] Study streak creates milestone notification
- [ ] Event creation creates notification
- [ ] Notification center opens/closes
- [ ] Unread count displays correctly
- [ ] Mark as read works
- [ ] Mark all as read works
- [ ] Delete notification works
- [ ] Filter (All/Unread) works
- [ ] Time ago displays correctly
- [ ] Icons display for each type
- [ ] Links navigate correctly
- [ ] Dark mode works

---

## 📈 **Future Enhancements**

- [ ] Push notifications (browser)
- [ ] Email notifications
- [ ] SMS notifications
- [ ] Notification preferences
- [ ] Notification categories
- [ ] Notification sound
- [ ] Notification grouping
- [ ] Real-time updates (WebSocket)
- [ ] Notification history page
- [ ] Export notifications

---

**Status:** Database Triggers ✅ | Backend Endpoints ✅ | Frontend UI ✅ | Ready to Deploy 🚀
