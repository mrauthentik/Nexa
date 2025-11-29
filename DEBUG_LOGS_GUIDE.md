# Debug Logs Guide - Google OAuth

## How to View Logs

### On Production (nexaedu.ng)
1. Open the website in your browser
2. Press **F12** (or right-click → Inspect)
3. Go to the **Console** tab
4. Click "Sign in with Google"
5. Watch the logs appear

### What to Look For

## Step 1: When You Click "Sign in with Google"

You should see these logs in order:

```
🔵 Google Sign-In initiated
📍 Current origin: https://nexaedu.ng
🔗 Redirect URL: https://nexaedu.ng/auth/callback
🌐 Full current URL: https://nexaedu.ng/auth
✅ OAuth response: { data: {...}, error: null }
🚀 Redirecting to Google...
```

### ✅ Good Signs:
- Current origin shows your production domain (`nexaedu.ng`)
- Redirect URL includes `/auth/callback`
- No error in OAuth response

### ❌ Bad Signs:
- Current origin shows `localhost:3000`
- Redirect URL is missing `/auth/callback`
- OAuth response has an error

---

## Step 2: After Selecting Google Account

You'll be redirected back. Check the URL in the address bar:

### ✅ Correct URL:
```
https://nexaedu.ng/auth/callback#access_token=...
```

### ❌ Wrong URL:
```
https://nexaedu.ng/#access_token=...
```
(Missing `/auth/callback`)

If you see the wrong URL, the problem is in **Supabase Redirect URLs configuration**.

---

## Step 3: On the Callback Page

You should see these logs:

```
🔄 AuthCallback component mounted
📍 Current URL: https://nexaedu.ng/auth/callback#access_token=...
🔗 Hash fragment: #access_token=...&expires_at=...
📂 Pathname: /auth/callback
📦 Session data: { hasSession: true, error: undefined }
✅ Session found for user: user@example.com
👤 User metadata: { full_name: "...", email: "...", ... }
```

Then either:

### For New Users:
```
📝 Profile not found, creating new profile...
👤 Creating profile with data: { id: "...", email: "...", ... }
✅ Profile created successfully
📬 Creating welcome notification...
✅ Welcome notification created
🎉 Sign-in successful, redirecting to dashboard...
```

### For Existing Users:
```
✅ Profile already exists
🎉 Sign-in successful, redirecting to dashboard...
```

---

## Common Issues and Their Logs

### Issue 1: Stuck on Landing Page
**Logs show:**
```
🔵 Google Sign-In initiated
📍 Current origin: https://nexaedu.ng
🔗 Redirect URL: https://nexaedu.ng/auth/callback
```

**But URL shows:**
```
https://nexaedu.ng/#access_token=...
```

**Problem:** Supabase Redirect URLs doesn't include `/auth/callback`

**Fix:** Add `https://nexaedu.ng/auth/callback` to Supabase Dashboard → Authentication → URL Configuration → Redirect URLs

---

### Issue 2: "No session found" Error
**Logs show:**
```
🔄 AuthCallback component mounted
📍 Current URL: https://nexaedu.ng/auth/callback#access_token=...
📦 Session data: { hasSession: false, error: undefined }
⚠️ No session found in callback
```

**Problem:** Supabase can't extract the session from the URL hash

**Possible causes:**
1. Token expired (check `expires_at` in URL)
2. Supabase environment variables incorrect
3. Browser blocking cookies/storage

**Fix:** 
- Check Vercel environment variables
- Try in incognito mode
- Check browser console for storage errors

---

### Issue 3: Profile Creation Failed
**Logs show:**
```
📝 Profile not found, creating new profile...
👤 Creating profile with data: {...}
❌ Error creating profile: { code: "...", message: "..." }
```

**Problem:** Database permission or constraint issue

**Common errors:**
- `42501`: Permission denied (RLS policy issue)
- `23505`: Duplicate key (user already exists)
- `23514`: Check constraint violation (invalid data)

**Fix:**
- Check Supabase RLS policies for `profiles` table
- Verify table constraints
- Check if user already exists in database

---

### Issue 4: Redirecting to localhost
**Logs show:**
```
🔵 Google Sign-In initiated
📍 Current origin: http://localhost:3000
```

**Problem:** You're testing on localhost, not production

**This is normal for local development!**

---

## Quick Checklist

Before testing, verify:

- [ ] Code is deployed to production
- [ ] Supabase Site URL = `https://nexaedu.ng`
- [ ] Supabase Redirect URLs includes `https://nexaedu.ng/auth/callback`
- [ ] Google Console includes both:
  - `https://pyepvpdvlwcwhjwctiuw.supabase.co/auth/v1/callback`
  - `https://nexaedu.ng/auth/callback`
- [ ] Testing in incognito/private mode (to avoid cache)
- [ ] Browser console is open (F12)

---

## How to Share Logs

If you need help, copy the console logs:

1. Right-click in the Console tab
2. Select "Save as..."
3. Or take a screenshot showing the full console output

Include:
- The logs from clicking "Sign in with Google"
- The URL in the address bar after redirect
- Any error messages (in red)
