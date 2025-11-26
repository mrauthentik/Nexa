# Deploy All Recent Fixes
# Run this script to deploy all backend functions

Write-Host "🚀 Deploying Recent Fixes..." -ForegroundColor Cyan
Write-Host ""

# Check if we're in the backend directory
if (-not (Test-Path "supabase")) {
    Write-Host "❌ Error: Please run this script from the backend directory" -ForegroundColor Red
    Write-Host "   cd backend" -ForegroundColor Yellow
    Write-Host "   .\deploy-fixes.ps1" -ForegroundColor Yellow
    exit 1
}

Write-Host "📦 Step 1: Deploying update-user-profile function..." -ForegroundColor Green
supabase functions deploy update-user-profile

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to deploy update-user-profile!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ update-user-profile deployed!" -ForegroundColor Green
Write-Host ""

Write-Host "📦 Step 2: Deploying send-admin-reply function..." -ForegroundColor Green
supabase functions deploy send-admin-reply

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to deploy send-admin-reply!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ send-admin-reply deployed!" -ForegroundColor Green
Write-Host ""

Write-Host "📦 Step 3: Deploying verify-email function..." -ForegroundColor Green
supabase functions deploy verify-email

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to deploy verify-email!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ verify-email deployed!" -ForegroundColor Green
Write-Host ""

Write-Host "🎉 All Functions Deployed Successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "✅ Fixes Deployed:" -ForegroundColor Cyan
Write-Host "   1. Settings update API fixed" -ForegroundColor White
Write-Host "   2. Admin reply to messages (sends email)" -ForegroundColor White
Write-Host "   3. Email verification with spam notice" -ForegroundColor White
Write-Host ""
Write-Host "🧪 Next Steps:" -ForegroundColor Cyan
Write-Host "   1. Build and deploy frontend" -ForegroundColor White
Write-Host "   2. Test settings page" -ForegroundColor White
Write-Host "   3. Test admin message reply" -ForegroundColor White
Write-Host "   4. Test email verification" -ForegroundColor White
Write-Host ""
Write-Host "📖 Full guide: FIXES_DEPLOYMENT.md" -ForegroundColor Cyan
