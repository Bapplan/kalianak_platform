# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Monorepo for the **Kalianak Platform** — a POS and customer loyalty system for Ikan Bakar Kalianak restaurant(s). Uses git submodules for each sub-project. Always run `git submodule update --init --recursive` after cloning.

Sub-projects:
- `backend/` — Django 5.2+ REST API + HTMX server-rendered admin views
- `frontend/` — React/TypeScript POS tablet app (Capacitor for native iOS/Android)
- `member_app/` — Customer mobile app (React, Capacitor, Konsta UI)
- `web_frontend/` — Public customer-facing website

## Commands

### Backend (inside `backend/`)
Uses `uv` for Python package management (Python 3.13+).

```bash
# Run dev server
uv run python manage.py runserver 0.0.0.0:8000

# Migrations
uv run python manage.py makemigrations
uv run python manage.py migrate

# Run a single test
uv run python manage.py test apps.orders.tests

# Install dependencies
uv sync
```

Requires a `.env` in the repo root (or `backend/`) with `POSTGRES_DB`, `POSTGRES_USER`, `POSTGRES_PASSWORD`, `DB_HOST`, `DB_PORT`, `DJANGO_SECRET_KEY`.

### Frontend POS app (inside `frontend/`)
```bash
npm install
npm run dev          # Vite dev server on port 3000
npm run build        # Production build
npm run build:ios-dev  # Build targeting prod API (for native iOS dev)
```

### Member App (inside `member_app/`)
```bash
npm install
npm run dev          # Vite dev server
npm run build        # TypeScript + Vite build
npm run lint         # ESLint
```

### Local dev (all services, hot-reload, live DB)
```bash
# 1. Open an SSH tunnel to the live DB (keep running in a separate shell)
ssh -L 5432:127.0.0.1:5432 anders@109.205.177.108 -N

# 2. Ensure .env has DB_HOST=host.docker.internal (all other DB vars as production)

# 3. Start all services with hot-reload
docker compose up --build
```

Ports: backend `8001`, frontend POS `3001`, web_frontend `3002`, member_app `3003`.
Source files are volume-mounted — edits hot-reload instantly. `node_modules` live in named Docker volumes so they never conflict with host installs.

### Deploy to Production
```bash
# From repo root — rsyncs files to server and rebuilds Docker containers
./deploy.sh
```

### Kitchen Printer Bridge (separate process, not in this repo)
```bash
# Run from /Users/andershedborg/print_worker in a separate shell
uv run printer_bridge.py
```

## Architecture

### Backend Django Apps (`backend/apps/`)
- **`orders/`** — Core order flow: `Order`, `OrderDish`, `Table` models. `OrdersController` (Ninja API at `/api/orders/`). On order creation, triggers kitchen printer. On `pay`, deducts inventory and calls `BankService`.
- **`inventory/`** — `InventoryStock`, `Ingredient` models. Restock workflow (pending → complete).
- **`menu/`** — `Dish`, `Category`, `DishIngredient` (many-to-many through model with cost tracking).
- **`users/`** — `StaffMember` (extends Django `User`), `Restaurant` models. Auth at `/staff-login/`.
- **`bank/`** — Double-entry accounting via `BankService.process_order_payment()`. Tracks cash/QRIS/card accounts.
- **`expenses/`** — Expense categories and entries.
- **`pos/`** — HTMX-powered dashboard/views (server-rendered, secondary interface alongside React API).

The REST API uses `django-ninja-extra` controllers, mounted at `/api/` in `core/urls.py`. CSRF is disabled for the Ninja API (`NINJA_SKIP_CSRF = True`). CORS is open (`CORS_ALLOW_ALL_ORIGINS = True`).

### ID Prefixing Convention
The API layer translates between Django integer PKs and prefixed string IDs used in the frontend:
- Orders: `ord-{pk}`
- Dishes: `dish-{pk}`
- Categories: `cat-{pk}`
- Staff: `staff-{pk}`
- Restaurants: `res-{pk}` (or plain integer)

Always apply `.replace("ord-", "")` etc. when resolving IDs in the backend.

### Multi-Tenancy
Restaurant scoping is done via the `X-Restaurant-ID` HTTP header sent by the frontend on every API request. Controllers call `self._get_restaurant(request)` to filter querysets.

### Frontend POS (`frontend/`)
Single-page React app with a sidebar `View` enum routing system (no React Router). All API calls go through the singleton `api` (from `services/apiService.ts`), which:
- On native (Capacitor), uses `CapacitorHttp.request()` with absolute URL `https://api-pos.ikanbakarkalianak.store/api`
- On web, uses relative `/api` (proxied by Vite to `http://backend:8000`)
- Offline-first: caches GET responses in IndexedDB, queues mutations in an "outbox" and syncs on reconnect

Kitchen ticket printing uses a custom native Capacitor plugin `PrinterTcp` (Android only, 80mm ESC/POS, IP `192.168.1.200:9100`). Printing is triggered automatically when an order is created. On web/iOS, `printKitchenOrder` is a no-op.

UI uses DaisyUI v5 + Tailwind CSS v4. Two themes: `abyss` (dark) and `corporate` (light), toggled via localStorage.

### Member App (`member_app/`)
Customer-facing mobile app with Capacitor. Uses Konsta UI (iOS theme), Zustand for state, React Router v7. Pages: Home, Menu, History, Profile. Protected by `ProtectedRoute`.

### Production Infrastructure
Docker Compose (`docker-compose.prod.yml`) with Traefik reverse proxy:
- Backend → `api-pos.ikanbakarkalianak.store`
- Frontend POS → `pos.ikanbakarkalianak.store`
- Web frontend → `www.ikanbakarkalianak.store`

Static files served by WhiteNoise. Media files optionally stored in MinIO/S3 (controlled by `USE_MINIO` env var).

### Locale
Backend uses Indonesian locale (`id`) and `Asia/Jakarta` timezone. The Django admin panel is forced to English via `AdminLanguageMiddleware`.
