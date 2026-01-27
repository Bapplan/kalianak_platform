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
*   **`member_app/`**:
    *   Mobile loyalty app.
    *   **Framework**: React 19 + Capacitor + Konsta UI.
    *   **Styling**: TailwindCSS.

## Technology Stack

*   **Backend**: Python, Django, Django Ninja Extra, Postgres.
*   **Frontend**: React, TypeScript, Vite.
*   **Infrastructure**: Docker, Docker Compose, Nginx (planned for prod).
*   **AI Integration**: OpenAI (via Django backend) and potentially Google Gemini (frontend/backend).

## Development Guidelines

### General
*   **Environment**: Managed via `.env` files.
*   **Containerization**: All services run via `docker-compose` from the root.
*   **Command Execution**: Use `docker-compose exec backend uv run ...` for running Django management commands or scripts inside the backend container.

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
3.  **MCP tools** Always check for available MCP tools and select the most appropriate one for the task at hand.

## Documentation & Dev Logs

Maintenance of development logs is critical for project continuity.

*   **File**: `DEVLOG.md` (Unified Chronological Log)

**Editing Rules:**
1.  **Style**: Follow the "Unified Chronological" format.
    *   Header: `## 🟢 Session: YYYY-MM-DD`
    *   Metadata: `Topic`, `Branches`
    *   Subsections: `### 🌳 Root / Configuration`, `### 🏗️ Backend Changes`, `### 🎨 Frontend Changes`
    *   Content: Commit hash, Summary, and Details.
    *   **Commit Hashes**: ALWAYS include the Git commit hash (short version, e.g., `8c4f650`) for every entry in DEVLOG.md to ensure traceability. Use `git log` to verify before writing.
2.  **Timing**: Update `DEVLOG.md` at the end of every coding session or before a significant context switch.
3.  **Content**: Merge backend and frontend updates into a single session block if they are related.

**Superuser**
*   **Username**: `admin`
*   **Password**: `NiSS330011`
*   **Email**: `admin@ikanbakarkalianak.com`