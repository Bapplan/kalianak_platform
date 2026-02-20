#!/bin/bash

# 1. Define Server Info
SERVER_USER="anders"
SERVER_IP="109.205.177.108"
SERVER_PATH="/opt/kalianak/"

# 2. Print status
echo "🚀 Deploying to $SERVER_IP..."

# 3. Run Rsync (The actual copy)
# We add '--delete' to remove files on server that you deleted locally (keeps it clean)
rsync -avz --progress \
    --exclude '.venv' \
    --exclude 'node_modules' \
    --exclude '__pycache__' \
    --exclude '.git' \
    --exclude 'dist' \
    --exclude '*.log' \
    ./frontend ./backend ./member_app ./web_frontend \
    $SERVER_USER@$SERVER_IP:$SERVER_PATH

# 4. Copy the root configuration files (Compose & Settings) separately
rsync -avz docker-compose.prod.yml $SERVER_USER@$SERVER_IP:$SERVER_PATH

echo "✅ Files synced!"

# 5. (Optional) Remote Restart Command
# This connects to the server and rebuilds the containers for you automatically
echo "🔄 Rebuilding containers..."
ssh $SERVER_USER@$SERVER_IP "cd $SERVER_PATH && docker compose -f docker-compose.prod.yml up -d --build"

echo "🎉 Deployment Complete!"