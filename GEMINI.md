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
    *   Keep `README.md` updated with setup instructions.
4.  **Migration specific**:
    *   When moving files, ensure imports are updated.
    *   Verify Docker paths after restructuring.

## Session Management
Use the `session-manager` skill to end sessions, update `DEVLOG.md`, and sync all repositories.
