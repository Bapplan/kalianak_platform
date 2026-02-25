# Design of the "economy part"

## 1. The High-Level Concept

To keep the restaurants separate but the system unified, every financial record must belong to a specific Restaurant.

Instead of just recording "Sales," we will use a Ledger approach. This allows you to track:

- Where money comes from: (e.g., Sales, Capital Injection)

- Where money is: (e.g., Cash Drawer Resto 1, BCA Account Resto 2)

- Where money goes: (e.g., Repairs, Ingredient Purchasing)

## 2. The Core Django Models

Here is the recommended database schema.

A. Organization & Configuration

First, we define the restaurants and the "buckets" where money lives or moves.

```py
from django.db import models
from django.utils.translation import gettext_lazy as_

class Restaurant(models.Model):
    name = models.CharField(max_length=100) # e.g., "Ikan Bakar Kalianak"
    slug = models.SlugField(unique=True)    # e.g., "resto-2"
    # Address, logo, etc.

    def __str__(self):
        return self.name

class AccountGroup(models.Model):
    """
    Classifies the type of account.
    Examples: "Revenue", "Expense", "Asset (Cash/Bank)", "Liability"
    """
    GROUP_TYPES = (
        ('ASSET', 'Asset (Cash/Bank)'),
        ('LIABILITY', 'Liability'),
        ('EQUITY', 'Equity'),
        ('REVENUE', 'Revenue (Sales)'),
        ('EXPENSE', 'Expense (Purchases/Repairs)'),
    )
    name = models.CharField(max_length=50)
    type = models.CharField(max_length=20, choices=GROUP_TYPES)

class Account(models.Model):
    """
    Specific accounts. 
    Examples: "Cash Drawer (Resto 1)", "BCA QRIS", "Kitchen Repair Costs", "Food Sales"
    """
    restaurant = models.ForeignKey(Restaurant, on_delete=models.CASCADE, related_name='accounts')
    group = models.ForeignKey(AccountGroup, on_delete=models.PROTECT)
    name = models.CharField(max_length=100)
    code = models.CharField(max_length=20, blank=True) # e.g., "1001" for sorting

    def __str__(self):
        return f"{self.restaurant.name} - {self.name}"
```

Why this helps:This structure allows you to have a "Repair Expense" account for Restaurant 1 and a separate "Repair Expense" for Restaurant 2.

B. The Transaction (The Ledger)This is the heart of the economy part. Every time money moves (Sales, Repairs, Stock), it creates a Transaction.

```py
class Transaction(models.Model):
    """
    The header for any financial movement.
    """
    restaurant = models.ForeignKey(Restaurant, on_delete=models.CASCADE)
    date = models.DateTimeField(auto_now_add=True)
    description = models.CharField(max_length=255) # e.g. "Order #123" or "AC Repair"
    
    # Optional: Link to other parts of your system
    related_order = models.ForeignKey('orders.Order', null=True, blank=True, on_delete=models.SET_NULL)
    related_purchase = models.ForeignKey('inventory.Purchase', null=True, blank=True, on_delete=models.SET_NULL)

class JournalEntry(models.Model):
    """
    The specific line items (Double Entry). 
    Total Debits must equal Total Credits for a transaction.
    """
    transaction = models.ForeignKey(Transaction, related_name='entries', on_delete=models.CASCADE)
    account = models.ForeignKey(Account, on_delete=models.PROTECT)
    debit = models.DecimalField(max_digits=12, decimal_places=2, default=0)
    credit = models.DecimalField(max_digits=12, decimal_places=2, default=0)

```

## 3. Handling the Payment Methods

You mentioned Cash, QRIS, Debit, Credit, and Transfer. In this system, these are treated as Asset Accounts.

Example Setup for "Restaurant 1":

Payment Option, Corresponding Account (Asset),  Note
Cash,           "Resto 1 Cash Drawer",          Physical money in the box.
QRIS,           "Resto 1 QRIS Clearing",        Money pending settlement from payment gateway.
Debit/Credit,   "Resto 1 EDC Settlement",       Money in the machine, not yet in bank."
Bank Transfer,  "Resto 1 BCA Main",             Direct to bank.

Scenario: A Customer buys food for 100,000 using QRIS.

1. Transaction created: "Order #505 Payment"

2. Entry 1 (Credit): Account "Food Sales" -> 100,000 (Income goes up)

3. Entry 2 (Debit): Account "QRIS Clearing" -> 100,000 (Asset goes up)

## 4. Handling Expenses (Stock, Repairs)

This structure makes expenses very easy to manage and report on.

Scenario: You take 50,000 Cash from the drawer to pay for a broken fan repair.

1. Transaction created: "Fan Repair"
2. Entry 1 (Debit): Account "Repair & Maintenance Expense" -> 50,000
3. Entry 2 (Credit): Account "Resto 1 Cash Drawer" -> 50,000

Scenario: You buy 500,000 of fish (ingredients) via Bank Transfer.

1. Transaction created: "Fish Stock Purchase"
2. Entry 1 (Debit): Account "Cost of Goods Sold (Ingredients)" -> 500,000
3. Entry 2 (Credit): Account "Resto 1 BCA Main" -> 500,000

## 5. Implementation Strategy (The "Logic")

You shouldn't create Journal Entries manually in your views every time. You should create Service Methods in your Django code to handle the logic.

```py
# services.py (Pseudocode)

def process_sale(order, payment_method):
    # 1. Identify the Asset Account based on payment method (Cash/QRIS/etc)
    asset_account = get_asset_account(order.restaurant, payment_method)
    
    # 2. Identify the Revenue Account
    revenue_account = get_revenue_account(order.restaurant)
    
    # 3. Create Transaction
    trans = Transaction.objects.create(
        restaurant=order.restaurant, 
        description=f"Order {order.id}",
        related_order=order
    )

## 4. Debit the Asset (Money In)

JournalEntry.objects.create(transaction=trans, account=asset_account, debit=order.total, credit=0)

## 5. Credit the Revenue (Sales Recorded)

JournalEntry.objects.create(transaction=trans, account=revenue_account, debit=0, credit=order.total)
```

## Summary of Benefits for Kalianak

1. Separation: You can instantly run a report: "Show me Profit/Loss for Restaurant 1" vs "Restaurant 2".

2. Accuracy: If you pay for repairs using Cash, your "Cash Drawer" balance in the system will automatically go down. This matches the real cash register.

3. Scalability: If you add a 3rd restaurant later, you just create a new Restaurant object and new Accounts; the code doesn't change.

4. QRIS/Card Tracking: You can see exactly how much money is stuck in "QRIS Clearing" waiting to be deposited to your bank.