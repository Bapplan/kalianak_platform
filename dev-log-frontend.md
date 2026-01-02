# Development Log - Frontend (Kalianak Platform)

## 🟢 Session: 2025-12-30 18:30:00

- **Topic:** Staff Tracking & Payment UX
- **Git Branch:** 🕹️ `main` 🕹️
- **Git Commit:** (Pending)

### ✨ Summary of Activities

- **Staff Tracking**:
  - Updated `App.tsx` to send real username as `staffId`.
  - Added `staffName` to `Order` type.
  - Updated `OrdersList` details modal to show both Table and Staff Member in a 3-column layout.
- **Payment UX Improvements**:
  - Filtered out "Grab" and "Grep" accounts from the payment modal.
  - Implemented a touch-friendly **Numpad** for Cash payments.
  - Added real-time **Change** calculation display.
  - Removed old manual amount input for a cleaner look.

### 👌 What Went Well

- The 3-column layout in order details provides a high-density information view that is easy to read.
- The Numpad makes the tablet experience much better for cashiers.

---

## 🟢 Session: 2025-12-30 18:00:00

- **Topic:** UI Styling & Logic Tweaks
- **Git Branch:** 🕹️ `main` 🕹️
- **Git Commit:** (Pending)

### ✨ Summary of Activities

- **Recipe Cost Analysis**:
  - Replaced "Base Cost" display with "Profit" (showing `Selling Price - Cost`).
  - Styled Profit as success (green) for better visual feedback.
- **Order List Badges**:
  - Improved `PENDING` status badge: Orange background, darker orange text, orange border.
  - Improved `PAID` status badge: Green background, darker green text, green border.
  - This improves readability and distinction between states.

### 👌 What Went Well

- Quick Tailwind class adjustments made significant visual improvements.

---

## 🟢 Session: 2025-12-30 17:30:00

- **Topic:** Order Management Enhancements
- **Git Branch:** 🕹️ `main` 🕹️
- **Git Commit:** (Pending)

### ✨ Summary of Activities

- **Pending Orders Actions**:
  - Added "Edit" and "Pay" buttons to the Orders List for pending orders.
  - Created `EditOrderModal`: Allows modifying item quantities, removing items, and changing tables.
  - Created `PayOrderModal`: Handles payment processing with selection of Bank Accounts (Cash, QRIS, etc.).
- **Table Management**:
  - Updated `NewOrderModal` to require Table selection.
  - Added `Table` interface and API integration.
- **UI/UX**:
  - Implemented smooth zoom/fade animations for all modals.
  - Added visual validation for table selection.

### 👌 What Went Well

- Reusing the cart logic from `NewOrderModal` for `EditOrderModal` saved significant time.
- The separation of "Order" and "Transaction" logic is clean.

---

## 🟢 Session: 2025-12-30 17:00:00

- **Topic:** Bank Module Integration
- **Git Branch:** 🕹️ `main` 🕹️
- **Git Commit:** (Pending)

### ✨ Summary of Activities

- **Bank Component Integration**:
  - Replaced mock `db` calls in `Bank.tsx` with real `api` service calls.
  - Added "Account Balances" section to the Bank dashboard.
  - Updated the Ledger table to display the used Account for each transaction.
- **Service & Types Update**:
  - Added `BankAccount` interface and updated `Transaction` interface in `types.ts`.
  - Added `transactions` and `accounts` endpoints to `ApiService.ts`.
  - Updated `loadInitialState` to fetch financial data on startup.

### 👌 What Went Well

- The Bank dashboard is now fully functional and reflects real-time balances from the backend.
- UI components (DaisyUI) adapted easily to the new data structure.

---

## 🟢 Session: 2025-12-28 14:00:00

- **Topic:** Backend Integration & Service Refactor
- **Git Branch:** 🕹️ `main` 🕹️
- **Git Commit:** Committed `6401c48` (Feat: Integrate Backend API, Persist Login, Fix Images)

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
- **Git Branch:** 🕹️ `main` 🕹️
- **Git Commit:** (Initial submodule setup)

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