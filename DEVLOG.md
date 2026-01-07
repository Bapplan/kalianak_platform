# 📜 Kalianak Platform - Master Dev Log

## 🟢 Session: 2026-01-07
**Topic:** Multi-Restaurant Architecture, Inventory Restock, & UX Polish
**Branches:** `main`

### 🏗️ Backend Changes
*   **Summary:** Implemented "Global Definitions, Local Stock" architecture and Restock workflows.
*   **Details:**
    *   **Models:**
        *   Created `InventoryStock` to track stock per-restaurant (decoupling `Ingredient`/`Supplies` from specific restaurants).
        *   Added `restaurant` FK to `Order` and `RestockOrder` models to support multi-tenancy.
        *   Deprecated `stock` field on global item definitions (`Ingredient`, etc.).
    *   **API (Inventory):**
        *   Updated `get_inventory` to respect `X-Restaurant-ID` header and return restaurant-specific stock levels.
        *   Implemented full Restock workflow: `get_pending_restock`, `add_to_restock`, `update_restock_item`, `complete_restock`.
        *   **Fix:** Updated `complete_restock` to correctly increment `InventoryStock` and mark orders as completed.
        *   **Fix:** Added logic to strip `res-` prefix from `X-Restaurant-ID` header (e.g., `res-2` -> `2`) to prevent `ValueError` and 500 errors.
    *   **API (Orders):**
        *   Updated `create_order` and `get_orders` to handle `X-Restaurant-ID` context.
        *   Updated `OrderDish` model logic to deduct stock from the correct `InventoryStock` record upon payment.
    *   **Fix:** Added trailing slashes to all API routes (e.g., `/api/inventory/` instead of `/api/inventory`) to resolve 301 Redirect/404 errors on stricter clients (Safari/Arc) and ensure compatibility with Django's `APPEND_SLASH` behavior.
    *   **Receipts:** Improved Kitchen Receipt format (Bigger dish text, standard header size, "Meja: 1" format).

### 🎨 Frontend Changes
*   **Summary:** Integrated Restock UI, Toast Notifications, and Restaurant Context.
*   **Details:**
    *   **Features:**
        *   **Restock Manager:** Created UI for managing pending purchases (`RestockManager.tsx`), adding items from Supplies (`Supplies.tsx`), and completing restock orders.
        *   **Context:** Implemented `RestockProvider` for global cart state management.
    *   **UX/UI:**
        *   **Toasts:** Replaced invasive `alert()` and `confirm()` dialogs with a smooth `ToastContext` and notification system.
        *   **Header:** Added prominent Restaurant Name badge (e.g., "Restaurant 1") to the top bar and Dashboard hero section.
    *   **Fixes:**
        *   **Build:** Fixed `Uncaught SyntaxError` in `App.tsx` (missing default export).
        *   **Network:** Updated `apiService.ts` to append trailing slashes to all requests, resolving cross-browser 404/CORS issues.
        *   **Logic:** Updated `handleLogin` and `apiService` to store and transmit the correct `restaurantId` (stripped of prefix) to the backend.

### 🐛 Issue Log: "Restock Not Working"
*   **Symptom:** User reported "Restock function doesn't work... list still populated" and observed 404 errors in Safari/Arc.
*   **Root Cause 1 (Cross-Browser):** Missing trailing slashes in API calls caused 301 redirects which failed in some environments or were mishandled by the proxy/browser combination. **Fixed.**
*   **Root Cause 2 (Logic):** The frontend was sending `X-Restaurant-ID: res-2` (string from ID generator) but the backend expected an integer. This caused a hidden 500 Error during `get_inventory` and Restock operations. **Fixed** by stripping the prefix in the backend controllers.
*   **Resolution:** Verified via shell script (`backfill_stock.py`) and UI checks that stock levels now correctly increase after completing a restock order.

---

## 🟢 Session: 2026-01-04
**Topic:** Bank Module Refactor (Double Entry System)
**Branches:** `main`

### 🏗️ Backend Changes
* **Commit:** `38b84fc`
* **Summary:** Refactored Bank app to use Double Entry Bookkeeping.
* **Details:**
    *   **Models:** Replaced simple `Account` and `Transaction` with `AccountGroup`, `Account`, `Transaction`, and `JournalEntry` models.
    *   **Services:** Implemented `BankService` to handle double-entry logic, including `process_order_payment`.
    *   **API:** Updated `BankController` to map legacy endpoints to the new double-entry system.
        *   `list_transactions` now flattens Journal Entries for frontend compatibility.
        *   `create_transaction` automatically creates balanced Debit/Credit entries.
    *   **Admin:** Updated Django Admin to support the new models.
    *   **Migration:** Created and applied migrations (`0002_accountgroup...`), handling non-nullable constraints by making `group` and `restaurant` fields nullable for transition.
    *   **Fix:** Resolved 500 Error in `list_accounts` by resetting bank data (wiping legacy accounts with null groups) and verifying lazy seeding works.
    *   **Fix:** Updated `OrdersController.pay_order` to use `BankService` for double-entry transactions, resolving a crash caused by legacy code accessing removed model fields.
    *   **Fix:** Updated `BankController.list_transactions` to return unique `JournalEntry` IDs instead of `Transaction` IDs, resolving frontend duplicate key warnings.
    *   **Fix:** Added `min-h-0` to flex containers in `NewOrderModal` to prevent content squashing when lists overflow, ensuring scrolling works correctly.
    *   **Infra:** Reconfigured `ngrok` in `docker-compose.yml` to tunnel to `frontend:3000` instead of `backend:8000`, ensuring external users access the React App (which proxies API requests) rather than the headless Django backend.
    *   **Config:** Added `allowedHosts` to `vite.config.ts` to permit ngrok domain access.
    *   **Fix:** Updated `frontend/services/apiService.ts` to use a relative API path (`/api`) by default. This resolves Mixed Content errors and connection failures when accessing the app via ngrok, as it correctly leverages the Vite proxy instead of trying to hit `localhost:8001` from the client's browser.
    *   **Fix:** Configured Vite to proxy `/media` requests to the backend and updated frontend components to use relative image paths. This ensures images load correctly on both localhost and external (ngrok) domains by avoiding hardcoded `localhost:8001` URLs.
    *   **Feat:** Implemented data polling (5s interval) in `Dashboard` and `OrdersList` components to enable real-time-like updates of Active Orders and Order status without manual page refresh.
    *   **Feat:** Integrated Kitchen Printer support. Backend now sends formatted ESC/POS receipts to a local printer bridge (`host.docker.internal:9001`) upon order creation.
    *   **UX:** Enhanced `NewOrderModal` responsiveness for small tablets and mobile devices. Added a collapsible mobile cart with a floating bottom summary bar, and optimized grid/text sizing for smaller viewports.
    *   **UI:** Added micro-interactions to cart quantity buttons (active scale, color swap) and improved the mobile close button styling (red circle) for better tactile feedback.

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