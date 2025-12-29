# Development Log - Backend (Kalianak platform)

## 🟢 Session: 2025-12-28 14:00:00

- **Topic:** API Implementation & Data Population
- **Git Branch:** 🕹️ `new_frontend` 🕹️
- **Git Commit:** (Pending)

### ✨ Summary of Activities

- **API Development (Django Ninja Extra)**:
  - Created `api.py` in `inventory`, `menu`, `orders`, and `users` apps.
  - Implemented Schemas (Pydantic) and Controllers for:
    - `InventoryController`: Unified Ingredients/Supplies/Hygiene endpoint.
    - `MenuController`: Dishes and Categories.
    - `OrdersController`: Order management.
    - `UsersController`: Staff and Restaurant data.
  - Registered all controllers in `core/urls.py`.
- **Configuration**:
  - Updated `core/settings.py` to add `localhost:3001` (frontend) to `CORS_ALLOWED_ORIGINS` and `CSRF_TRUSTED_ORIGINS`.
- **Data Management**:
  - Fixed and ran `populate_inventory.py` (replaced missing `Side` model with `Supplies`).
  - Ran `populate_new_menu.py` to seed the database with Ikan Bakar dishes.

### 👌 What Went Well

- Using `NinjaExtraAPI` allowed us to keep the existing Django Models exactly as they were, adding a clean API layer on top without refactoring the core database structure.

### 😫 Issues Encountered

- **Import Error**: `populate_inventory.py` failed because it tried to import a `Side` model that no longer existed.

### 🧐 How Issues Were Fixed

- Updated the management command to use the `Supplies` model instead of `Side`.

---

## 🟢 Session: 2025-12-28 09:00:00

- **Topic:** Monorepo Finalization and Cleanup
- **Git Branch:** 🕹️ `new_frontend` 🕹️
- **Git Commit:** (Pending)

### ✨ Summary of Activities

- **Repository Cleanup:**
  - Removed root-level configuration files (`docker-compose.yml`, `.env`, `dev_log.md`) from the backend repository as they are now managed by the monorepo root.
  - Updated `core/settings.py` and `core/urls.py` to reflect the new directory structure and integration requirements.
  - Updated `pyproject.toml`, `requirements.txt`, and `uv.lock` to ensure dependencies are clean for the containerized environment.
- **Git Submodule Integration:**
  - Prepared the backend to function purely as a submodule within the `kalianak_platform` monorepo.
  - Staged all deletions and modifications for a clean history.

### 👌 What Went Well

- The separation of concerns between the monorepo root and the backend application is now clear.
- All configuration files have been successfully migrated to the root.

---

## 🟢 Session: 2025-12-24 16:30:00

- **Topic:** Monorepo Migration and Unified Docker Setup
- **Git Branch:** 🕹️ `new_frontend` 🕹️
- **Git Commit:** (Pending user commit)

### ✨ Summary of Activities

- **Restructuring:**
  - Renamed `ikan_bakar_pos` to `backend`.
  - Renamed `ikan_bakar_pos_frontend` to `frontend`.
  - Moved configuration files (`docker-compose.yml`, `.env`, `dev_log.md`) to the root directory.
- **Backend Integration:**
  - Installed `django-ninja-extra` and `django-cors-headers`.
  - Configured CORS to allow requests from the React frontend (`localhost:3000`).
  - Added `NinjaExtraAPI` to `core/urls.py` at `/api/`.
- **Frontend Integration:**
  - Configured Vite proxy in `vite.config.ts` to forward `/api` requests to the Django backend (`http://backend:8000`).
- **Docker Orchestration:**
  - Updated `docker-compose.yml` to manage both `backend` (Django) and `frontend` (Node/Vite) services.
  - Configured host ports: Backend (`8001`), Frontend (`3001`).
  - Fixed port conflict issues by moving frontend to port 3001.

### 👌 What Went Well

- The restructuring was straightforward.
- Docker services started successfully after resolving port conflicts.
- Both frontend and backend are accessible and communicating via proxy.

### 😫 Issues Encountered

- **Port Conflicts:** Port 3000 was in use on the host, requiring a remap to 3001 for the frontend.
- **Backend Migrations:** The backend started but reported a `FieldDoesNotExist` error (`StockItem has no field named 'content_type'`) during migration. This suggests a schema mismatch in the existing database volume `db_data_fresh`.

### 🧐 How Issues Were Fixed

- **Port:** Remapped frontend host port to 3001 in `docker-compose.yml`.
- **Migration:** Issue noted for future resolution (likely requires DB reset or migration fix).

---

## 💯 Session: 2025-12-23 10:00:00

- **Topic:** Codebase Cleanup and Simplification
- **Git Branch:** 🕹️ `models_cleanup` 🕹️
- **Git Commit:** Committed changes (Refactor: cleanup codebase)

### ✨ Summary of Activities

- **Major Cleanup:** Removed unused apps (`suppliers`, `others`) and their corresponding templates and code.
- **Model Simplification:** Streamlined the admin interface by removing/hiding unnecessary models in `inventory`, `orders`, `pos`, and `users` apps to focus on core functionalities (Orders, Menu, Inventory, Staff).
- **View & URL Cleanup:** Removed unused views and URLs related to statistics, printing, and removed apps.
- **Template Updates:** Updated `base.html`, `pos/landing.html`, and `inventory/dashboard.html` to remove links and UI elements for removed features.
- **Feature Focus:** Ensured the codebase now strictly supports: Make new order, Order history, Dish list, Inventory list, Menu list, and Staff list.

### 👌 What Went Well

- The cleanup process was systematic and covered models, views, URLs, and templates.
- Unused code was safely removed or commented out where appropriate (admin registrations).
- The core functionality remains intact while significantly reducing complexity.

### 😫 Issues Encountered

- **Dependency Management:** Removing apps required careful checking of imports in other files (e.g., `Supplier` in `inventory/views.py`, `signals` in `pos/apps.py`).
- **Template cleanup:** `inventory/dashboard.html` had tabs dependent on models that were effectively removed from the UI scope, requiring a redesign of that page to be a simple list.

### 🧐 How Issues Were Fixed

- Systematically checked and removed imports for deleted modules.
- Refactored `inventory/dashboard.html` to remove the tabbed interface and display only the Ingredient list.

---

## 🟢 Session: 2025-12-21 00:32:34

- **Topic:** Debugging and fixing the 'Lainnya' tab in the menu management page.
- **Git Branch:** 🕹️ `main` 🕹️

### ✨ Summary of Activities

- Investigated why the 'Lainnya' tab was unresponsive.
- Used browser debugging tools (snapshots, console logs) to diagnose the issue.
- Hypothesized the problem was related to HTMX trigger conflicts.
- Performed several trial-and-error changes to the template to isolate the root cause.
- Successfully fixed the bug by consolidating the `hx-trigger` attributes on the category tabs.
- Committed the fix and pushed it to the `main` branch.
- Created a new `models_cleanup` branch for future work.

### 👌 What Went Well

- The iterative debugging process, although long, eventually led to the correct solution.
- The use of browser tools was effective in narrowing down the problem.

### 😫 Issues Encountered

- **Initial Diagnosis:** The lack of console errors made it difficult to pinpoint the problem.
- **Tooling:** My own `replace` tool calls were faulty at times, causing some circular debugging steps. I need to be more careful with the `old_string` parameter.
- **Docker:** The `docker-compose` service name was `backend`, not `web`, which caused some initial command failures.
- **Browser Caching:** A caching issue with the browser caused an alert to persist even after the code was removed, leading to confusion.

### 🧐 How Issues Were Fixed

- The HTMX conflict was resolved by using a single `hx-trigger` attribute with conditional logic (`{% if forloop.first %}load, click{% else %}click{% endif %}`).
- The tooling issues were resolved by carefully re-reading the file content to ensure the `old_string` was exact.
- The Docker service name issue was resolved by using `docker-compose ps` to get the correct name.
- The caching issue was resolved by a hard refresh (which I should have done earlier).

---