# 📜 Kalianak Platform - Master Dev Log

## 🟢 Session: 2026-01-04
**Topic:** Bank Module Refactor (Double Entry System)
**Branches:** `main`

### 🏗️ Backend Changes
* **Commit:** `(Pending)`
* **Summary:** Refactored Bank app to use Double Entry Bookkeeping.
* **Details:**
    *   **Models:** Replaced simple `Account` and `Transaction` with `AccountGroup`, `Account`, `Transaction`, and `JournalEntry` models.
    *   **Services:** Implemented `BankService` to handle double-entry logic, including `process_order_payment`.
    *   **API:** Updated `BankController` to map legacy endpoints to the new double-entry system.
        *   `list_transactions` now flattens Journal Entries for frontend compatibility.
        *   `create_transaction` automatically creates balanced Debit/Credit entries.
    *   **Admin:** Updated Django Admin to support the new models.
    *   **Migration:** Created and applied migrations (`0002_accountgroup...`), handling non-nullable constraints by making `group` and `restaurant` fields nullable for transition.

---

## 🟢 Session: 2025-12-30

**Topic:** Bank Module & Order Management Features  
**Branches:** `main` (Root), `new_frontend` -> `main` (Backend), `main` (Frontend)

### 🌳 Root / Configuration
* **Commit:** `bfb4ca7`
* **Summary:** Updated submodules to include Bank app and Order Management features.
* **Notes:** Monorepo structure is stable.

### 🎨 Frontend Changes
* **Commit:** `816e88e`
* **Summary:** Implemented Bank view, Order payment flow, Staff tracking, and UI improvements.
* **Details:**
    *   **Bank Module:** Integrated real backend data, added Account Balances and Ledger.
    *   **Order Management:** Added Table Selection to new orders. Added "Edit" and "Pay" actions for pending orders.
    *   **Payment UX:** Created `PayOrderModal` with Numpad and Change calculation. Filtered out "Grab" accounts.
    *   **Staff Tracking:** Displaying real username in Order Details (3-column layout).
    *   **Styling:** Improved Status Badges and Recipe Cost Analysis (Profit in green).

### 🏗️ Backend Changes
* **Commit:** `531657c` (Feat) & `71b9d37` (Refactor)
* **Summary:** Implemented Bank App, enhanced Orders API, and cleaned up legacy templates.
* **Details:**
    *   **Bank App:** Created `Account` and `Transaction` models and `BankController`.
    *   **Orders API:** Added endpoints for Payments (`POST /pay`) and Updates (`PUT`).
    *   **Refactor:** Moved `get_tables` to `TablesController` to fix URL routing conflicts.
    *   **Fix:** Increased `Order.order_number` max_length to 50.
    *   **Logic:** Enhanced `create_order` to resolve Staff by username.
    *   **Cleanup:** Removed unused Django templates and legacy config files.

---

## 🟢 Session: 2025-12-28
**Topic:** Monorepo Integration & API Connection.  
**Branches:** `main` (Root), `new_frontend` (Backend), `main` (Frontend)

### 🌳 Root / Configuration
* **Commit:** `b5d4eb5`
* **Summary:** Orchestrated connection between React Frontend and Django Backend.
* **Fixes:** Added `localhost:3001` to Django CORS settings.

### 🎨 Frontend Changes
* **Commit:** `6401c48`
* **Summary:** Replaced mock `dbService` with real `apiService` using `fetch`.
* **Details:**
    *   Connected to Django Ninja APIs.
    *   Implemented persistent login using `localStorage`.
    *   Fixed image URL resolution (`VITE_API_URL` helper).

### 🏗️ Backend Changes
* **Commit:** `4108a55`
* **Summary:** Implemented Ninja Extra API and seeded data.
* **Details:**
    *   Created `api.py` for Inventory, Menu, Orders, and Users.
    *   Seeded database with initial Inventory and Menu items.
    *   Configured CORS.

### ♻️ Monorepo Setup (Morning Session)
* **Root:** Initialized monorepo, submodules, and `docker-compose.yml`.
* **Backend (`fa63b47`):** Cleaned up root-level configs to rely on monorepo root.
* **Frontend (`09b596e`):** Updated README and config for submodule structure.

---

## 🟢 Session: 2025-12-24
**Topic:** Initial Setup & Migration
**Branches:** `main` (Frontend), `models_cleanup` (Backend)

### 🎨 Frontend Changes
* **Commit:** `125c6a5`
* **Summary:** Initialized Project Blueprint & Genesis Framework.
* **Stack:** React, TypeScript, Vite, TailwindCSS, DaisyUI.

### 🏗️ Backend Changes
* **Commit:** `1f781fe`
* **Summary:** Migrated existing Django project to `backend/` directory.
* **Details:** Renamed folders and adjusted Docker paths.

---

## 🟢 Session: 2025-12-23
**Topic:** Codebase Cleanup  
**Branches:** `models_cleanup`

### 🏗️ Backend Changes
* **Commit:** `97e0a68`
* **Summary:** Refactored codebase to remove unused apps (`suppliers`, `others`).
* **Details:** Simplified models and views to focus on core POS functionality.

---

## 🟢 Session: 2025-12-21
**Topic:** Bugfix  
**Branches:** `main`

### 🏗️ Backend Changes
* **Commit:** `17fbb73`
* **Summary:** Resolved HTMX trigger conflict on menu category tabs.
* **Fix:** Consolidated `hx-trigger` attributes to ensure correct tab switching behavior.
