# Deploy to Production

Deploy the Kalianak Platform to the VPS server.

## What this does
1. Rsyncs all changed files to `anders@109.205.177.108`
2. Rebuilds Docker containers on the server via SSH
3. Applies any pending migrations (if confirmed)

## Steps

1. Check the current git status to understand what's being deployed:
```bash
git status
git log --oneline -5
```

2. Confirm there are no uncommitted changes that should be included.

3. Ask the user: "Ready to deploy? This will rsync to production and rebuild containers."

4. Run the deploy script from the repo root:
```bash
./deploy.sh
```

5. Monitor the output for errors. Common issues:
   - rsync auth failures → check SSH key
   - Docker build errors → check Dockerfile and dependencies
   - Migration errors → run `/migrate` separately after fixing

6. After deploy, verify the API is responding:
```bash
curl -s https://api-pos.ikanbakarkalianak.store/api/docs | head -20
```

## Notes
- The deploy script handles rsync + Docker rebuild automatically
- Migrations do NOT run automatically — use `/migrate` if needed
- If the build fails mid-way, the old containers keep running (Traefik handles this)
