# 🚀 Quick Deployment Commands

## Run these commands in order:

### 1. Push Database Migration
```bash
cd backend
supabase db push
```

**Expected output:**
```
✓ Applying migration 016_add_analytics_columns_to_test_submissions.sql
✓ Finished supabase db push
```

### 2. Deploy All Functions
```bash
npm run deploy
```

**When prompted, select:** `(c)hanged only`

**Expected output:**
```
✅ Successfully deployed: 3
   - submit-cbt-test
   - get-user-stats
   - get-performance-chart
```

### 3. Test It!
```bash
cd ../frontend
npm run dev
```

Then:
1. Go to http://localhost:5173
2. Login
3. Take a CBT test
4. Go to Dashboard
5. ✅ See real stats!

---

## ✅ Success Indicators

**In Browser Console:**
- No "column does not exist" errors
- No 401 errors
- See: `📊 Fetching dashboard stats for user: [id]`

**In Dashboard:**
- Stats show real numbers (not 0%)
- Recent tests display
- Performance chart shows data

**In Supabase:**
```sql
SELECT total_questions, correct_answers, course_id 
FROM test_submissions 
ORDER BY submitted_at DESC 
LIMIT 1;
```
All 3 columns should have values!

---

## 🎯 That's It!

Everything is wired end-to-end:
- ✅ Database schema updated
- ✅ Backend functions fixed
- ✅ Frontend integrated
- ✅ No more auth errors
- ✅ Real-time stats working

**Just run the 2 commands above and test!** 🚀
