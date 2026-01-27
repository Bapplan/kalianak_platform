# KALIANAK PLATFORM MONOREPO

![Monorepo](https://img.shields.io/badge/Architecture-Monorepo-orange)
![Status](https://img.shields.io/badge/Status-Active-green)

## Project Overview

This is the central monorepo for the **Kalianak Platform**, unifying the backend, internal POS frontend, and public website into a single managed structure.

### Repositories & Structure

*   **`backend/`** (`kalianak_platform_backend`):
    *   Django-based REST API and core business logic.
    *   Manages database, inventory, and order processing.
*   **`frontend/`** (`kalianak_platform_frontend`):
    *   React/TypeScript POS interface for restaurant staff.
    *   Interacts with the backend API.
*   **`web_frontend/`** (`kalianak_platform_web_frontend`):
    *   Public-facing website for customers.
*   **`member_app/`** (`kalianak_member_app`):
    *   Mobile app for customers (Loyalty & Ordering).
    *   Built with React, Capacitor, and Konsta UI.

## Getting Started

### Prerequisites

*   Git
*   Docker & Docker Compose
*   Node.js (for local frontend dev)
*   Python 3.13+ (for local backend dev)

### Setup

1.  **Clone the Monorepo**:
    ```bash
    git clone --recursive https://github.com/Bapplan/kalianak_platform.git
    cd kalianak_platform
    ```
    *If you already cloned without `--recursive`, run:*
    ```bash
    git submodule update --init --recursive
    ```

2.  **Environment Configuration**:
    *   Copy `.env.example` to `.env` (if available) or create a `.env` file in the root directory based on the project documentation in `GEMINI.md`.

3.  **Run with Docker**:
    The entire platform can be orchestrated from the root:
    ```bash
    docker-compose up --build
    ```

## Development Workflow

Refer to `GEMINI.md` for detailed agent instructions and development guidelines.

### Development Logs

We maintain development logs for each component in `DEVLOG.md` file, Please verify and update these logs after significant changes:

## Credentials

(See `backend/README.md` for local development credentials)

## Print stuff

```shell
# run at folder: "/Users/andershedborg/print_worker" in separate shell, etc.
uv run printer_bridge.py
```
