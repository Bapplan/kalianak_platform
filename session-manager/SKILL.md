---
name: session-manager
description: Analyzes chat history to generate a devlog entry, then runs the git sync script. Use when the user says "end this session", "finish this task", or asks for a summary of work done today.
---

# Session Manager

This skill helps you end a coding session by documenting your work and syncing all repositories.

## 🛑 CRITICAL RULES
1.  **NEVER OVERWRITE**: Never delete or overwrite existing session logs in `DEVLOG.md`. 
2.  **PREPEND ONLY**: Always add the new session entry at the **TOP** of the file (immediately under the `# 📜 Kalianak Platform - Master Dev Log` header).
3.  **MANDATORY QUESTION**: You MUST ask the user for the session status (🟢 Success or 🔴 Incomplete) before doing anything else. Do not assume.
4.  **RED SESSIONS**: If an existing session is 🔴, you may ADD content to it if we are continuing that specific task, but you must keep the original history intact.

## Workflow

1.  **Ask for Session Status**: "Should we mark this session as 🟢 (Success) or 🔴 (Incomplete/Interrupted)?"
2.  **Summarize Session**: Analyze the chat history to summarize:
    - Main topic and branches worked on.
    - Specific changes in the Root, Backend, Frontend, Web Frontend, and Member App.
3.  **Update DEVLOG.md**:
    - Locate `DEVLOG.md` in the root directory.
    - Prepend the new entry using the "Unified Chronological" format.
    - **Commit Hash**: Get the latest commit hash (short version) for each submodule.
4.  **Sync Git Repositories**:
    - Run the bundled script: `node scripts/sync_git.cjs "[Session Summary]"`
    - The script automatically handles `git add .`, `git commit`, and `git push` for all submodules and the root repository.

## Git Configuration & Monorepo Structure

- **Root**: Main repository tracking submodules.
- **Submodules**:
    - `backend` -> `kalianak_platform_backend`
    - `frontend` -> `kalianak_platform_frontend`
    - `web_frontend` -> `kalianak_platform_web_frontend`
    - `member_app` -> `kalianak_platform_member_app`

## Agent Instructions for Git

1.  **Submodules**: Ensure submodules are updated when pulling.
2.  **Committing**: Always commit inside submodules first, then update the root reference. This is automated by `scripts/sync_git.cjs`.
3.  **MCP tools**: Always check for available MCP tools for the current task.
