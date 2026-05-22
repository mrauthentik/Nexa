#!/usr/bin/env node
import { execSync } from 'child_process';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const migrationsDir = path.join(__dirname, 'supabase', 'migrations');

console.log('🚀 Running all Supabase migrations...\n');

try {
  // First, check if we're logged in
  try {
    execSync('supabase projects list', { stdio: 'pipe', encoding: 'utf-8' });
  } catch (err) {
    console.log('📝 Not authenticated. Running: supabase login');
    execSync('supabase login', { stdio: 'inherit' });
  }

  // Link to project if needed
  try {
    execSync('supabase link --project-ref pyepvpdvlwcwhjwctiuw', { 
      stdio: 'pipe',
      encoding: 'utf-8'
    });
  } catch (err) {
    console.log('Already linked to project');
  }

  // Push migrations to Supabase
  console.log('\n📂 Pushing migrations...');
  execSync('supabase db push', { stdio: 'inherit' });

  console.log('\n✅ All migrations completed successfully!');
} catch (error) {
  console.error('\n❌ Migration failed:', error.message);
  console.error('\nTroubleshooting:');
  console.error('1. Make sure Supabase CLI is installed: npm install -g supabase');
  console.error('2. Make sure you\'re logged in: supabase login');
  console.error('3. Make sure you\'re in the backend directory');
  process.exit(1);
}
