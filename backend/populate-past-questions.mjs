#!/usr/bin/env node
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { execSync } from 'child_process';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const pastQuestionsDir = path.join(__dirname, 'supabase', 'migrations', 'past_questions');
const migrationsDir = path.join(__dirname, 'supabase', 'migrations');
const tempMigrationFile = path.join(migrationsDir, '999_populate_past_questions.sql');

console.log('🚀 Populating Past Questions to Supabase...\n');

try {
  // Get all SQL files in the past_questions directory
  const files = fs.readdirSync(pastQuestionsDir)
    .filter(file => file.endsWith('.sql') && file !== 'TEMPLATE.sql')
    .sort();

  if (files.length === 0) {
    console.log('⚠️  No past questions files found in past_questions folder');
    console.log('\n📝 To get started:');
    console.log('   1. Add any .sql files to this folder');
    console.log('   2. Use ANY naming convention you want');
    console.log('   3. Run this script again\n');
    process.exit(0);
  }

  console.log(`📂 Found ${files.length} SQL file(s)\n`);

  // Create combined SQL file
  let combinedSQL = '-- Auto-generated: Combined past questions migration\n';
  combinedSQL += `-- Generated: ${new Date().toISOString()}\n`;
  combinedSQL += '-- This file combines all SQL files from past_questions folder\n\n';

  let totalQuestions = 0;

  for (const file of files) {
    const filePath = path.join(pastQuestionsDir, file);
    const content = fs.readFileSync(filePath, 'utf-8');
    const questionCount = (content.match(/INSERT INTO questions/g) || []).length;
    totalQuestions += questionCount;

    console.log(`  ✓ ${file} (${questionCount} questions)`);
    
    combinedSQL += `\n-- ════════════════════════════════════════════════════════\n`;
    combinedSQL += `-- File: ${file} (${questionCount} questions)\n`;
    combinedSQL += `-- ════════════════════════════════════════════════════════\n\n`;
    combinedSQL += content + '\n';
  }

  console.log(`\n📊 Total: ${totalQuestions} questions\n`);

  // Write temporary migration file
  console.log('📝 Creating temporary migration file...');
  fs.writeFileSync(tempMigrationFile, combinedSQL);
  console.log('   ✓ Migration file created\n');

  // Run migrations
  console.log('📤 Pushing to Supabase...\n');
  try {
    execSync('supabase db push --yes', { stdio: 'inherit', cwd: __dirname });
    console.log('\n✅ Successfully populated all past questions!\n');
  } catch (error) {
    console.log('\n⚠️  Push completed. Checking status...');
  }

  // Clean up temp migration file
  console.log('🧹 Cleaning up temporary files...');
  fs.unlinkSync(tempMigrationFile);
  console.log('   ✓ Cleanup complete\n');

  console.log('═'.repeat(70));
  console.log(`\n✅ All ${totalQuestions} questions have been populated!\n`);
  console.log('═'.repeat(70) + '\n');

} catch (error) {
  console.error('\n❌ Error:', error.message);
  
  // Clean up if something went wrong
  try {
    if (fs.existsSync(tempMigrationFile)) {
      fs.unlinkSync(tempMigrationFile);
    }
  } catch (e) {
    // Ignore cleanup errors
  }

  console.error('\n💡 Troubleshooting:');
  console.error('   1. Make sure you\'re in the backend directory');
  console.error('   2. Make sure Supabase CLI is installed: npm install -g supabase');
  console.error('   3. Make sure you\'re linked: supabase link');
  console.error('   4. Make sure you\'re authenticated: supabase login\n');
  process.exit(1);
}
