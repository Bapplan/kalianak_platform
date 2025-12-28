# Ikan Bakar Kalianak Platform

The **Kalianak Platform** is the central repository for the Ikan Bakar Kalianak restaurant technology ecosystem. It unifies the Point-of-Sale (POS) system, inventory management, and customer-facing interfaces into a robust, scalable solution.

## Project Components

The platform consists of three main components:

1.  **`backend`** (formerly `ikan_bakar_pos`):
    *   The core engine powered by **Django 5.2+**.
    *   Handles database interactions (PostgreSQL), business logic, authentication, and external integrations (OpenAI, etc.).
    *   Exposes a modern REST API using **Django Ninja Extra**.

2.  **`frontend`** (formerly `ikan_bakar_pos_frontend`):
    *   The modern, responsive User Interface for the POS system.
    *   Built with **React 19**, **TypeScript**, and **Vite**.
    *   Designed for tablet and desktop use, focusing on speed and usability for staff.

3.  **`web_frontend`** (Independent):
    *   The main public website for Ikan Bakar Kalianak.
    *   *(Note: This component is currently separate from the main POS development flow).*

## Architecture & Tech Stack

*   **Database**: PostgreSQL
*   **API**: Django Ninja Extra (REST)
*   **Frontend State**: React Hooks / Context / Query (TBD)
*   **Styling**: TailwindCSS
*   **Deployment/Dev**: Docker & Docker Compose

## Getting Started

### Prerequisites

*   Docker & Docker Compose
*   Node.js (for local frontend dev, optional if using Docker)
*   Python 3.12+ (for local backend dev, optional if using Docker)

### Installation & Run

1.  **Environment Setup**:
    Copy the example environment file (or create one based on instructions):
    ```bash
    cp .env.example .env
    ```
    Ensure your `.env` contains necessary database and API credentials.

2.  **Start Services**:
    We use Docker Compose to orchestrate the backend, frontend, and database.
    ```bash
    docker-compose up --build
    ```

3.  **Access the App**:
    *   **Frontend (POS)**: `http://localhost:3000` (or configured port)
    *   **Backend API**: `http://localhost:8000/api/docs` (Swagger UI)
    *   **Django Admin**: `http://localhost:8000/admin`

## Development Workflow

*   **Backend**: Changes in the `backend/` directory will auto-reload in the Docker container.
*   **Frontend**: Changes in `frontend/` will hot-reload via Vite.
*   **Migration**: The project is currently undergoing a structural migration to a unified monorepo format.

## Documentation

*   See `GEMINI.md` for agent instructions and deep-dive context.
*   Check specific `README.md` files in subdirectories for component-specific details.