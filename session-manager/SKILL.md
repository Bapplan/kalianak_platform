---
name: session-manager
description: Analyzes chat history to generate a devlog entry, then runs the git sync script. Use when the user says "end this session", "finish this task", or asks for a summary of work done today.
---

# Session Manager (Universal)

This skill helps you end a coding session by documenting your work and syncing all repositories.

## 🛑 CRITICAL RULES
1.  **MANDATORY QUESTION**: You MUST ask the user for the session status (🟢 Success or 🔴 Incomplete) before doing anything else. Do not assume.
2.  **NEVER OVERWRITE**: Never delete or overwrite existing session logs in `DEVLOG.md`. 
3.  **PREPEND ONLY**: Always add the new session entry at the **TOP** of the file (immediately under the main header).
4.  **DYNAMIC SUBSECTIONS**: Only include subsections for components that were actually modified during the session.

## Workflow

1.  **Ask for Session Status**: "Should we mark this session as 🟢 (Success) or 🔴 (Incomplete/Interrupted)?"
2.  **Analyze & Summarize**:
    - Identify the main topic and branches.
    - List specific changes for the Root and each individual Submodule.
3.  **Update DEVLOG.md**:
    - Locate `DEVLOG.md` in the root directory.
    - Prepend the new entry using the **Unified Chronological** format:
      ```markdown
      ## [🟢/🔴] Session: YYYY-MM-DD
      **Topic:** [Main Task]
      **Branches:** `[branch-name]`

      ### 🌳 Root / Configuration
      *   **Commit:** `[short-hash]`
      *   **Summary:** [High-level changes]
      *   **Details:** [Bulleted list of specifics]

      ### 🏗️ [Submodule Name] Changes
      *   **Commit:** `[short-hash]`
      *   **Summary:** [Changes in this submodule]
      *   **Details:** [Bulleted list of specifics]
      ```
4.  **Sync Git Repositories**:
    - Run the bundled script: `node scripts/sync_git.cjs "[Session Summary]"`
    - The script automatically handles `git add .`, `git commit`, and `git push` for the root and all detected submodules.

## Git Workflow
1.  **Submodules**: Ensure submodules are updated when pulling.
2.  **Committing**: Always commit inside submodules first, then update the root reference. This is automated by `scripts/sync_git.cjs`.
3.  **MCP tools**: Proactively check for available MCP tools for every task.
