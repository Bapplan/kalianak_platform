# Member App UI Redesign — Development Plan
**Model:** Claude Opus 4.6 via Claude Code  
**Goal:** Redesign the Kalianak Member App UI to match the modern, polished style of KFC Indonesia, Pizza Hut Indonesia, and Domino's Pizza Indonesia apps.

---

## Reference App Analysis (from screenshots)

### 1. KFC Indonesia App
- **Color palette:** Black hero banner, white card sections, green accent (#4CAF50 area), red badges
- **Hero section:** Full-width promotional banner (carousel with dots), bold title typography
- **User section:** Voucher count + coupon code input inline card
- **Order modes:** 4 icon grid (Dine-In / Take Away / Delivery / Drive-Thru) — circular icon buttons with label underneath
- **Recent orders section ("Order It Again"):** Card with image, location name, item count, price
- **Bottom navigation:** 5 tabs — Home, My Order, Scan (prominent center button with green circle), Reward, Account

### 2. Pizza Hut Indonesia App
- **Color palette:** Red primary (#CC0000), white background, dark text
- **Hero section:** Full-width red banner with carousel promo
- **User greeting card:** White card "Hi, [Name]" with 3 inline stats (Slices / Treasures / Vouchers)
- **Order modes:** 4 icon grid (Delivery / Takeaway / Dine In / Party)
- **Frequent faves section:** 2-column card grid with food photos
- **Bottom navigation:** 4 tabs — Home, My Order, Rewards, Profile

### 3. Domino's Pizza Indonesia App
- **Color palette:** Blue gradient hero (#1565C0), white/light gray cards, dark navy accents
- **Hero section:** Full-width blue gradient banner with promo
- **Order mode selector:** Toggle switch (Delivery | Takeaway) as pill buttons
- **Location card:** Shows selected branch address
- **Category grid:** 8 icons in 2 rows (Promo, Pizza, Sides, Bread, Wings, Dessert, Drinks, See All)
- **Bottom navigation:** 4 tabs — Beranda (Home), Menu, Aktivitas (Activity), Profil (Profile)

### 4. Current Kalianak App (to redesign)
- Dark black full-screen hero
- "Hello, mock_customer" greeting
- Gold/dark red membership card (Gold tier, Points Balance: 0)
- 3 action buttons (calendar, fork/knife, phone)
- Info text block
- Bottom nav: Home, Menu, History, Profile

---

## Redesign Goals

The Kalianak app has the right structure — membership card, greeting, navigation — but needs visual polish and a layout pattern that matches the reference apps. Here's what to change:

---

## Phase 1 — Hero & Header Section

**Current:** Black screen with just a "LIVE" badge and greeting text  
**Target:** A rich hero section like the reference apps

### Tasks:
1. **Add a promotional banner carousel** at the top (full-width, rounded bottom corners)
   - Use a `PageView` / `CarouselSlider` widget
   - Add dot indicators at bottom of banner
   - Display current Kalianak promo/event imagery or a placeholder gradient
2. **Move the greeting** ("Hello, mock_customer") from mid-screen into a white card that overlaps the bottom of the hero banner (like Pizza Hut's "Hi, Anders" card)
3. **Remove the "LIVE" badge** from the hero (or reposition it as a small overlay on the banner itself)

---

## Phase 2 — Membership Card Redesign

**Current:** Dark red card, small font, sparse layout  
**Target:** A premium card that feels like a loyalty/membership card

### Tasks:
1. Keep the dark red/maroon color — it's on-brand — but refine it:
   - Add subtle gradient or texture
   - Round corners more (borderRadius: 16–20)
   - Add a card logo/icon top-left
2. **Stats row** — display Membership tier + Points Balance side by side more clearly, with icons
3. Add a **progress bar** showing points progress toward next tier (even if 0 now — shows the UI pattern)
4. Style matches the Pizza Hut "Slices / Treasures / Vouchers" stat layout

---

## Phase 3 — Order Mode / Action Buttons

**Current:** 3 plain text icon buttons (calendar, fork, phone)  
**Target:** A grid of circular action buttons like KFC and Pizza Hut

### Tasks:
1. Replace 3-button row with a **2×2 or 1×4 icon grid**:
   - Suggested actions: **Reserve Table** (calendar), **Order Now** (fork+knife), **Call Us** (phone), **Promotions** (tag icon)
2. Each button: circular gray background icon + label text underneath
3. Style: same as KFC's "Dine-In / Take Away / Delivery / Drive-Thru" grid

---

## Phase 4 — Content Sections Below the Fold

**Current:** Just a welcome text block  
**Target:** Scrollable content cards similar to reference apps

### Tasks:
1. **"Special Offers" section** — horizontal scroll of promo cards (title + image + CTA)
2. **"Recent Activity" section** — if user has history, show last visit card (like KFC's "Order It Again")
3. **"About / Info" section** — replace the plain welcome text with a styled card that has an icon, brief text, and a "Learn More" button

---

## Phase 5 — Bottom Navigation

**Current:** 4 tabs — Home, Menu, History, Profile  
**Target:** Slightly more polished with an optional center-highlight tab

### Tasks:
1. Keep the 4 tabs but **add a center highlighted button** (like KFC's Scan button) — for Kalianak this could be a **"Book Table"** or **"Scan QR"** button
2. Style: Active tab uses brand maroon/red color, inactive tabs gray
3. Add subtle top border/shadow to nav bar

---

## Phase 6 — Color System & Typography

Define a consistent design token set for the dev:

| Token | Value | Usage |
|---|---|---|
| `primary` | `#8B1A1A` (dark red/maroon) | Buttons, active nav, card bg |
| `primaryLight` | `#A52020` | Hover states, gradients |
| `accent` | `#FFB800` (gold/yellow) | Points balance, Gold tier label |
| `background` | `#F5F5F5` | Screen background |
| `surface` | `#FFFFFF` | Cards |
| `textPrimary` | `#1A1A1A` | Main text |
| `textSecondary` | `#666666` | Subtitles, labels |
| `textOnDark` | `#FFFFFF` | Text on dark cards |

**Typography:**
- App name / large titles: Bold, 24–28px
- Section headers: SemiBold, 18–20px
- Body: Regular, 14–16px
- Labels/captions: Regular, 12px

---

## Phase 7 — Screen-by-Screen Implementation Order

Recommended build order for Claude Code:

1. `home_screen.dart` (or equivalent) — hero banner + greeting card
2. `membership_card_widget.dart` — redesigned loyalty card
3. `action_grid_widget.dart` — circular icon action buttons
4. `promotions_section_widget.dart` — horizontal promo cards
5. `bottom_nav_bar.dart` — updated navigation
6. Global `theme.dart` — apply color tokens and typography

---

## Prompt for Claude Code (copy-paste ready)

```
I need you to redesign the UI of my existing Kalianak Member App to match 
the style of modern food app UIs (KFC Indonesia, Pizza Hut Indonesia, 
Domino's Pizza Indonesia). I'm attaching 4 screenshots for reference (located in root dir. of kalianak_platform project):
- IMG_0774.jpeg: KFC Indonesia app (example of order mode grid, bottom nav)
- IMG_0773.jpeg: Pizza Hut app (example of greeting card + stats, color scheme)
- IMG_0776.jpeg: Domino's app (example of order toggle, category grid)
- IMG_0777.jpeg: Current Kalianak app (what we have now, needs redesign)

Please follow this redesign plan:

1. HOME SCREEN: Add a full-width hero banner carousel at the top with dot 
   indicators. Below the banner, show a white greeting card ("Hello, 
   [username]") that overlaps the banner edge slightly.

2. MEMBERSHIP CARD: Keep the dark maroon color but refine it — add gradient, 
   rounder corners (radius 16), clearer stats layout (membership tier + 
   points in a row), and a points progress bar.

3. ACTION GRID: Replace the 3 plain icon buttons with a 2×2 circular icon 
   grid: Reserve Table, Order Now, Call Us, Promotions. Use gray circle 
   backgrounds with icons and labels below, matching KFC's style.

4. CONTENT SECTIONS: Add a "Special Offers" horizontal scroll section and 
   replace the plain welcome text with a styled info card.

5. BOTTOM NAV: Add a highlighted center action button (Book/Scan), style 
   active tab in maroon (#8B1A1A), inactive in gray.

6. COLOR TOKENS: primary=#8B1A1A, accent=#FFB800, background=#F5F5F5, 
   surface=#FFFFFF.

Start with the home screen layout and work section by section. 
Show me the code for each widget and let me review before moving on.
```

---

## Notes for the Developer

- Use `react-native-snap-carousel` or `FlatList` horizontal
- Keep existing navigation structure — just restyle it, don't change routes
- The membership card should stay as the visual centerpiece — just make it richer
- All images/banners can use placeholder colors initially; swap in real assets later
