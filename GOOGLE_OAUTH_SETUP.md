# Google OAuth Setup Guide

## Problem
When users sign in with Google, they were being redirected to `http://localhost:3000/#access_token=...` which showed "site cannot be reached" because there was no route to handle the OAuth callback.

## Solution Implemented
1. ✅ Created `AuthCallback.tsx` component to handle OAuth redirects
2. ✅ Added `/auth/callback` route in `App.tsx`
3. ✅ Updated `handleGoogleSignIn` to redirect to `/auth/callback`
4. ✅ Uncommented Google sign-in button in `AuthPage.tsx`

## Required Configuration Steps

### 1. Update Supabase Dashboard

Go to your Supabase project dashboard:

1. Navigate to **Authentication** → **Providers** → **Google**
2. Make sure Google OAuth is enabled
3. In the **Site URL** field, set:
   - For development: `http://localhost:3000`
   - For production: `https://yourdomain.com`
4. In the **Redirect URLs** field, add:
   - For development: `http://localhost:3000/auth/callback`
   - For production: `https://yourdomain.com/auth/callback`

### 2. Update Google Cloud Console

Go to [Google Cloud Console](https://console.cloud.google.com/):

1. Select your project
2. Navigate to **APIs & Services** → **Credentials**
3. Click on your OAuth 2.0 Client ID
4. Under **Authorized redirect URIs**, add:
   ```
   https://[YOUR-SUPABASE-PROJECT-REF].supabase.co/auth/v1/callback
   ```
   Replace `[YOUR-SUPABASE-PROJECT-REF]` with your actual Supabase project reference.
   
   You can find this in your Supabase dashboard under **Settings** → **API** → **Project URL**

5. Also add your application URLs:
   - Development: `http://localhost:3000/auth/callback`
   - Production: `https://yourdomain.com/auth/callback`

6. Click **Save**

### 3. Test the Flow

1. Start your development server:
   ```bash
   npm run dev
   ```

2. Navigate to `/auth`
3. Click "Sign in with Google"
4. Select your Google account
5. You should be redirected to `/auth/callback` (loading screen)
6. Then automatically redirected to `/dashboard`

## How It Works

```
User clicks "Sign in with Google"
    ↓
Redirected to Google OAuth consent screen
    ↓
User approves and Google redirects to:
https://[project].supabase.co/auth/v1/callback
    ↓
Supabase processes the OAuth response and redirects to:
http://localhost:3000/auth/callback#access_token=...
    ↓
AuthCallback component:
  - Extracts session from URL hash
  - Creates/updates user profile
  - Creates welcome notification
  - Redirects to /dashboard
```

## Troubleshooting

### "Site cannot be reached" error
- Make sure your dev server is running on port 3000
- Check that the redirect URL in Supabase matches your callback route

### "Redirect URI mismatch" error from Google
- Verify the redirect URI in Google Console matches exactly:
  `https://[YOUR-PROJECT-REF].supabase.co/auth/v1/callback`
- No trailing slashes
- Must use HTTPS (except localhost)

### User redirected but not signed in
- Check browser console for errors
- Verify Supabase environment variables are correct in `.env`
- Check that `detectSessionInUrl: true` is set in `supabaseClient.ts` (already configured)

### Profile not created
- Check Supabase logs in the dashboard
- Verify the `profiles` table exists and has correct permissions
- Check RLS policies allow inserts for authenticated users

## Environment Variables

Make sure your `.env` file has:
```env
VITE_SUPABASE_URL=https://[YOUR-PROJECT-REF].supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key
```

## Production Deployment

### ⚠️ CRITICAL: Fix "localhost:3000" Redirect in Production

If you're getting redirected to `localhost:3000` in production, follow these steps:

#### 1. Update Supabase Site URL (MOST IMPORTANT)
Go to Supabase Dashboard → **Authentication** → **URL Configuration**:

- **Site URL**: Change from `http://localhost:3000` to `https://your-production-domain.vercel.app`
- **Redirect URLs**: Add both:
  ```
  http://localhost:3000/auth/callback
  https://your-production-domain.vercel.app/auth/callback
  ```

#### 2. Update Google Console
Add your production callback URL:
```
https://your-production-domain.vercel.app/auth/callback
```

#### 3. Verify Environment Variables
Make sure your production environment has:
```env
VITE_SUPABASE_URL=https://pyepvpdvlwctiuw.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key
```

#### 4. Clear Browser Cache
After updating Supabase settings, clear your browser cache or test in incognito mode.

### Why This Happens
Supabase uses the **Site URL** setting to determine where to redirect users after OAuth. If it's still set to `localhost:3000`, all OAuth redirects will go there, even in production.

## Additional Notes

- Google OAuth users have `email_verified: true` by default
- User metadata from Google (name, avatar) is automatically saved
- A welcome notification is created for new users
- The callback handles both new user registration and existing user login
