#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SERVER_DIR="$REPO_DIR/server"
APP_NAME="dart-presentation"

echo "==> Pulling latest from main..."
cd "$REPO_DIR"
git pull origin main

echo "==> Caching Flutter web toolchain..."
flutter precache --web

echo "==> Building Flutter web..."
flutter build web --release

echo "==> Installing server dependencies..."
cd "$SERVER_DIR"
npm install --omit=dev

echo "==> Restarting server..."
# Kill existing screen session if running
screen -S "$APP_NAME" -X quit 2>/dev/null || true

# Start fresh screen session
screen -dmS "$APP_NAME" bash -c "cd '$SERVER_DIR' && node server.js 2>&1 | tee '$REPO_DIR/server.log'"
echo "==> Done. Running in screen session '$APP_NAME'."
echo "    screen -r $APP_NAME     -- attach to view logs"
echo "    screen -S $APP_NAME -X quit  -- stop server"

echo ""
echo "    Presentation:   http://<your-vps-ip>:3000"
echo "    Remote control: http://<your-vps-ip>:3000/remote"
