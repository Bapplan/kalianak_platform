# Development Log - Kalianak Platform (Monorepo Root)

## 🟢 Session: 2025-12-28 14:00:00

- **Topic:** Integration: Connecting React Frontend to Django Backend
- **Git Branch:** 🕹️ `main` 🕹️
- **Git Commit:** Committed `b5d4eb5` (Chore: Update submodules and dev logs after integration)

### ✨ Summary of Activities

- **Integration**:
  - Successfully connected the `frontend` (React/Vite) to the `backend` (Django Ninja) APIs.
  - Replaced the mock `dbService` in the frontend with a real `apiService` using `fetch`.
  - Configured CORS in Django to allow requests from the frontend (`localhost:3001`).
- **Data Migration**:
  - Created management commands to populate the PostgreSQL database with initial Inventory and Menu data.
  - Verified data flow from Backend DB -> API -> Frontend UI.
- **Fixes**:
  - Implemented persistent login using `localStorage`.
  - Fixed image URL resolution in the frontend to correctly point to the backend media server.
  - Resolved UI responsive issues in `RecipeCostAnalysis`.

### 👌 What Went Well

- The API-first approach using `django-ninja-extra` made exposing models straightforward.
- The frontend architecture (clean separation of services) allowed for a relatively painless swap from mock DB to real API.

### 😫 Issues Encountered

- **CORS Blocking**: The frontend was blocked because it runs on port 3001 (due to 3000 being busy), but Django was only allowing 3000.
- **Missing Images**: Frontend `<img>` tags were using relative paths, breaking when served from a different origin than the API.
- **Login Persistence**: The initial React implementation reset state on reload, requiring a `localStorage` fix.

### 🧐 How Issues Were Fixed

- **CORS**: Updated `backend/core/settings.py` to add `http://localhost:3001` to `CORS_ALLOWED_ORIGINS`.
- **Images**: Added a `getImageUrl` helper in React components to prepend the `VITE_API_URL` base.
- **Login**: Added `useEffect` to `App.tsx` to restore user session from `localStorage`.

---

## 🟢 Session: 2025-12-28 09:00:00

- **Topic:** Monorepo Initialization and Configuration
- **Git Branch:** 🕹️ `main` 🕹️
- **Git Commit:** (Initial setup)

### ✨ Summary of Activities

- **Repository Setup**:
  - Initialized the root `kalianak_platform` repository.
  - Integrated `backend`, `frontend`, and `web_frontend` as Git submodules.
  - Renamed remotes to match the standard naming convention (`kalianak_platform_*`).
- **Configuration**:
  - Created `.gitignore` to exclude sensitive files and build artifacts.
  - Added `.env.example` template for environment variables.
  - Configured `docker-compose.yml` (moved from backend) to orchestrate the entire platform.
- **Documentation**:
  - Created standard `README.md` for the monorepo.
  - Established `GEMINI.md` rules for submodule management and development logging.
- **Security**:
  - Scrubbed sensitive `.env` data from Git history using `filter-branch`.

### 👌 What Went Well

- Monorepo structure is now clean and logical.
- Submodules are correctly linked and synchronized.
- GitHub push protection successfully flagged the initial secret exposure, which was then resolved.

### 😫 Issues Encountered

- Initial push was blocked due to secrets in the history (resolved by history rewrite).
- Naming of remote repositories required some manual coordination.

### 🧐 How Issues Were Fixed

- Used `git filter-branch` to remove the `.env` file from all commits.
- Renamed repositories on GitHub and updated local remote URLs.
