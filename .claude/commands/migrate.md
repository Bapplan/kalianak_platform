# Run Django Migrations

**IMPORTANT: This command requires explicit user confirmation before running on production.**

## Steps

1. First, show what migrations are pending:
```bash
docker compose exec backend uv run python manage.py showmigrations | grep '\[ \]'
```

Or if working locally with tunnel:
```bash
cd backend && uv run python manage.py showmigrations | grep '\[ \]'
```

2. Show the SQL that will be executed for each pending migration:
```bash
# Replace <app> and <number> with actual values from step 1
docker compose exec backend uv run python manage.py sqlmigrate <app> <number>
```

3. **STOP HERE** — present the pending migrations and SQL to the user and ask:
   > "The following migrations will be applied: [list]. This will run against the **live production database**. Confirm? (yes/no)"

4. Only proceed if the user explicitly says "yes" or "confirm".

5. Apply migrations:
```bash
docker compose exec backend uv run python manage.py migrate
```

Or via SSH if running on the server directly:
```bash
ssh anders@109.205.177.108 "cd /path/to/app && docker compose exec backend uv run python manage.py migrate"
```

6. Verify success:
```bash
docker compose exec backend uv run python manage.py showmigrations | grep '\[ \]'
# Should return nothing (all applied)
```

## Safety Notes
- Always check `sqlmigrate` output before applying — look for DROP TABLE, DROP COLUMN, or data transforms
- For data migrations, consider running on a DB backup first
- If a migration fails partway, check `django_migrations` table manually
