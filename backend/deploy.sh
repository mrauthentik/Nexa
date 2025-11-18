#!/bin/bash

# Nexa Backend Deployment Script (Unix/Linux/macOS)
# This script deploys Supabase edge functions and runs migrations

echo "🚀 Nexa Backend Deployment Script"
echo "================================="
echo ""

# Check if Supabase CLI is installed
if ! command -v supabase &> /dev/null; then
    echo "❌ Supabase CLI is not installed!"
    echo "Please install it from: https://supabase.com/docs/guides/cli"
    exit 1
fi

echo "✅ Supabase CLI found"
echo ""

# Check if logged in
echo "🔐 Checking Supabase authentication..."
if ! supabase projects list &> /dev/null; then
    echo "❌ Not logged in to Supabase"
    echo "Running: supabase login"
    supabase login
    if [ $? -ne 0 ]; then
        echo "❌ Login failed"
        exit 1
    fi
fi

echo "✅ Authenticated"
echo ""

# Link to project (if not already linked)
echo "🔗 Linking to Supabase project..."
echo "If not linked, you'll be prompted to select your project"
supabase link
if [ $? -ne 0 ]; then
    echo "❌ Failed to link project"
    exit 1
fi

echo "✅ Project linked"
echo ""

# Run migrations
echo "📊 Running database migrations..."
supabase db push
if [ $? -ne 0 ]; then
    echo "❌ Migration failed"
    echo "Please check your migration files in supabase/migrations/"
    exit 1
fi

echo "✅ Migrations completed"
echo ""

# Deploy edge functions
echo "🔧 Deploying edge functions..."
echo ""

functions=(
    "signin"
    "signup"
    "get-summaries"
    "get-summary-detail"
    "create-summary"
    "get-tests"
    "get-test-questions"
    "create-test"
    "submit-test"
    "get-notifications"
    "mark-notification-read"
    "get-schedule"
    "create-schedule-item"
    "get-user-stats"
    "update-user-profile"
    "get-admin-dashboard"
)

success_count=0
fail_count=0

for func in "${functions[@]}"; do
    echo "  Deploying: $func..."
    if supabase functions deploy "$func" --no-verify-jwt; then
        echo "  ✅ $func deployed"
        ((success_count++))
    else
        echo "  ❌ $func failed"
        ((fail_count++))
    fi
done

echo ""
echo "================================="
echo "📊 Deployment Summary"
echo "================================="
echo "✅ Successful: $success_count"
echo "❌ Failed: $fail_count"
echo ""

if [ $fail_count -eq 0 ]; then
    echo "🎉 All functions deployed successfully!"
    echo ""
    echo "Next steps:"
    echo "1. Update your frontend .env file with Supabase credentials"
    echo "2. Test the API endpoints"
    echo "3. Configure Row Level Security policies if needed"
else
    echo "⚠️  Some functions failed to deploy. Please check the errors above."
fi

echo ""
echo "🔗 Useful commands:"
echo "  supabase functions list          - List all functions"
echo "  supabase functions delete <name> - Delete a function"
echo "  supabase db reset                - Reset database"
echo ""
