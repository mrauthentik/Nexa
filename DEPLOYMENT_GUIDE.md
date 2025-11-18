# 🚀 NEXA Deployment Guide

Complete step-by-step guide to deploy the NEXA platform.

## 📋 Pre-Deployment Checklist

- [ ] Supabase account created
- [ ] Supabase CLI installed
- [ ] Node.js 18+ installed
- [ ] Git repository set up
- [ ] Domain name (optional)

## 🗄️ Step 1: Set Up Supabase Project

### 1.1 Create Supabase Project

1. Go to [https://supabase.com](https://supabase.com)
2. Click "New Project"
3. Fill in project details:
   - **Name**: Nexa
   - **Database Password**: (save this securely!)
   - **Region**: Choose closest to your users
4. Click "Create new project"
5. Wait 2-3 minutes for provisioning

### 1.2 Get Project Credentials

1. Go to **Project Settings** → **API**
2. Copy and save:
   - **Project URL** (e.g., `https://xxxxx.supabase.co`)
   - **anon/public key** (starts with `eyJ...`)
   - **service_role key** (for admin operations)

### 1.3 Configure Authentication

1. Go to **Authentication** → **Providers**
2. Enable **Email** provider
3. Configure email templates (optional):
   - Go to **Authentication** → **Email Templates**
   - Customize confirmation and password reset emails

## 🔧 Step 2: Deploy Backend

### 2.1 Install Supabase CLI

**Windows:**
```powershell
scoop install supabase
```

**macOS:**
```bash
brew install supabase/tap/supabase
```

**Linux:**
```bash
npm install -g supabase
```

### 2.2 Login to Supabase

```bash
supabase login
```

This will open a browser for authentication.

### 2.3 Link Your Project

```bash
cd backend
supabase link --project-ref your-project-ref
```

**To find your project ref:**
- Go to Supabase Dashboard
- Project Settings → General
- Copy the "Reference ID"

### 2.4 Run Database Migrations

```bash
supabase db push
```

This will:
- Create all database tables
- Set up Row Level Security policies
- Seed sample data
- Create triggers and functions

**Verify migration:**
```bash
supabase db diff
```

### 2.5 Deploy Edge Functions

**Option A: Use deployment script (Recommended)**
```powershell
# Windows
.\deploy.ps1
```

**Option B: Deploy manually**
```bash
# Deploy all functions
supabase functions deploy signin --no-verify-jwt
supabase functions deploy signup --no-verify-jwt
supabase functions deploy get-summaries --no-verify-jwt
supabase functions deploy get-summary-detail --no-verify-jwt
supabase functions deploy create-summary --no-verify-jwt
supabase functions deploy get-tests --no-verify-jwt
supabase functions deploy get-test-questions --no-verify-jwt
supabase functions deploy create-test --no-verify-jwt
supabase functions deploy submit-test --no-verify-jwt
supabase functions deploy get-notifications --no-verify-jwt
supabase functions deploy mark-notification-read --no-verify-jwt
supabase functions deploy get-schedule --no-verify-jwt
supabase functions deploy create-schedule-item --no-verify-jwt
supabase functions deploy get-user-stats --no-verify-jwt
supabase functions deploy update-user-profile --no-verify-jwt
supabase functions deploy get-admin-dashboard --no-verify-jwt
```

**Verify deployment:**
```bash
supabase functions list
```

### 2.6 Test Edge Functions

```bash
# Test signin function
curl -X POST https://your-project-ref.supabase.co/functions/v1/signin \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"testpass123"}'
```

## 🎨 Step 3: Deploy Frontend

### 3.1 Configure Environment Variables

Create `.env` file in `frontend/` directory:

```env
VITE_SUPABASE_URL=https://your-project-ref.supabase.co
VITE_SUPABASE_ANON_KEY=your_anon_key_here
```

### 3.2 Install Dependencies

```bash
cd frontend
npm install
```

### 3.3 Build for Production

```bash
npm run build
```

This creates an optimized build in the `dist/` folder.

### 3.4 Deploy to Hosting Platform

#### Option A: Vercel (Recommended)

1. Install Vercel CLI:
```bash
npm install -g vercel
```

2. Deploy:
```bash
vercel
```

3. Follow prompts:
   - Link to existing project or create new
   - Set build command: `npm run build`
   - Set output directory: `dist`

4. Set environment variables in Vercel dashboard:
   - Go to Project Settings → Environment Variables
   - Add `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY`

5. Redeploy:
```bash
vercel --prod
```

#### Option B: Netlify

1. Install Netlify CLI:
```bash
npm install -g netlify-cli
```

2. Deploy:
```bash
netlify deploy --prod
```

3. Configure:
   - Build command: `npm run build`
   - Publish directory: `dist`

4. Set environment variables in Netlify dashboard

#### Option C: GitHub Pages

1. Install gh-pages:
```bash
npm install -D gh-pages
```

2. Add to `package.json`:
```json
{
  "scripts": {
    "deploy": "gh-pages -d dist"
  }
}
```

3. Deploy:
```bash
npm run build
npm run deploy
```

## 👤 Step 4: Create Admin User

After deployment, create your first admin user:

### 4.1 Sign Up as Normal User

1. Go to your deployed app
2. Click "Sign Up"
3. Create account with your email

### 4.2 Promote to Admin

1. Go to Supabase Dashboard
2. Click **SQL Editor**
3. Run this query (replace with your email):

```sql
UPDATE profiles 
SET role = 'admin' 
WHERE email = 'your-email@example.com';
```

4. Refresh your app and navigate to `/admin`

## ✅ Step 5: Verification

### 5.1 Test User Features

- [ ] Sign up new user
- [ ] Sign in
- [ ] View summaries
- [ ] Take a practice test
- [ ] Add schedule item
- [ ] Check notifications
- [ ] Update profile settings

### 5.2 Test Admin Features

- [ ] Access admin dashboard
- [ ] Create new summary
- [ ] Create new test
- [ ] View student list
- [ ] View test submissions

### 5.3 Test Security

- [ ] Non-admin cannot access `/admin`
- [ ] Users can only see their own data
- [ ] RLS policies are working

## 🔒 Step 6: Security Hardening

### 6.1 Enable Email Confirmation

1. Go to **Authentication** → **Settings**
2. Enable "Enable email confirmations"
3. Users must verify email before accessing app

### 6.2 Set Up Custom SMTP (Optional)

1. Go to **Project Settings** → **Auth**
2. Enable "Custom SMTP"
3. Configure your email service (SendGrid, Mailgun, etc.)

### 6.3 Configure Password Requirements

1. Go to **Authentication** → **Settings**
2. Set minimum password length
3. Require special characters (optional)

### 6.4 Enable Rate Limiting

Supabase automatically rate limits, but you can adjust:
1. Go to **Project Settings** → **API**
2. Configure rate limits per endpoint

## 📊 Step 7: Monitoring & Analytics

### 7.1 Enable Supabase Logs

1. Go to **Logs** in Supabase Dashboard
2. Monitor:
   - API requests
   - Database queries
   - Edge function invocations
   - Authentication events

### 7.2 Set Up Alerts

1. Go to **Project Settings** → **Alerts**
2. Configure alerts for:
   - High error rates
   - Slow queries
   - Database size limits

### 7.3 Monitor Performance

```bash
# Check function logs
supabase functions logs <function-name>

# Check database performance
# Go to Supabase Dashboard → Database → Performance
```

## 🔄 Step 8: Continuous Deployment

### 8.1 GitHub Actions (Recommended)

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy

on:
  push:
    branches: [ main ]

jobs:
  deploy-backend:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: supabase/setup-cli@v1
      - run: supabase link --project-ref ${{ secrets.SUPABASE_PROJECT_REF }}
      - run: supabase db push
      - run: supabase functions deploy --project-ref ${{ secrets.SUPABASE_PROJECT_REF }}
    env:
      SUPABASE_ACCESS_TOKEN: ${{ secrets.SUPABASE_ACCESS_TOKEN }}

  deploy-frontend:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
      - run: npm install
      - run: npm run build
      - uses: vercel/action@v1
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
```

### 8.2 Set GitHub Secrets

1. Go to GitHub Repository → Settings → Secrets
2. Add:
   - `SUPABASE_ACCESS_TOKEN`
   - `SUPABASE_PROJECT_REF`
   - `VERCEL_TOKEN`

## 🐛 Troubleshooting

### Database Migration Failed

```bash
# Reset database (WARNING: Deletes all data)
supabase db reset

# Re-run migrations
supabase db push
```

### Edge Functions Not Working

```bash
# Check function logs
supabase functions logs <function-name> --tail

# Redeploy specific function
supabase functions deploy <function-name> --no-verify-jwt
```

### CORS Errors

- All functions include CORS headers
- Check that `VITE_SUPABASE_URL` matches your project URL
- Ensure you're using HTTPS in production

### Authentication Issues

```bash
# Check auth settings
# Go to Supabase Dashboard → Authentication → Settings

# Verify email templates are configured
# Go to Authentication → Email Templates
```

## 📝 Post-Deployment Tasks

- [ ] Set up custom domain
- [ ] Configure SSL certificate
- [ ] Set up backup strategy
- [ ] Create admin documentation
- [ ] Train admin users
- [ ] Monitor initial usage
- [ ] Collect user feedback
- [ ] Plan feature updates

## 🎯 Performance Optimization

### Database Optimization

```sql
-- Add indexes for frequently queried columns
CREATE INDEX idx_summaries_category ON summaries(category);
CREATE INDEX idx_tests_status ON tests(status);
CREATE INDEX idx_notifications_user_read ON notifications(user_id, read);
```

### Frontend Optimization

```bash
# Analyze bundle size
npm run build -- --analyze

# Enable code splitting
# Already configured in Vite
```

### CDN Configuration

- Enable CDN for static assets
- Configure caching headers
- Use image optimization

## 🔐 Backup Strategy

### Automated Backups

Supabase Pro includes:
- Daily automated backups
- Point-in-time recovery
- 7-day retention

### Manual Backup

```bash
# Export database
supabase db dump > backup.sql

# Import database
supabase db reset
psql -h db.xxxxx.supabase.co -U postgres -d postgres < backup.sql
```

## 📞 Support

- **Supabase Docs**: https://supabase.com/docs
- **Supabase Discord**: https://discord.supabase.com
- **GitHub Issues**: Create issue in your repository

---

**Congratulations! 🎉 Your NEXA platform is now live!**
