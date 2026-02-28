# Kalianak Platform

## Overview
- **Type**: Monorepo with git submodules
- **Stack**: Django 5.2+ (backend), React/TypeScript + Capacitor (frontend & apps)
- **Architecture**: Pure REST API backend + separate React frontends (no server-rendered views)
- **Domain**: POS and customer loyalty system for Ikan Bakar Kalianak restaurant(s)

This CLAUDE.md is the authoritative source for development guidelines.
Subdirectories contain specialized CLAUDE.md files that extend these rules.

Always run `git submodule update --init --recursive` after cloning.

---

## Sub-Projects

| Directory | Purpose | Details |
|-----------|---------|---------|
| `backend/` | Django REST API | [backend/CLAUDE.md](backend/CLAUDE.md) |
| `frontend/` | POS tablet app (React + Capacitor) | [frontend/CLAUDE.md](frontend/CLAUDE.md) |
| `member_app/` | Customer mobile app (React + Capacitor) | [member_app/CLAUDE.md](member_app/CLAUDE.md) |
| `web_frontend/` | Public restaurant website | [web_frontend/CLAUDE.md](web_frontend/CLAUDE.md) |

---

## Universal Rules

### MUST
- **MUST** strip the `ord-`, `dish-`, `cat-`, `staff-`, `res-` prefix when resolving IDs in the backend (e.g., `order_id.replace("ord-", "")`)
- **MUST** send `X-Restaurant-ID` header on every API request from any frontend
- **MUST** use the `STORAGES` dict (not the deprecated `DEFAULT_FILE_STORAGE`) in Django 5.2+
- **MUST** run migrations inside Docker or on the server — never locally against the live DB without SSH tunnel
- **MUST** confirm with user before running `/migrate` in production

### MUST NOT
- **MUST NOT** add server-rendered Django template views — the backend is a pure REST API
- **MUST NOT** add React Router to the POS frontend — it uses a `View` enum routing system
- **MUST NOT** commit `.env` files, secrets, or API keys
- **MUST NOT** call `git push --force` or `git reset --hard` without explicit user confirmation
- **MUST NOT** delete migration files

### SHOULD
- **SHOULD** keep API controller methods thin — move business logic to service files (`services.py`)
- **SHOULD** use the offline-first pattern in `frontend/` — mutations go through `api.insert()` / `api.updateOrder()`, not raw `fetch()`
- **SHOULD** test API changes via `curl` or the Ninja docs UI at `/api/docs` before touching frontend

---

## Commands

### Local Dev (all services, hot-reload)
```bash
# 1. SSH tunnel to live DB (keep running in separate shell)
ssh -L 5432:127.0.0.1:5432 anders@109.205.177.108 -N

# 2. Start all services
docker compose up --build
```
Ports: backend `8001`, frontend POS `3001`, web_frontend `3002`, member_app `3003`.
Source files are volume-mounted — edits hot-reload instantly.

### Deploy to Production
```bash
./deploy.sh   # rsyncs to server and rebuilds Docker containers
```
See `/deploy` custom command for full workflow.

### Backend (from `backend/`)
```bash
uv run python manage.py runserver 0.0.0.0:8000   # dev server
uv run python manage.py makemigrations             # create migration
uv run python manage.py migrate                    # apply migrations (needs /migrate confirmation in prod)
uv run python manage.py test apps.orders.tests     # run tests
uv sync                                            # install dependencies
```

### Frontend POS (from `frontend/`)
```bash
npm run dev            # Vite dev server :3000
npm run build          # production build
npm run build:ios-dev  # build targeting prod API (native iOS dev)
```

### Member App (from `member_app/`)
```bash
npm run dev    # Vite dev server
npm run build  # TypeScript + Vite build
npm run lint   # ESLint
```

---

## Architecture

### ID Prefixing Convention (CRITICAL)
The API translates between Django integer PKs and prefixed string IDs for the frontend:
- Orders: `ord-{pk}`
- Dishes: `dish-{pk}`
- Categories: `cat-{pk}`
- Staff: `staff-{pk}`
- Restaurants: `res-{pk}` (or plain integer)

Backend strips prefix before DB operations:
```python
pk = int(order_id.replace("ord-", ""))
```

### Multi-Tenancy
Restaurant scoping via `X-Restaurant-ID` HTTP header on every request.
Controllers call `self._get_restaurant(request)` to resolve and filter by restaurant.

### Production Infrastructure
Docker Compose (`docker-compose.prod.yml`) with Traefik reverse proxy:
- Backend → `api-pos.ikanbakarkalianak.store`
- Frontend POS → `pos.ikanbakarkalianak.store`
- Web frontend → `www.ikanbakarkalianak.store`

Media files in MinIO/S3 (controlled by `USE_MINIO` env var). Static files via WhiteNoise.

### Locale
Backend: Indonesian locale (`id`), `Asia/Jakarta` timezone.
Django admin panel forced to English via `AdminLanguageMiddleware`.

### Kitchen Printer Bridge
A separate process (not in this repo) running on the local network:
```bash
# Run from /Users/andershedborg/print_worker/
uv run printer_bridge.py
```

---

## Security
- **NEVER** commit `.env`, tokens, API keys, or passwords
- `CORS_ALLOW_ALL_ORIGINS = True` is intentional (API-only, no session cookies for API routes)
- `NINJA_SKIP_CSRF = True` is intentional (cross-origin tablet app)
- Media bucket is public-read; never store sensitive files in MinIO

---

## Custom Commands
- `/deploy` — Full production deploy workflow
- `/migrate` — Run Django migration with confirmation gate
- `/new-api-endpoint` — Scaffold a new Ninja controller + schema

---

## Quick Search
```bash
# Find API endpoint definition
rg -n "@http_(get|post|put|delete)" backend/apps/

# Find frontend component
rg -n "^const [A-Z]|^function [A-Z]|^export (default |const )" frontend/src/components/

# Find Zustand store
rg -n "create<" member_app/src/store/

# Find migration files
find backend/apps -name "*.py" -path "*/migrations/*" | sort
```
