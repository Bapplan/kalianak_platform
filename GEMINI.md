# Kalianak POS Platform

This project is a modern, unified Point-of-Sale (POS) platform for Ikan Bakar Kalianak. It integrates a robust Django backend with a responsive React frontend, designed to be tablet-friendly and efficient.

## Project Structure

The project is transitioning to a monorepo-style structure:

*   **`backend/`** (formerly `ikan_bakar_pos`):
    *   **Framework**: Django 5.2+.
    *   **API**: `django-ninja-extra` for RESTful APIs.
    *   **Database**: PostgreSQL.
    *   **Key Apps**: `inventory`, `menu`, `orders`, `pos`, `users`, `others` (Chat/AI).
*   **`frontend/`** (formerly `ikan_bakar_pos_frontend`):
    *   **Framework**: React 19 + TypeScript.
    *   **Build Tool**: Vite.
    *   **Styling**: TailwindCSS (inferred).
    *   **State/Data**: Will interact with Backend via API.
*   **`web_frontend/`**:
    *   Main website (currently out of scope for the POS merge).

## Technology Stack

*   **Backend**: Python, Django, Django Ninja Extra, Postgres.
*   **Frontend**: React, TypeScript, Vite.
*   **Infrastructure**: Docker, Docker Compose, Nginx (planned for prod).
*   **AI Integration**: OpenAI (via Django backend) and potentially Google Gemini (frontend/backend).

## Development Guidelines

### General
*   **Environment**: Managed via `.env` files.
*   **Containerization**: All services run via `docker-compose` from the root.

### Backend (Django)
*   **API Design**: Use `django-ninja-extra` controllers.
*   **Conventions**: Modular apps. Business logic in `services.py` or controllers.
*   **Testing**: Pytest or Django Test Framework.

### Frontend (React)
*   **Components**: Functional components with Hooks.
*   **API Client**: Generated or manually typed fetchers matching Django schemas.

## Agent Instructions

1.  **Context Awareness**: Always check `GEMINI.md` and `README.md` for the latest architecture.
2.  **Tool Usage**: Prefer specific tools (`search_file_content`, `read_file`) over generic shell commands when exploring.
3.  **Documentation**:
    *   Update `dev_log.md` (in root or respective subfolders) after significant changes.
    *   Keep `README.md` updated with setup instructions.
4.  **Migration specific**:
    *   When moving files, ensure imports are updated.
    *   Verify Docker paths after restructuring.

## Current Task: The Merge
We are currently merging `ikan_bakar_pos` and `ikan_bakar_pos_frontend` into `backend` and `frontend` directories, respectively, and unifying the Docker setup.

## Git Configuration & Monorepo Structure

The project is now a **Monorepo** using Git Submodules.

*   **Root**: Main repository tracking submodules and shared config.
*   **Submodules**:
    *   `backend` -> `kalianak_platform_backend`
    *   `frontend` -> `kalianak_platform_frontend`
    *   `web_frontend` -> `kalianak_platform_web_frontend`

**Agent Instructions for Git:**
1.  **Submodules**: When pulling the repo, always ensure submodules are updated (`git submodule update --init --recursive`).
2.  **Committing**: Changes within `backend/` or `frontend/` must be committed **inside** those directories first. Then, the updated submodule reference must be committed in the root repository.

## Documentation & Dev Logs

Maintenance of development logs is critical for project continuity.

*   **Files**:
    *   `dev-log-kalianak_platform.md`: For root-level changes (Docker, submodules, global config).
    *   `dev-log-backend.md`: For all backend/Django related changes.
    *   `dev-log-frontend.md`: For the POS React frontend.
    *   `dev-log-web_frontend.md`: For the public website.

**Editing Rules:**
1.  **Style**: Strictly follow the format in `dev-log-backend.md`.
    *   Header: `## 🟢 Session: YYYY-MM-DD HH:MM:SS`
    *   Sections: `Topic`, `Git Branch`, `Git Commit`, `✨ Summary`, `👌 What Went Well`, `😫 Issues`, `🧐 Fixes`.
2.  **Timing**: Update the relevant log at the end of every coding session or before a significant context switch.
3.  **Content**: Be specific about modified files and architectural decisions.

