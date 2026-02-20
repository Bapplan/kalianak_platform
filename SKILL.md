---
name: session-manager
description: Analyzes chat history to generate a devlog entry, then runs the git sync script. Use when the user says "end this session", "finish this task", or asks for a summary of work done today.
---

# Session Manager

This skill helps you end a coding session by documenting your work and syncing all repositories.

## Workflow

1.  **Ask for Session Status**: Ask the user whether the session was a success (🟢) or if it's incomplete/interrupted (🔴).
2.  **Summarize Session**: Analyze the chat history to summarize:
    - Main topic and branches worked on.
    - Specific changes in the Root, Backend, Frontend, Web Frontend, and Member App.
3.  **Update DEVLOG.md**:
    - Locate `DEVLOG.md` in the root directory.
    - Append a new entry using the "Unified Chronological" format.
    - **Header**: `## 🟢 Session: YYYY-MM-DD` (or `## 🔴 Session: YYYY-MM-DD`).
    - **Metadata**: Include `Topic` and `Branches`.
    - **Subsections**:
        - `### 🌳 Root / Configuration`
        - `### 🏗️ Backend Changes`
        - `### 🎨 Frontend Changes`
        - `### 🌐 Web Frontend Changes`
        - `### 📱 Member App Changes`
    - **Commit Hash**: Get the latest commit hash (short version) for each submodule after the sync script runs, if possible. If not, placeholder is fine until next session.
4.  **Sync Git Repositories**:
    - Run the bundled script: `node scripts/sync_git.cjs "[Session Summary]"`
    - The script automatically handles `git add .`, `git commit`, and `git push` for all submodules (`backend`, `frontend`, `web_frontend`, `member_app`) and the root repository.

## Git Configuration & Monorepo Structure

- **Root**: Main repository tracking submodules.
- **Submodules**:
    - `backend` -> `kalianak_platform_backend`
    - `frontend` -> `kalianak_platform_frontend`
    - `web_frontend` -> `kalianak_platform_web_frontend`
    - `member_app` -> `kalianak_platform_member_app`

## Agent Instructions for Git

1.  **Submodules**: Ensure submodules are updated when pulling.
2.  **Committing**: Always commit inside submodules first, then update the root reference.