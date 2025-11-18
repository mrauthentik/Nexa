# NEXA - NOUN Exam Experience Assistant

A comprehensive Computer-Based Training (CBT) platform for NOUN students with course summaries, practice tests, scheduling, and analytics.

## 🚀 Features

### Student Features
- ✅ **Authentication** - Secure signup/signin with email
- ✅ **Course Summaries** - Browse and read course summaries by category
- ✅ **CBT Practice** - Take practice tests with timer and instant grading
- ✅ **Schedule Management** - Manage classes, assignments, and study sessions
- ✅ **Progress Tracking** - Track reading progress and test scores
- ✅ **Notifications** - Real-time notifications for assignments, grades, etc.
- ✅ **User Dashboard** - View stats, upcoming assignments, and recent activity
- ✅ **Settings** - Customize profile, notifications, and preferences
- ✅ **Dark Mode** - Toggle between light and dark themes

### Admin Features
- ✅ **Admin Dashboard** - View platform statistics and analytics
- ✅ **Create Summaries** - Add new course summaries with sections and topics
- ✅ **Create Tests** - Build CBT tests with multiple-choice questions
- ✅ **Student Management** - View all students and their performance
- ✅ **Test Analytics** - Monitor test submissions and average scores
- ✅ **Content Management** - Manage courses, summaries, and tests

## 🛠️ Tech Stack

### Frontend
- **React 18** with TypeScript
- **React Router** for navigation
- **TailwindCSS** for styling
- **Lucide React** for icons
- **Vite** for build tooling

### Backend
- **Supabase** for backend services
  - PostgreSQL database
  - Authentication
  - Row Level Security (RLS)
  - Edge Functions (Deno)
- **Deno** runtime for serverless functions

## 📋 Prerequisites

Before you begin, ensure you have:
- Node.js 18+ installed
- npm or yarn package manager
- Supabase account (free tier works)
- Supabase CLI installed

### Install Supabase CLI

**Windows (PowerShell):**
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

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone <your-repo-url>
cd Nexa
```

### 2. Set Up Supabase Project

1. Go to [supabase.com](https://supabase.com) and create a new project
2. Wait for the database to be provisioned
3. Get your project credentials:
   - Go to Project Settings > API
   - Copy the `Project URL` and `anon/public key`

### 3. Configure Environment Variables

Create a `.env` file in the `frontend` directory:

```env
VITE_SUPABASE_URL=your_supabase_project_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

### 4. Install Dependencies

**Frontend:**
```bash
cd frontend
npm install
```

### 5. Deploy Backend

**Login to Supabase:**
```bash
supabase login
```

**Link your project:**
```bash
cd backend
supabase link
```

**Run migrations:**
```bash
supabase db push
```

**Deploy edge functions:**
```powershell
# Windows
.\deploy.ps1

# Or manually deploy each function
supabase functions deploy signin --no-verify-jwt
supabase functions deploy signup --no-verify-jwt
# ... etc
```

### 6. Run Frontend

```bash
cd frontend
npm run dev
```

The app will be available at `http://localhost:5173`

## 📁 Project Structure

```
Nexa/
├── frontend/
│   ├── src/
│   │   ├── components/      # Reusable UI components
│   │   ├── pages/          # Page components
│   │   ├── context/        # React contexts (Auth, Theme)
│   │   ├── services/       # API service layer
│   │   ├── supabaseClient.ts
│   │   └── App.tsx
│   ├── public/
│   └── package.json
│
├── backend/
│   ├── supabase/
│   │   ├── functions/      # Edge functions
│   │   │   ├── signin/
│   │   │   ├── signup/
│   │   │   ├── get-summaries/
│   │   │   ├── create-summary/
│   │   │   ├── get-tests/
│   │   │   ├── create-test/
│   │   │   ├── submit-test/
│   │   │   └── ... (more functions)
│   │   └── migrations/     # Database migrations
│   │       ├── 001_initial_schema.sql
│   │       └── 002_seed_data.sql
│   └── deploy.ps1          # Deployment script
│
└── README.md
```

## 🗄️ Database Schema

### Core Tables
- **profiles** - User profiles (extends auth.users)
- **courses** - Course information
- **summaries** - Course summaries
- **summary_sections** - Summary sections
- **summary_topics** - Topics within sections
- **tests** - CBT tests/exams
- **questions** - Test questions
- **test_submissions** - Student test submissions
- **user_progress** - Reading progress tracking
- **schedule_classes** - Class schedule
- **assignments** - Student assignments
- **study_sessions** - Scheduled study sessions
- **notifications** - User notifications
- **user_settings** - User preferences
- **user_stats** - User statistics and analytics

## 🔐 Security

### Row Level Security (RLS)
All tables have RLS policies enabled:
- Students can only access their own data
- Admins have full access to manage content
- Public can view active courses and tests
- Submissions are private to the user

### Authentication
- Email/password authentication via Supabase Auth
- JWT tokens for API requests
- Secure password hashing
- Session management

## 📡 API Endpoints

### Authentication
- `POST /functions/v1/signup` - User registration
- `POST /functions/v1/signin` - User login

### Summaries
- `GET /functions/v1/get-summaries` - Get all summaries
- `GET /functions/v1/get-summary-detail?id=<id>` - Get summary details
- `POST /functions/v1/create-summary` - Create summary (admin)

### Tests
- `GET /functions/v1/get-tests` - Get all active tests
- `GET /functions/v1/get-test-questions?testId=<id>` - Get test questions
- `POST /functions/v1/create-test` - Create test (admin)
- `POST /functions/v1/submit-test` - Submit test answers

### User
- `GET /functions/v1/get-user-stats` - Get user statistics
- `POST /functions/v1/update-user-profile` - Update profile

### Schedule
- `GET /functions/v1/get-schedule` - Get user schedule
- `POST /functions/v1/create-schedule-item` - Add schedule item

### Notifications
- `GET /functions/v1/get-notifications` - Get notifications
- `POST /functions/v1/mark-notification-read` - Mark as read

### Admin
- `GET /functions/v1/get-admin-dashboard` - Get admin dashboard data

## 🎨 Customization

### Theme
The app supports light and dark modes. Theme preference is saved to localStorage.

### Colors
Primary colors are defined in `tailwind.config.js`:
```js
colors: {
  primary: {
    50: '#eff6ff',
    // ... more shades
    600: '#2563eb',
    // ... more shades
  }
}
```

## 🧪 Testing

### Create Test Admin User
After deployment, you can create an admin user:

```sql
-- Run in Supabase SQL Editor
UPDATE profiles 
SET role = 'admin' 
WHERE email = 'your-email@example.com';
```

### Test Data
Sample courses are seeded automatically via `002_seed_data.sql`

## 🚀 Deployment

### Frontend (Vercel/Netlify)
1. Connect your Git repository
2. Set environment variables
3. Deploy

### Backend (Supabase)
Backend is already deployed via edge functions. No additional hosting needed.

## 📝 Development Workflow

1. **Make changes** to frontend or backend
2. **Test locally** with `npm run dev`
3. **Deploy backend** with `.\deploy.ps1` (if functions changed)
4. **Deploy frontend** via your hosting platform
5. **Run migrations** if database schema changed

## 🐛 Troubleshooting

### Edge Functions Not Working
- Ensure you're logged in: `supabase login`
- Check project is linked: `supabase link`
- Verify environment variables are set
- Check function logs: `supabase functions logs <function-name>`

### Database Errors
- Reset database: `supabase db reset`
- Re-run migrations: `supabase db push`
- Check RLS policies in Supabase dashboard

### CORS Errors
- All edge functions include CORS headers
- Ensure you're using the correct Supabase URL
- Check browser console for specific errors

## 📚 Resources

- [Supabase Documentation](https://supabase.com/docs)
- [React Documentation](https://react.dev)
- [TailwindCSS Documentation](https://tailwindcss.com/docs)
- [Vite Documentation](https://vitejs.dev)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 👨‍💻 Author

Built with ❤️ for NOUN students

## 🎯 Roadmap

- [ ] Mobile app (React Native)
- [ ] Real-time collaboration
- [ ] Video lessons integration
- [ ] AI-powered study recommendations
- [ ] Gamification and leaderboards
- [ ] Offline mode
- [ ] PDF export for summaries
- [ ] Email notifications
- [ ] Payment integration for premium content

---

**Happy Learning! 🚀**
