# Django Migration Error – "inventory.side" not found

## Felet

```
ValueError: The field orders.OrderSide.side was declared with a lazy reference to 'inventory.side', but app 'inventory' doesn't provide model 'side'.
```

Django försöker hitta en modell som heter **Side** i appen **inventory**, men hittar ingen match.

---

## Vanliga orsaker och lösningar

### 1. Felaktig strängreferens (skiftläge)

Om du har:

```python
side = models.ForeignKey('inventory.side', ...)
```

så ska det vara:

```python
side = models.ForeignKey('inventory.Side', on_delete=models.PROTECT, related_name='order_sides')
```

**Notera:** Modellnamnet är klassnamnet och är **skiftlägeskänsligt**.

---

### 2. Modellnamnet stämmer inte

Om modellen egentligen heter `ItemSide`:

```python
side = models.ForeignKey('inventory.ItemSide', ...)
```

---

### 3. Fel app label i `apps.py`

Om `INSTALLED_APPS` innehåller `'apps.inventory'` och du i `apps.py` har:

```python
class InventoryConfig(AppConfig):
    name = 'apps.inventory'
    label = 'inventories'
```

då måste FK-strängen använda **labeln**:

```python
side = models.ForeignKey('inventories.Side', ...)
```

Alternativt ändra `label` till `inventory`.

---

### 4. Modellen finns men migration saknas

Kör:

```bash
uv run python manage.py makemigrations inventory
uv run python manage.py makemigrations
uv run python manage.py migrate --plan
uv run python manage.py migrate
```

---

### 5. Fel ordning på migrationerna

Öppna senaste migrationsfilen i **orders** (t.ex. `orders/migrations/0002_...py`) och säkerställ att `dependencies` inkluderar inventorys migration som skapar `Side`:

```python
dependencies = [
    ('inventory', '0001_initial'),
]
```

Justera till rätt nummer om `Side` skapades senare.

---

### 6. Modellen har bytt namn

Om du bytt namn på `Side` → skapa en `RenameModel`-migration eller uppdatera FK och kör nya migrationer.

---

## Snabb felsökningssekvens

```bash
# 1) Leta efter klassen
rg -n "class Side\(models.Model\)" apps/inventory inventory

# 2) Kolla FK-raden
rg -n "ForeignKey\(['\"]inventory\." orders

# 3) Visa migrationsordning
uv run python manage.py showmigrations inventory orders

# 4) Testa bygga migrationer
uv run python manage.py makemigrations --dry-run --check
```
