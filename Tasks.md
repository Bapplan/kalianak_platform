# Claude Code Instructions — Ikan Bakar POS

> Work through these in order. Items 1–3 are foundational (auth must exist before permissions can work). Items 4–7 can be done in parallel once 1–3 are stable.

---

## 1. Fix iOS Safe Area (Critical UI Bug)

The modal header on iOS is rendering behind the system status bar, making the close button, chevron, and "Clear" button unclickable.

**Steps:**

1. In `index.html`, ensure the viewport meta tag includes `viewport-fit=cover`:
```html
   <meta name="viewport" content="viewport-fit=cover, width=device-width, initial-scale=1.0" />
```

2. Find the Current Order modal container and apply:
```css
   .order-modal, .modal-header, .current-order-sheet {
     padding-top: max(16px, env(safe-area-inset-top));
   }
```

3. Also apply safe area to the bottom so "Confirm Order" button isn't clipped:
```css
   .modal-footer, .confirm-order-btn {
     padding-bottom: max(16px, env(safe-area-inset-bottom));
   }
```

Test on a real iPhone or Xcode simulator using a notched device model.

---

## 2. Authentication — Connect Login Form to Database

Currently the login form accepts any input. This needs real authentication.

**Steps:**

1. Create a `users` table with fields: `id`, `name`, `username`, `password_hash`, `role` (`admin` | `manager` | `staff`), `restaurant` (`kalianak_1` | `kalianak_2`), `is_active`, `last_login`.
2. On login form submit, send credentials to a backend auth endpoint (e.g. `/api/auth/login`).
3. Validate server-side — compare password against hashed password (use bcrypt or similar).
4. On success, return a JWT or session token and store it in the app. Reject wrong credentials with a clear error message.
5. Protect all routes — redirect unauthenticated users back to login.

---

## 3. Role-Based Permissions & Navigation

Gate nav links by role using the role value from the logged-in user's session/token.

| Nav Link         | Admin | Manager | Staff |
|------------------|-------|---------|-------|
| Dashboard        | ✅    | ✅      | ✅    |
| Orders           | ✅    | ✅      | ✅    |
| Menu Registry    | ✅    | ✅      | ✅    |
| Supplies         | ✅    | ✅      | ❌    |
| Staff Management | ✅    | ❌      | ❌    |
| Settings/System  | ✅    | ❌      | ❌    |
| Bank & Cash      | ✅    | ❌      | ❌    |
| Finance & P&L    | ✅    | ❌      | ❌    |
| Recipe Cost      | ✅    | ❌      | ❌    |
| Statistics       | ✅    | ❌      | ❌    |

> **Important:** Don't just hide links on the frontend — also enforce role checks on backend API endpoints so restricted routes can't be accessed directly.

---

## 4. Dynamic Restaurant Name Based on Login

The login form should include a restaurant selector (`Kalianak 1` or `Kalianak 2`). This selection must persist in the user session and be reflected throughout the app.

**Changes:**

1. Replace the dashboard terminal title `"Restaurant 1 Terminal"` with `"Kalianak 1"` or `"Kalianak 2"` dynamically based on the logged-in session.
2. In the **System Status + Recent Logs** card: delete the card entirely. If keeping it, remove the subtitle `"Welcome back. System is operational and synced with inventory."`.
3. Store the restaurant context with each order for reporting purposes.

---

## 5. Staff Online/Offline Sensor (Admin View)

Admin should be able to see which staff members are currently logged in.

**Steps:**

1. On login, record `last_login` timestamp and set `is_online: true` on the user record.
2. On logout or token expiry, set `is_online: false`.
3. Use a heartbeat ping every ~60 seconds from the client to keep the session marked active. If no heartbeat for X minutes, auto-mark as offline.
4. In the Admin dashboard or Staff Management page, show each staff member with a live status indicator (🟢 online / ⚫ offline) and their `last_login` time.

---

## 6. Dashboard Welcome Title

> ⚠️ **Awaiting input from Anders** — please specify the new title text so the model knows exactly what string to replace.

---

## 7. Add-to-Order Animation Feedback

When a menu item is tapped in the New Order screen, there must be clear visual feedback that it was added to the order.

**Implementation:**

1. On item tap, briefly apply an `added` CSS class that scales the card and flashes the app's green accent color, then removes it after ~300ms.
2. Animate the order item count badge in the header with a quick "pop" scale animation when the count increases.
3. Optionally show a floating `+1` label that rises and fades from the tapped item for extra clarity.
```css
.menu-item.added {
  animation: item-flash 0.3s ease;
}

@keyframes item-flash {
  0%   { transform: scale(1);    background-color: inherit; }
  50%  { transform: scale(0.95); background-color: #aaff00; }
  100% { transform: scale(1);    background-color: inherit; }
}
```

Trigger via JavaScript:
```js
item.classList.add('added');
setTimeout(() => item.classList.remove('added'), 300);
```