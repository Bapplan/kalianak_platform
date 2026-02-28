# Scaffold a New Ninja API Endpoint

Create a new endpoint in an existing or new Django app.

Usage: `/new-api-endpoint $ARGUMENTS`
Example: `/new-api-endpoint GET /api/expenses/summary/ in apps/expenses/`

## Steps

1. **Identify the target app** from $ARGUMENTS. If unclear, ask the user.

2. **Read the existing `api.py`** in that app to understand current patterns:
```bash
cat backend/apps/<app>/api.py
```

3. **Define the Schema(s)** — add to the existing `api.py`:
```python
class NewThingSchema(Schema):
    id: str
    name: str
    # Add fields matching what the frontend needs
    # Always prefix IDs: f"thing-{pk}"
```

4. **Add the controller method** (or create new controller if the app has none):
```python
@api_controller("/things", tags=["Things"])
class ThingsController:

    def _get_restaurant(self, request):
        resto_id = request.headers.get("X-Restaurant-ID", "").replace("res-", "")
        return Restaurant.objects.filter(id=resto_id).first()

    @http_get("/", response=List[NewThingSchema])
    def list_things(self, request):
        restaurant = self._get_restaurant(request)
        qs = Thing.objects.filter(restaurant=restaurant)
        return [{"id": f"thing-{t.id}", "name": t.name} for t in qs]

    @http_post("/", response=NewThingSchema)
    def create_thing(self, request, data: CreateThingSchema):
        # Strip prefix from any incoming IDs:
        # related_id = int(data.relatedId.replace("related-", ""))
        pass
```

5. **Register the controller** in `core/urls.py` if it's a new controller:
```python
# core/urls.py
from apps.things.api import ThingsController
api.register_controllers(ThingsController)
```

6. **Verify** the endpoint appears in Swagger:
```
http://localhost:8001/api/docs
```

7. **Add the frontend call** in `frontend/src/services/apiService.ts` if needed:
```typescript
case 'things':
  return this.fetchJson<T[]>('/things/');
```

## Conventions to Follow
- ID fields in responses: always `f"{prefix}-{pk}"` (see ID Prefixing in [../CLAUDE.md](../CLAUDE.md))
- Multi-tenancy: always filter by restaurant from `X-Restaurant-ID` header
- Keep controllers thin — put business logic in `services.py`
- Schema field names use camelCase (matches TypeScript frontend)
- Django model field names use snake_case
