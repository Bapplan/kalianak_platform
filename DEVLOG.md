# 📜 Kalianak Platform - Master Dev Log

## 🟢 Session: 2026-02-26 01:02
**Topic:** Local dev Docker setup, receipt printer (ESC/POS), member app full UI redesign
**Branches:** `main`

### 🌳 Root / Configuration
- **Commit:** *(set by sync)*
- **Summary:** Created CLAUDE.md, rewrote docker-compose.yml for live-DB local dev, fixed SSH tunnel + macOS keychain.
- **Details:**
  - Created `CLAUDE.md` with full architecture guide, commands, ID-prefixing convention, multi-tenancy, offline-first API, printer notes
  - Rewrote `docker-compose.yml`: all 4 services (backend, frontend, web_frontend, member_app) with hot-reload volume mounts, named `node_modules` Docker volumes, `extra_hosts: host.docker.internal`, backend healthcheck, frontend services depend on healthy backend
  - `docker-compose.prod.yml`: changed DB port binding to `127.0.0.1:5434:5432` to avoid port conflict with another project on same VPS
  - SSH tunnel command updated: `ssh -L 5433:localhost:5434 -L 9000:localhost:9000 anders@109.205.177.108`
  - `~/.ssh/config`: added `UseKeychain yes` + `AddKeysToAgent yes` to stop passphrase prompts

### 🏗️ Frontend
- **Commit:** *(set by sync)*
- **Summary:** Added `printPaidReceipt()` with full ESC/POS receipt buffer generation, triggered on order payment.
- **Details:**
  - `printerService.ts` rewritten: `printPaidReceipt(order)` logs human-readable receipt to console and pre-generates ESC/POS buffer (42-char columns: 24 item + 5 qty + 13 price), TODO for BTP3000 Bluetooth when hardware arrives
  - `generateReceiptBuffer()`: header double-size bold, order info, column-aligned items table, right-aligned double-height total, footer, full cut (GS V 42 00)
  - `OrdersList.tsx`: `handlePayOrder` calls `printerService.printPaidReceipt(paidOrder)` after successful payment

### 🏗️ Member App
- **Commit:** *(set by sync)*
- **Summary:** Complete UI redesign of Home page and bottom navigation to modern Indonesian food-app style.
- **Details:**
  - `index.css`: removed Konsta dark-mode, added CSS design tokens (primary #8B1A1A, accent #FFB800, etc.)
  - `MainLayout.tsx`: replaced Konsta Tabbar with custom 5-tab bottom nav — raised center Scan button (maroon circle, -mt-7), active tab in maroon with bold stroke, safe-area-inset-bottom support
  - `Home.tsx`: full redesign — auto-sliding gradient hero carousel (3 banners, dot indicators, top bar), greeting card overlapping banner with points, membership card (dark gradient, tier badge, progress bar to next tier), 4-column action grid with maroon icons, horizontal-scroll special offers, info card

## 🟢 Session: 2026-02-21 (Session 3)
**Topic:** Android Native Printer Integration (ESC/POS)
**Branches:** `main`

### 🏗️ Frontend Changes
*   **Summary:** Implemented thermal printer support via a custom native Android bridge and finalized the "Kitchen Ticket" workflow.
*   **Details:**
    *   **Printer Service:** Created `printerService.ts` with a large-font layout (Bahasa Indonesia) designed specifically for kitchen staff (No prices, optimized font sizes).
    *   **Ticket Refinement:** Adjusted item font from Triple Size to Double Size to prevent text wrapping on 80mm paper and removed the `[ ]` prefix for a cleaner look.
    *   **Logic Fix:** Moved automatic printing from the "Payment" step to the **"Order Creation"** and **"Order Update"** steps to ensure chefs get tickets immediately.
    *   **UI Integration:** Added a manual "Test Print" button to the Orders List for easier troubleshooting.
    *   **Android Fix:** Removed invalid `server.url` in `capacitor.config.ts` that caused native crashes on Android.

### 🏗️ Android Changes
*   **Custom Plugin:** Authored `PrinterTcpPlugin.java` to handle direct TCP socket communication on a background thread.
*   **Bridge:** Registered the plugin in `MainActivity.java`.
*   **Build System:** Downgraded Gradle (8.7.3) and SDK (36) to stable versions and patched `@capacitor/keyboard` to fix Proguard-related build failures.

---

## 🟢 Session: 2026-02-21 (Session 2)
**Topic:** Capacitor iOS Backend Connection Fix
**Branches:** `main`

### 🏗️ Frontend Changes
*   **Commit:** `848cbad`
*   **Summary:** Modernized native networking to use the `CapacitorHttp` plugin.
*   **Details:**
    *   **API Service:** Updated `frontend/services/apiService.ts` to use `(Capacitor as any).Plugins.CapacitorHttp.request`.
    *   **Error Logging:** Added detailed console error logging for failed native requests.
    *   **CORS:** Avoids origin-based rejections on iOS by moving networking to the native layer.

### 🏗️ Member App Changes
*   **Commit:** `6978810`
*   **Summary:** Enabled the CapacitorHttp plugin for the native member app.
*   **Details:**
    *   **Config:** Updated `member_app/capacitor.config.ts` to enable `CapacitorHttp`.
    *   **Consistency:** Ensured all native apps follow the same networking strategy for cross-platform stability.

---

## 🟢 Session: 2026-02-21
**Topic:** MinIO Integration & Image Display Fix
**Branches:** `main`

### 🌳 Root / Configuration
*   **Commit:** `fd131fb` (and subsequent submodule updates)
*   **Summary:** Successfully integrated MinIO storage and resolved image display issues.
*   **Details:**
    *   **MinIO:** Added MinIO service to local Docker Compose.
    *   **Backend:** Added `django-storages[s3]` and `boto3` to `requirements.txt`.
    *   **VPS Deployment:** Removed redundant MinIO container from `docker-compose.prod.yml`.
    *   **CORS:** Provided instructions and commands to set `kalianak-media` bucket policy to public/readonly using `mc anonymous set download`.

### 🏗️ Backend Changes
*   **Commit:** `f18961d` (and subsequent updates)
*   **Summary:** Configured Django for MinIO S3 storage.
*   **Details:**
    *   **Settings:** Updated `settings.py` to dynamically set `MEDIA_URL` and `DEFAULT_FILE_STORAGE` based on `USE_MINIO` environment variable.
    *   **Custom Storage:** Created `core/storage.py` with `MediaStorage` to prevent Django from renaming files (`AWS_S3_FILE_OVERWRITE=True`).
    *   **App Registration:** Registered `core` as a Django app.

### 🎨 Frontend Changes
*   **Commit:** `e5c8039` (from previous session, related changes)
*   **Summary:** Now correctly displays images from MinIO.

---

## 🟢 Session: 2026-02-20 (Session 2)
**Topic:** Final Production Fixes & Successful Launch
**Branches:** `main`

### 🌳 Root / Configuration
*   **Commit:** `9db8f48`
*   **Summary:** Finalized VPS deployment configuration and resolved network routing.
*   **Details:**
    *   **Infra:** Fixed Traefik 504 errors by adding `traefik.docker.network` labels.
    *   **Automation:** Refined the `session-manager` skill with strict "never overwrite" rules.
    *   **Database:** Successfully migrated local data to the production VPS database.

### 🏗️ Backend Changes
*   **Commit:** `3d34efb`
*   **Summary:** Critical fixes for production image and API security.
*   **Details:**
    *   **Docker:** Fixed missing source code in production image by adding `COPY . .`.
    *   **API:** Disabled CSRF for Ninja API to support cross-subdomain requests from the POS dashboard.

### 🎨 Frontend Changes
*   **Commit:** `e5c8039`
*   **Summary:** Production proxy and mobile optimization.
*   **Details:**
    *   **Proxy:** Updated `nginx.conf` to use the correct service name for the backend.
    *   **UX:** Initialized SplashScreen auto-hide logic for the mobile app.

---

## 🟢 Session: 2026-02-18 (Session 1)
**Topic:** Capacitor Integration & VPS Traefik Deployment
**Branches:** `main`

### 🌳 Root / Configuration
*   **Commit:** `5b4e2d4`
*   **Summary:** Initial production Docker configuration and Capacitor setup.
*   **Details:**
    *   **Skill:** Developed and packaged `session-manager.skill`.
    *   **Infra:** Created `docker-compose.prod.yml` with Traefik integration.
    *   **Proxy:** Implemented `nginx.conf` for frontend services.

### 🎨 Frontend Changes
*   **Commit:** `6a87237`
*   **Summary:** Integrated Capacitor and prepared for production deployment.
*   **Details:**
    *   **Mobile:** Completed Capacitor integration for iOS/Android.
    *   **Connectivity:** Fixed production API routing in `apiService.ts`.
    *   **Build:** Created `Dockerfile.prod` using multi-stage builds.

### 🏗️ Backend Changes
*   **Commit:** `d9dad62`
*   **Summary:** Updated security settings for production domains.
*   **Details:**
    *   **Security:** Added production subdomains to `CSRF_TRUSTED_ORIGINS`.
    *   **Stability:** Pinned `uv` version to 0.5.29.

---

## 🟢 Session: 2026-01-27
**Topic:** Member App Initialization & MVP Implementation
**Branches:** `main`

### 🌳 Root / Configuration
*   **Commit:** `63f2a03`
*   **Summary:** Added `member_app` as a git submodule and configured backend support.
*   **Details:**
    *   **Submodules:** Initialized `member_app` submodule structure.
    *   **Documentation:** Updated `README.md` and `GEMINI.md` to include the new component.

### 📱 Member App (Frontend)
*   **Summary:** Implemented full MVP with React + Capacitor + Konsta UI.
*   **Details:**
    *   **Tech Stack:** React 19, TypeScript, Tailwind CSS, Konsta UI, Capacitor 8, Zustand.
    *   **Features:**
        *   **Login:** Glass-morphic UI with simulated OTPless integration.
        *   **Home:** Immersive live video background, member card (Points/Tier), and quick actions.
        *   **Menu:** Searchable menu with categories, cart management (Zustand), and real-time stock checks.
        *   **History:** Order history grouped by month with detailed receipt view.
        *   **Profile:** Dynamic user profile with QR Code generation for POS scanning.
    *   **Deployment:** Configured for Android and iOS builds (`BUILD.md`).

### 🏗️ Backend Changes
*   **Summary:** Added Customer Loyalty support and Mobile API endpoints.
*   **Details:**
    *   **Models:** Added `Customer` model (Points, Tier) linked to User.
    *   **API:**
        *   Created `AuthController` for customer login and profile management.
        *   Added `/api/orders/my-orders/` endpoint for customer history.
    *   **Configuration:** Updated `ALLOWED_HOSTS`, `CORS_ALLOWED_ORIGINS`, and `CSRF_TRUSTED_ORIGINS` to support mobile devices and simulators (including local network access).

## 🟢 Session: 2026-01-21 (Evening)
**Topic:** Expense Management, Payroll, and Financial Dashboard.
**Branches:** `main`

### 🌳 Root / Configuration
*   **Commit:** `6b21295`
*   **Summary:** Integrated expense management and financial dashboard.
*   **Details:**
    *   **Submodules:** Updated `backend` and `frontend` references.

### 🎨 Frontend Changes
*   **Commit:** `9cc7c77`
*   **Summary:** Enhanced Restock Manager with real-time price calculations.
*   **Details:**
    *   **UI:** Added "Price/Unit" and "Total Price" columns to the Restock table.
    *   **Logic:** Implemented optimistic total cost calculation in `RestockItemRow`.
    *   **Feedback:** Added "Estimated Cost" to the stats summary.

### 🏗️ Backend Changes
*   **Commit:** `297b15f`
*   **Summary:** Integrated Inventory Restock with Expense Management.
*   **Details:**
    *   **API:** Updated `complete_restock` to calculate total order cost and automatically create an `Expense` record (Debit: Inventory Purchase, Credit: Asset).
    *   **Schemas:** Added `price_per_unit` and `total_price` to `RestockItemSchema`.
    *   **Logic:** Fixed stock updates to correctly reference global definitions.

### 🎨 Frontend Changes
*   **Commit:** `cce9f3a`
*   **Fix:** Resolved `422 Unprocessable Content` when updating staff by sanitizing `date_of_birth` (converting empty strings to null).
*   **Fix:** Fixed `TypeError: showToast is not a function` by using the correct `toast` helper from `useToast`.
*   **Commit:** `8b4a441`
*   **Summary:** Implemented Full CRUD Staff Management UI.
*   **Details:**
    *   **StaffManagement.tsx:** Refactored to support Create, Read, Update, and Delete operations.
    *   **UI:** Added detailed user cards showing phone, active status, and salary/compensation details for Staff/Manager roles.
    *   **Modal:** Created a comprehensive form for managing user account, personal details, and employment terms (Salary/Hourly).
    *   **Services:** Updated `apiService.ts` and `types.ts` to support expanded Staff data and CRUD methods.

### 🏗️ Backend Changes
*   **Commit:** `44deecd`
*   **Summary:** Enhanced Staff API with CRUD and detailed schemas.
*   **Details:**
    *   **Models:** Added `MANAGER` choice to `StaffRole` enum.
    *   **API:** Updated `UsersController` with `create_staff`, `update_staff`, and `delete_staff` endpoints.
    *   **Services:** Implemented `StaffService` to handle transactional creation/updating of `User`, `StaffMember`, and `StaffEmployment` records.
    *   **Schemas:** Expanded `StaffDetailSchema`, `StaffCreateSchema`, and `StaffUpdateSchema` to include full profile and employment details.

### 🏗️ Backend Changes
*   **Commit:** `c8573ef`
*   **Summary:** Implemented Expense Management, Payroll automation, and Financial Report APIs.
*   **Details:**
    *   **Expenses App:** Created new app `apps.expenses` with `Expense` and `ExpenseCategory` models.
    *   **Integration:** Linked expenses to the double-entry `bank` system. Each `Expense` creates a corresponding `Transaction` in the ledger.
    *   **Payroll:** Created `PayrollService` to automate salary generation. It creates `StaffPayroll` records and `Expense` entries, deducting from the selected Asset account.
    *   **Financial Intelligence:**
        *   Added `get_financial_report` to `BankController` calculating Gross Profit (Revenue - Theoretical COGS) and Net Profit (Gross Profit - OpEx).
        *   Added `get_cash_flow` to `BankController` for daily balance tracking across all asset accounts.
    *   **API:** Registered `ExpenseController` and updated `UsersController` with `run-payroll` endpoint.

### 🎨 Frontend Changes
*   **Commit:** `6ae4b37`
*   **Summary:** Added Finance Dashboard and Expense Management UI.
*   **Details:**
    *   **View:** Created `Finance.tsx` component as a central hub for P&L and Cash Flow.
    *   **Dashboard:** Visualized Gross Revenue, Theoretical COGS, Gross Profit, and Net Profit. Added a simplified daily Cash Flow chart.
    *   **Expense Logging:** Implemented a modal for manual operational expense entry.
    *   **Payroll:** Added "Run Payroll" button with confirmation and payment account selection.
    *   **Service:** Updated `apiService.ts` and `types.ts` with new finance-related methods and interfaces.
    *   **Navigation:** Added "Finance & P&L" link to the Sidebar.

## 🟢 Session: 2026-01-21 (Morning)
**Topic:** PWA, Offline Support, & UI Polish.
**Branches:** `main`

### 🎨 Frontend Changes
*   **Commit:** `5d75653`
*   **Summary:** Transformed the application into a PWA with full offline capabilities and enhanced Order UI.
*   **Details:**
    *   **PWA:** Configured `vite-plugin-pwa` for installability. Added manifest, icons, and meta tags.
    *   **Offline Support:** Implemented Basic/Experimental `offlineService.ts` using IndexedDB (`idb`).
        *   **Caching:** Network-first strategy for GET requests (Menu, Inventory, Orders).
        *   **Sync:** Optimistic UI for mutations. Offline POST/PUT/DELETE requests are queued in an `outbox` and automatically synced when back online via `window.addEventListener('online')`.
        *   **Pending Orders:** Implemented logic to merge locally queued "offline orders" into the main Orders List, allowing seamless operation without internet.
        *   **Status:** Partial / Beta.
        *   **Known Limitations:**
            *   Complex offline workflows (e.g., creating an order and then immediately paying/editing it *while still offline*) are not supported due to temporary ID resolution limits.
            *   Inventory Restock items added offline are queued but will not visibly appear in the "Pending Restock" list until re-connection and sync.
    *   **UI Improvements:**
        *   **Supplies:** Added Sorting (Name, Stock Low/High) to prevent items from jumping around during updates.
        *   **New Order Modal:** Added loading spinner and graceful empty states ("No categories found", "No items") to prevent the "empty modal" experience during data fetch or if 500 errors occur.
        *   **Restock Manager:** Fixed jumpy sliders by refactoring into `RestockItemRow` with local state. Replaced Alerts with Toasts. Implemented `removeRestockItem`.
        *   **Tables:** Populated tables for Restaurant 1 & 2 to ensure the order flow works.
        *   **Dishes:** Populated initial menu items (Jus Alpukat, etc.).

### 🏗️ Backend Changes
*   **Commit:** `a839e2a`
*   **Fix:** Resolved `500 Internal Server Error` in `TablesController` (and other controllers) by stripping the `res-` prefix from `X-Restaurant-ID` header. This fixed the "New Order modal empty" issue.
*   **Commit:** `70e6590`
*   **Fix:** Adjusted Kitchen Receipt layout: Normal size bold text, "Dish" and "Berjumlah" headers, quantity on the right.

---

## 🟢 Session: 2026-01-07 (Morning)
**Topic:** Multi-Restaurant Architecture, Inventory Restock, & UX Polish.
**Branches:** `main`

### 🏗️ Backend Changes
*   **Commit:** `9a81c27` (Root Reference Update)
*   **Summary:** Implemented "Global Definitions, Local Stock" architecture and Restock workflows.*   **Details:**
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
*   **Root Cause 1 (Cross-Browser):** Missing trailing slashes in API calls caused 301 redirects which failed in some environments or were mishandled by the proxy/browser/combination. **Fixed.**
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
