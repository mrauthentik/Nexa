# Nexa Backend Deployment Script
# This script deploys Supabase edge functions and runs migrations

Write-Host "🚀 Nexa Backend Deployment Script" -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan
Write-Host ""

# Check if Supabase CLI is installed
$supabaseCmd = "supabase"
if (-not (Get-Command supabase -ErrorAction SilentlyContinue)) {
    Write-Host "⚠️  Supabase CLI not found globally, trying npx..." -ForegroundColor Yellow
    $supabaseCmd = "npx supabase"
    if (-not (Get-Command npx -ErrorAction SilentlyContinue)) {
        Write-Host "❌ Neither Supabase CLI nor npx is available!" -ForegroundColor Red
        Write-Host "Please install Supabase CLI from: https://supabase.com/docs/guides/cli" -ForegroundColor Yellow
        exit 1
    }
    Write-Host "✅ Using npx to run Supabase commands" -ForegroundColor Green
} else {
    Write-Host "✅ Supabase CLI found" -ForegroundColor Green
}
Write-Host ""

# Check if logged in
Write-Host "🔐 Checking Supabase authentication..." -ForegroundColor Cyan
$loginCheck = Invoke-Expression "$supabaseCmd projects list 2>&1"
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Not logged in to Supabase" -ForegroundColor Red
    Write-Host "Running: $supabaseCmd login" -ForegroundColor Yellow
    Invoke-Expression "$supabaseCmd login"
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Login failed" -ForegroundColor Red
        exit 1
    }
}

Write-Host "✅ Authenticated" -ForegroundColor Green
Write-Host ""

# Link to project (if not already linked)
Write-Host "🔗 Linking to Supabase project..." -ForegroundColor Cyan
Write-Host "If not linked, you'll be prompted to select your project" -ForegroundColor Yellow
Invoke-Expression "$supabaseCmd link"
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to link project" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Project linked" -ForegroundColor Green
Write-Host ""

# Run migrations
Write-Host "📊 Running database migrations..." -ForegroundColor Cyan
Invoke-Expression "$supabaseCmd db push"
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Migration failed" -ForegroundColor Red
    Write-Host "Please check your migration files in supabase/migrations/" -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ Migrations completed" -ForegroundColor Green
Write-Host ""

# Deploy edge functions
Write-Host "🔧 Deploying edge functions..." -ForegroundColor Cyan
Write-Host ""

$functions = @(
    "signin",
    "signup",
    "get-summaries",
    "get-summary-detail",
    "create-summary",
    "get-tests",
    "get-test-questions",
    "create-test",
    "submit-test",
    "get-notifications",
    "mark-notification-read",
    "get-schedule",
    "create-schedule-item",
    "get-user-stats",
    "update-user-profile",
    "get-admin-dashboard"
)

$successCount = 0
$failCount = 0

foreach ($func in $functions) {
    Write-Host "  Deploying: $func..." -ForegroundColor Yellow
    Invoke-Expression "$supabaseCmd functions deploy $func --no-verify-jwt"
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  ✅ $func deployed" -ForegroundColor Green
        $successCount++
    } else {
        Write-Host "  ❌ $func failed" -ForegroundColor Red
        $failCount++
    }
}

Write-Host ""
Write-Host "=================================" -ForegroundColor Cyan
Write-Host "📊 Deployment Summary" -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan
Write-Host "✅ Successful: $successCount" -ForegroundColor Green
Write-Host "❌ Failed: $failCount" -ForegroundColor Red
Write-Host ""

if ($failCount -eq 0) {
    Write-Host "🎉 All functions deployed successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Update your frontend .env file with Supabase credentials" -ForegroundColor Yellow
    Write-Host "2. Test the API endpoints" -ForegroundColor Yellow
    Write-Host "3. Configure Row Level Security policies if needed" -ForegroundColor Yellow
} else {
    Write-Host "⚠️  Some functions failed to deploy. Please check the errors above." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "🔗 Useful commands:" -ForegroundColor Cyan
Write-Host "  $supabaseCmd functions list          - List all functions" -ForegroundColor White
Write-Host "  $supabaseCmd functions delete <name> - Delete a function" -ForegroundColor White
Write-Host "  $supabaseCmd db reset                - Reset database" -ForegroundColor White
Write-Host ""
