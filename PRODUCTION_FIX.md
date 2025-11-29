# Production OAuth Fix - Step by Step

## Current Issue
When users sign in with Google on production (`nexaedu.ng`), they get redirected to:
```
nexaedu.ng/#access_token=...
```
Instead of:
```
nexaedu.ng/auth/callback#access_token=...
```

## Root Cause
Supabase is ignoring the `redirectTo` parameter and using the Site URL instead. This happens when the redirect URL is not in the allowed list.

## Solution Steps

### Step 1: Update Supabase Redirect URLs

1. Go to [Supabase Dashboard](https://supabase.com/dashboard)
2. Select your project
3. Navigate to **Authentication** → **URL Configuration**
4. Find the **Redirect URLs** section (NOT Site URL)
5. Add these URLs (one per line):
   ```
   http://localhost:3000/auth/callback
   https://nexaedu.ng/auth/callback
   https://www.nexaedu.ng/auth/callback
   ```
6. **Important**: Remove any entries that are just the root domain without `/auth/callback`
7. Click **Save**

### Step 2: Verify Site URL
While you're there, make sure **Site URL** is set to:
```
https://nexaedu.ng
```

### Step 3: Clear Vercel Cache (if needed)

If changes don't take effect:

1. Go to your Vercel dashboard
2. Find your deployment
3. Click **Redeploy** → **Use existing build cache: OFF**
4. Or trigger a new deployment by pushing a small change

### Step 4: Test

1. Open an incognito/private browser window
2. Go to `https://nexaedu.ng/auth`
3. Click "Sign in with Google"
4. After selecting your Google account, you should be redirected to:
   ```
   https://nexaedu.ng/auth/callback#access_token=...
   ```
5. You should see a loading spinner briefly
6. Then be redirected to `/dashboard`

## Troubleshooting

### Still redirecting to root `/`?

**Check Supabase Redirect URLs:**
- Make sure `/auth/callback` is in the list
- No typos
- Must include `https://`
- Save the changes

**Check Google Console:**
Go to [Google Cloud Console](https://console.cloud.google.com/):
1. APIs & Services → Credentials
2. Your OAuth 2.0 Client ID
3. Authorized redirect URIs should include:
   ```
   https://pyepvpdvlwcwhjwctiuw.supabase.co/auth/v1/callback
   https://nexaedu.ng/auth/callback
   ```

### Getting "Invalid redirect URL" error?

This means the URL is not in Supabase's allowed list. Double-check Step 1.

### User gets stuck on callback page?

Check browser console for errors. Common issues:
- Supabase environment variables not set in Vercel
- Database connection issues
- RLS policies blocking profile creation

### How to check if code is deployed?

Visit: `https://nexaedu.ng/auth/callback` directly
- If you see a loading spinner → Code is deployed ✅
- If you see 404 → Code not deployed ❌

## Expected Flow

```
User clicks "Sign in with Google" on nexaedu.ng/auth
    ↓
Code sends: redirectTo = "https://nexaedu.ng/auth/callback"
    ↓
Google OAuth consent screen
    ↓
User approves
    ↓
Google redirects to: https://pyepvpdvlwcwhjwctiuw.supabase.co/auth/v1/callback
    ↓
Supabase processes OAuth
    ↓
Supabase checks: Is "https://nexaedu.ng/auth/callback" in allowed list?
    ↓
YES → Redirects to: https://nexaedu.ng/auth/callback#access_token=...
NO  → Redirects to Site URL: https://nexaedu.ng/#access_token=...
    ↓
AuthCallback component processes token
    ↓
Creates/updates user profile
    ↓
Redirects to: /dashboard
```

## Quick Checklist

- [ ] Supabase Site URL = `https://nexaedu.ng`
- [ ] Supabase Redirect URLs includes `https://nexaedu.ng/auth/callback`
- [ ] Google Console includes `https://pyepvpdvlwcwhjwctiuw.supabase.co/auth/v1/callback`
- [ ] Google Console includes `https://nexaedu.ng/auth/callback`
- [ ] Code is deployed to production (check by visiting `/auth/callback`)
- [ ] Tested in incognito mode

## Still Not Working?

If you've done all the above and it's still not working, check:

1. **Vercel Environment Variables:**
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_ANON_KEY`

2. **Supabase Logs:**
   - Go to Supabase Dashboard → Logs
   - Check for any errors during OAuth

3. **Browser Console:**
   - Open DevTools (F12)
   - Check Console tab for errors
   - Check Network tab for failed requests

4. **Database Permissions:**
   - Make sure RLS policies allow authenticated users to insert into `profiles` table
