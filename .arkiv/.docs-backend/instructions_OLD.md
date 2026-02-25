# Kalianak POS – Smart Restaurant Point-of-Sale System

## Project Overview

Kalianak POS is a modern, tablet-friendly Point-of-Sale (POS) web application built for the Ikan Bakar Kalianak restaurant. It's designed to streamline order management, payment processing, and inventory tracking with a clean, intuitive interface.

### Key Features

- **Order Management**: Create, edit, and track orders from pending to paid status
- **Payment Processing**: Support for multiple payment methods (Cash, QRIS, Debit/Credit Cards)
- **Inventory Tracking**: Monitor ingredient usage and stock levels
- **Staff management**: List employees, salaries, absent, vacations, etc.
- **Menu Management**: Easily update menu items, categories, and pricing
- **User Authentication**: Role-based access control for staff members
- **PWA Support**: Install as a native-like app on mobile devices
- **Responsive Design**: Works on tablets, phones, and desktop computers

## Technical Architecture

### Backend

- **Framework**: Django (Python)
- **Database**: PostgreSQL
- **Authentication**: Django's built-in auth system
- **Environment**: Docker containerized deployment

### Frontend

- **Primary UI Framework**: HTMX + Tailwind CSS + DaisyUI
- **CSS Framework**: Tailwind CSS with DaisyUI components
- **Icons**: Font Awesome 6.4.0
- **PWA Support**: Service Worker + Web Manifest

## Development Rules & Guidelines

### Absolute Requirements

1. **HTMX-First Approach**
   - HTMX is the ONLY JavaScript framework allowed for dynamic interactions
   - No vanilla JavaScript except where absolutely necessary (and only as minimal inline scripts)
   - No React, jQuery, Vue, or other JavaScript frameworks

2. **Progressive Enhancement**
   - All core functionality must work without JavaScript
   - HTMX enhances the experience but isn't required for basic operations

3. **Minimal Dependencies**
   - Avoid unnecessary libraries and dependencies
   - Use CDN for Tailwind CSS, DaisyUI, and Font Awesome

4. **PWA Compliance**
   - Must work offline for core functions
   - Must be installable on mobile devices
   - Service worker must cache essential assets

### Code Organization

1. **Django Apps Structure**
   - `pos`: Core POS functionality (orders, payments)
   - `menu`: Menu items and categories
   - `inventory`: Ingredient tracking and stock management
   - `suppliers`: Supplier management
   - `chatbot`: AI assistant integration

2. **Template Structure**
   - Base template with common elements
   - Page-specific templates extending base
   - Partial templates for HTMX-loaded components
   - Modal templates for overlays

3. **Static Files**
   - CSS in `/static/css/`
   - Images in `/static/images/`
   - Service worker in `/static/js/service-worker.js`
   - Manifest in `/static/manifest.json`

### UI/UX Guidelines

1. **Navigation**
   - "Kembali" (Back) buttons positioned in the top bar (left corner) using the `back_button` block
   - Clear visual hierarchy with consistent button styling
   - Mobile-first responsive design

2. **Color Scheme**
   - Primary: Restaurant brand colors
   - Success: Green for positive actions
   - Warning: Yellow/Orange for pending states
   - Error: Red for errors/alerts
   - Use DaisyUI theme variables for consistency

3. **Components**
   - Cards for order items and menu items
   - Modals for forms and confirmations
   - Badges for status indicators
   - Responsive grid layouts

### HTMX Patterns

1. **Request Patterns**
   - `hx-get` for retrieving data
   - `hx-post` for submitting forms
   - `hx-target` for specifying update targets
   - `hx-swap` for controlling DOM updates
   - `hx-trigger` for event binding

2. **Common Interactions**
   - Form submissions with validation feedback
   - Dynamic content loading
   - Modal dialogs
   - Polling for updates (orders list)
   - Confirmation dialogs

3. **CSRF Protection**
   - All HTMX POST requests must include CSRF token
   - Use the `{% csrf_token %}` in forms
   - Include CSRF in HTMX headers via base template

### Database Schema

1. **Core Models**
   - `Order`: Tracks customer orders and their status
   - `OrderDish`: Many-to-many relationship between orders and dishes
   - `Dish`: Menu items available for ordering
   - `Category`: Grouping for menu items
   - `Ingredient`: Raw materials used in dishes
   - `Table`: Restaurant tables for dine-in orders
   - `User`: Staff members with roles and permissions
   - and more ...

2. **Key Relationships**
   - Orders have many Dishes (through OrderDish)
   - Dishes belong to Categories
   - Dishes require Ingredients
   - Orders can be assigned to Tables
   - Orders are created by Users (staff)

### Authentication System

1. **User Management**
   - Staff login required for all operations
   - User tracking for order creation and modifications
   - Display logged-in username in header

2. **Security**
   - `@login_required` decorator on all views
   - Proper password hashing and storage
   - Session management with secure cookies

### Payment Flow

1. **Order Creation**
   - Create order as "pending" (no payment method needed)
   - Assign to table or mark as takeaway
   - Calculate total price

2. **Payment Processing**
   - Select payment method in payment modal
   - For cash: Enter amount, calculate change
   - For digital payments: Auto-confirm with exact amount
   - Mark order as paid with payment method saved

3. **Order Status Flow**
   - Pending → Ready for Pickup → Paid
   - Each status change is tracked with timestamps

### PWA Implementation

1. **Service Worker**
   - Cache static assets and critical HTML
   - Provide offline functionality
   - Handle background sync for orders

2. **Web Manifest**
   - App name, icons, and theme colors
   - Display mode: standalone
   - Orientation: portrait
   - Start URL: POS dashboard

3. **Installation**
   - "Add to Home Screen" prompt
   - App-like experience when launched

### Environment Configuration

1. **Environment Variables**
   - Database connection (host, credentials)
   - Django secret key
   - Debug mode toggle
   - Allowed hosts

2. **Development vs Production**
   - Development: Local database, debug mode
   - Production: Containerized deployment
   - Staging: Testing environment

## Specific Implementation Details

### Order Management

1. **Order Creation**
   - Select table or takeaway
   - Add menu items with quantities
   - Apply discounts if applicable
   - Save as pending order

2. **Order Processing**
   - Mark pending orders as "ready for pickup"
   - Process payments
   - View order history

### Payment System

1. **Payment Methods**
   - Cash: Requires amount input, calculates change
   - QRIS: Digital payment via QR code
   - Debit/Credit Cards: Card payment processing

2. **Payment Confirmation**
   - Success animation with GIF
   - Order details summary
   - Change amount for cash payments

### Inventory Management

1. **Stock Tracking**
   - Automatic deduction from inventory when orders are placed
   - Low stock alerts
   - Inventory dashboard

2. **Supplier Integration**
   - Order supplies when low
   - Track supplier information
   - Manage deliveries

## Common Issues & Solutions

1. **Database Connection**
   - Local development: Use `localhost` as DB_HOST
   - Docker: Use container name as DB_HOST
   - Check environment variables in `.env` file

2. **Static Files**
   - Run `collectstatic` after adding new static files
   - Check STATIC_URL and STATIC_ROOT in settings
   - Verify file paths in templates

3. **HTMX Issues**
   - Check browser console for errors
   - Verify CSRF token is included
   - Check target elements exist in DOM

4. **PWA Installation**
   - Ensure manifest.json is properly referenced
   - Verify service worker registration
   - Test on HTTPS or localhost

## Best Practices

1. **Code Quality**
   - Follow PEP 8 for Python code
   - Use Django's class-based views where appropriate
   - Keep templates DRY with partials and includes

2. **Performance**
   - Optimize database queries
   - Use Django's select_related and prefetch_related
   - Minimize DOM updates with targeted HTMX swaps

3. **Security**
   - Keep dependencies updated
   - Use Django's built-in security features
   - Validate all user inputs

4. **Testing**
   - Write unit tests for models and views
   - Test HTMX interactions with Selenium
   - Verify PWA functionality on multiple devices

## Conclusion

The Kalianak POS system is designed to be a robust, user-friendly solution for restaurant management. By following these guidelines and best practices, we ensure a consistent, maintainable codebase that delivers an excellent user experience for restaurant staff.
