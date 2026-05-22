#!/usr/bin/env node
import { execSync } from 'child_process';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const PROJECT_REF = 'icbpbrnobaoygakuagua';

console.log('🚀 Auto Populate Past Questions\n');

try {
  // Step 1: Check authentication
  console.log('Step 1️⃣  Checking Supabase authentication...');
  try {
    execSync('supabase projects list', { stdio: 'pipe', encoding: 'utf-8' });
    console.log('✅ Already authenticated\n');
  } catch (error) {
    console.log('❌ Need to login first\n');
    console.log('📝 Running: supabase login\n');
    console.log('⚠️  Browser window will open. Log in with your Supabase account.\n');
    try {
      execSync('supabase login', { stdio: 'inherit' });
      console.log('\n✅ Login successful\n');
    } catch (err) {
      console.error('❌ Login failed');
      process.exit(1);
    }
  }

  // Step 2: Link project
  console.log('Step 2️⃣  Linking to Supabase project...');
  try {
    execSync(`supabase link --project-ref ${PROJECT_REF}`, { stdio: 'pipe' });
    console.log('✅ Linked\n');
  } catch (error) {
    console.log('ℹ️  Already linked\n');
  }

  // Step 3: Run the main populate script
  console.log('Step 3️⃣  Populating questions...\n');
  try {
    execSync('node populate-past-questions.mjs', { 
      stdio: 'inherit',
      cwd: __dirname 
    });
  } catch (error) {
    console.error('❌ Population failed');
    process.exit(1);
  }

} catch (error) {
  console.error('\n❌ Error:', error.message);
  process.exit(1);
}
