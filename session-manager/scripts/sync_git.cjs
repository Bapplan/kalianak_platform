const { execSync } = require('child_process');
const path = require('path');

const commitMessage = process.argv[2] || 'Session update';

function run(cmd, cwd = process.cwd()) {
  try {
    console.log(`Running: ${cmd} in ${cwd}`);
    return execSync(cmd, { cwd, stdio: 'inherit' });
  } catch (err) {
    console.error(`Error running ${cmd} in ${cwd}: ${err.message}`);
    // Don't exit, try next one
  }
}

const rootDir = process.cwd();

// Get submodules from .gitmodules
let submodules = [];
try {
  const gitmodules = require('fs').readFileSync(path.join(rootDir, '.gitmodules'), 'utf8');
  const matches = gitmodules.matchAll(/path = (.*)/g);
  for (const match of matches) {
    submodules.push(match[1]);
  }
} catch (e) {
  console.log('No .gitmodules found or error reading it.');
}

// 1. Commit and push submodules
for (const sub of submodules) {
  const subPath = path.join(rootDir, sub);
  console.log(`
--- Processing Submodule: ${sub} ---`);
  run('git add .', subPath);
  try {
    run(`git commit -m "${commitMessage}"`, subPath);
    run('git push', subPath);
  } catch (e) {
    console.log(`Nothing to commit or push in ${sub}`);
  }
}

// 2. Commit and push root
console.log('
--- Processing Root Repository ---');
run('git add .', rootDir);
try {
  run(`git commit -m "${commitMessage}"`, rootDir);
  run('git push', rootDir);
} catch (e) {
  console.log('Nothing to commit or push in root');
}

console.log('
✅ Git sync complete.');
