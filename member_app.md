# Kalianak Member App

This is a comprehensive **Developer Specification & Design System** for the **Kalianak Member App**. This document is structured to be handed directly to a developer or used as a blueprint for the project.

It leverages **Konsta UI’s** strengths (native-like feel, dual iOS/Material theming) and integrates your specific backend requirements.

---

# 📱 App Specification: Kalianak Member App

**Project Goal:** Create a premium, "pixel-perfect" mobile loyalty and ordering application for Android & iOS.
**Core Vibe:** Modern, immersive (live video), and high-utility (instant points/history).
**Tech Stack:** React + Capacitor + Konsta UI + Tailwind CSS ↔ Django Ninja Extra (Postgres).

---

## 1. Design System & Layout Strategy

We will use **Konsta UI's App Shell** layout. This ensures the app looks native on iPhones (Cupertino style) and Androids (Material You style) automatically.

- **Global Theme:** Dark Mode preferred for "Video Streaming" vibes, or a clean Light Mode with high-contrast text.
- **Navigation:** Bottom Tab Bar navigation (persistent).
- **Typography:** System fonts (San Francisco on iOS, Roboto on Android) to maintain native feel.
- **Color Palette:**
    - *Primary:* `#500302` (Kalianak Brand Color).
    - *Secondary:* `#FFD931` (For points/rewards).
    - *Surface:* Glassmorphism effects (blur) on top of the live stream background.
    - *Other colors to use* `#245B47` `#0D3A32` `#C1B6AB`

### The "App Shell" Structure (React)

The root component must wrap everything in the Konsta `App` provider to handle safe areas and theming.

```jsx
// src/App.jsx
import { App } from 'konsta/react';

export default function MyApp() {
  return (
    // 'safeAreas' handles notch/dynamic island automatically
    <App theme="ios" darkSafeAreas={true} safeAreas={true}>
       {/* React Router or View Router Here */}
    </App>
  );
}
```

---

## 2. Screen-by-Screen Specifications

### A. Login / Onboarding (The "OTPless" Flow)

**Objective:** Frictionless entry. No passwords.

- **Layout:**
    - Full-screen background image (High-quality shot of the restaurant or muted video).
    - **Center Card:** A glass-morphic container floating in the middle.
    - **Action:** A large, native-looking button: "Continue with WhatsApp" (Powered by OTPless).
- **Behavior:**
    - On click -> Triggers OTPless WhatsApp deep link.
    - On Success -> JavaScript callback receives user payload.
    - **Backend Sync:** POST payload to Django Endpoint `/api/auth/otpless/`. If user exists, return token. If new, create `Customer` model and return token.

### B. Home Tab (The "Immersive" Dashboard)

**Objective:** Wow factor + Utility.

- **Header:** Transparent Navbar. User's Avatar (left) and current "Open/Closed" status badge (right).
- **Hero Section (Live Stream):**
    - Instead of a static image, the top 40% of the screen is the **Live Video Stream** (HLS player).
    - *Overlay:* A subtle gradient at the bottom of the video to make text readable.
    - *Floater:* "Live Now" pulsing red dot badge.
- **Member Card (Overlapping the Video):**
    - A Gold/Platinum credit-card style widget that sits *halfway* over the video and halfway on the white background (z-index high).
    - **Data:** "Hello, [Name]", "Current Points: 1,250", "Member Tier: Gold".
- **Quick Actions:** Horizontal scrollable row of chips: [Reserve Table] [View Menu] [Call Us].
- **Konsta Component:** `Block`, `Card` (with `raised` prop).

### C. Menu & Ordering Tab

**Objective:** Easy browsing and cart management.

- **Layout:**
    - **Search Bar:** Searchbar component (Konsta `Searchbar`) pinned to top.
    - **Categories:** Segmented Control or Horizontal scroll chips (e.g., "Starters", "Mains", "Drinks").
    - **List:** `List` component with `MediaList` items.
- **Item Card Design:**
    - Thumbnail on the left (rounded corners).
    - Title & Price (bold).
    - **Add Button:** A small `Stepper` component ( - 1 + ) directly on the list item to add to cart without opening a new page.
- **Floating Action Button (FAB):**
    - Shows when items are in cart.
    - Displays "View Cart (3 items) - $45.00".
- **Backend Integration:**
    - `GET /api/menu/` (Cached locally).
    - `POST /api/orders/` (Submit cart).

### D. History & Activity Tab

**Objective:** Clear record of spending.

- **Layout:**
    - Use Konsta `List` with `GroupTitle` (grouped by Month/Year).
- **List Items:**
    - **Left:** Date (e.g., "24 JAN").
    - **Center:** Order ID & Status Badge (e.g., "Completed", "Preparing" in Green/Orange).
    - **Right:** Total Price (e.g., "$120").
- **Interactivity:**
    - Tapping an item opens a `SheetModal` (slide-up from bottom) showing the full receipt details.
    - "Re-order" button in the modal.

### E. Profile & Settings

**Objective:** Account management.

- **QR Code:** Large QR Code in center (for scanning at the cashier to earn points).
- **Settings List:**
    - Edit Profile (Update Name/Dietary prefs).
    - Notification Preferences.
    - Support (WhatsApp link).
    - Logout.

---

## 3. Developer Implementation Notes

### Technical Data Flow

1. **Auth (OTPless & Django):**
    - Use `useEffect` to initialize the OTPless SDK.
    - Upon auth success, store the JWT (access token) in Capacitor `Preferences` (formerly Storage).
    - Add this token to the Authorization header of all Axios/Fetch requests.
2. **Live Stream (HLS):**
    - Use `react-player` or a native Capacitor video plugin if performance is key.
    - *Tip:* Mute by default, add a "Tap to Unmute" button.
3. **State Management:**
    - Use **Zustand** or **React Context** to hold the `Cart` state and `User` state (Points balance) globally so the badges update instantly.
4. **Backend Models (Django Ninja Extra):**
Ensure your API exposes these schemas:
    - `CustomerSchema`: { id, name, phone, points_balance, tier }
    - `MenuSchema`: { id, name, price, image_url, category, is_available }
    - `OrderSchema`: { id, items: [], total, status, created_at }

### Konsta UI "Cheat Sheet" for this App

Use these specific components to achieve the "Super Nice" look:

| **UI Element** | **Konsta Component** | **Style Notes** |
| --- | --- | --- |
| **Main Layout** | `<Page>`, `<Navbar>`, `<Toolbar>` | Use `translucent={true}` on Navbar for that glassy iOS feel. |
| **Lists** | `<List>`, `<ListItem>` | Use `inset` prop on Lists to make them look like grouped cards (modern iOS style). |
| **Modals** | `<Sheet>` | Perfect for Order Details. Use `backdrop` and `swipeToClose`. |
| **Inputs** | `<ListInput>` | Use `outline` or `floatingLabel` for forms. |
| **Feedback** | `<Preloader>`, `<Toast>` | Show a Toast notification when "Points Collected" or "Order Sent". |