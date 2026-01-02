# Development Log - Frontend (Kalianak Platform)

## 🟢 Session: 2025-12-30 18:30:00

- **Topic:** Bank, Order Management & Payment UX
- **Git Branch:** `main`
- **Git Commit:** `816e88e` (Feat: Bank view, Order payment flow, Staff tracking, and UI improvements)

### ✨ Summary of Activities

- **Bank Module**:
  - Integrated `Bank` component with real backend data.
  - Added Account Balances and Transaction Ledger.
- **Order Management**:
  - **New Order**: Added Table Selection.
  - **Pending Orders**: Added "Edit" (quantity/table) and "Pay" actions.
  - **Order Details**: Implemented 3-column layout (Table, Staff, Time).
  - **Staff Tracking**: Sending and displaying real username.
- **Payment UX**:
  - Created `PayOrderModal` with account selection (filtering out "Grab").
  - Implemented touch-friendly **Numpad** for Cash payments with Change calculation.
- **UI Styling**:
  - Improved Status Badges (Pending/Paid).
  - Updated Recipe Cost Analysis to show "Profit" in green.

### 👌 What Went Well

- The new Payment Modal with Numpad significantly improves the cashier experience.
- Reusing cart logic for Edit Modal was efficient.

---

## 🟢 Session: 2025-12-28 14:00:00

- **Topic:** Backend Integration & Service Refactor
- **Git Branch:** `main`
- **Git Commit:** `6401c48` (Feat: Integrate Backend API, Persist Login, Fix Images)

### ✨ Summary of Activities

- **Service Layer**:
  - Created `services/apiService.ts` to replace the mock `dbService`.
  - Implemented `fetch` logic to consume Django Ninja APIs.
- **Component Refactor**:
  - Updated all major components (`Dashboard`, `OrdersList`, `MenuManagement`, etc.) to use `api.query` instead of `db.query`.
  - Added `getImageUrl` helper to correctly resolve media files served by Django.
- **Authentication**:
  - Implemented persistent login state using `localStorage` in `App.tsx`.
- **UI Improvements**:
  - Fixed responsive layout issues in `RecipeCostAnalysis` badges.

### 👌 What Went Well

- The typed interfaces in `types.ts` matched the Django Ninja Schemas well, minimizing friction during integration.

### 😫 Issues Encountered

- **Missing Images**: Images were broken because the frontend didn't know the backend's base URL.
- **Login State**: Reloading the page logged the user out.

### 🧐 How Issues Were Fixed

- Created a helper to prepend `VITE_API_URL` to image paths.
- Added a `useEffect` hook to check `localStorage` on app mount.

---

## 🟢 Session: 2025-12-28 09:00:00

- **Topic:** Monorepo Integration
- **Git Branch:** `main`
- **Git Commit:** `09b596e` (Docs: Update README and configuration files)

### ✨ Summary of Activities

- **Integration**:
  - Configured as a submodule within the `kalianak_platform` monorepo.
  - Renamed remote to `kalianak_platform_frontend`.
  - Updated `README.md` to match the project standard.

### 👌 What Went Well

- Seamless integration into the new directory structure.
- Vite proxy settings in `vite.config.ts` are ready for backend communication.

### 😫 Issues Encountered

- None.

### 🧐 How Issues Were Fixed

- N/A.

---

## 🟢 Session: 2025-12-24 22:43:37

- **Topic:** Initial Setup
- **Git Branch:** `main`
- **Git Commit:** `125c6a5` (feat: Initialize Project Blueprint & Genesis Framework)

### ✨ Summary of Activities

- **Project Initialization**:
  - Initialized the React + TypeScript + Vite project.
  - Set up TailwindCSS and DaisyUI.
  - Created the initial file structure and component skeleton.

### 👌 What Went Well

- The "Genesis Framework" setup provided a solid foundation.

---