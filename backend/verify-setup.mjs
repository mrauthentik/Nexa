#!/usr/bin/env node
/**
 * 🎯 Quick Setup Checklist
 * Copy this into your terminal to verify everything is set up
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

console.log('\n✅ MIGRATION SETUP VERIFICATION\n');

const checks = [
  { name: 'run-all-migrations.mjs', path: 'run-all-migrations.mjs' },
  { name: 'populate-past-questions.mjs', path: 'populate-past-questions.mjs' },
  { name: 'MIGRATION_GUIDE.md', path: 'MIGRATION_GUIDE.md' },
  { name: 'past_questions folder', path: 'supabase/migrations/past_questions' },
  { name: 'TEMPLATE.sql', path: 'supabase/migrations/past_questions/TEMPLATE.sql' },
  { name: 'README.md in past_questions', path: 'supabase/migrations/past_questions/README.md' },
];

let allGood = true;

for (const check of checks) {
  const fullPath = path.join(__dirname, check.path);
  const exists = fs.existsSync(fullPath);
  const icon = exists ? '✅' : '❌';
  console.log(`${icon} ${check.name}`);
  if (!exists) allGood = false;
}

console.log('\n' + '='.repeat(50));

if (allGood) {
  console.log('\n🎉 All files created successfully!\n');
  console.log('📋 Next Steps:\n');
  console.log('1. Review existing migrations:');
  console.log('   → cat supabase/migrations/agro205.sql');
  console.log('');
  console.log('2. Create your first past questions file:');
  console.log('   → cp supabase/migrations/past_questions/TEMPLATE.sql \\');
  console.log('        supabase/migrations/past_questions/cit101_past_questions.sql');
  console.log('');
  console.log('3. Edit the file and add your questions');
  console.log('');
  console.log('4. Run all migrations (first time):');
  console.log('   → npm run migrate:all');
  console.log('');
  console.log('5. Populate past questions:');
  console.log('   → npm run populate:past-questions');
  console.log('\n');
} else {
  console.log('\n⚠️  Some files are missing. Please verify setup.\n');
}
