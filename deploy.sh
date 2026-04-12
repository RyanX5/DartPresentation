#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SERVER_DIR="$REPO_DIR/server"
APP_NAME="dart-presentation"

echo "==> Pulling latest from main..."
cd "$REPO_DIR"
git pull origin main

echo "==> Building Flutter web..."
flutter build web --release

echo "==> Installing server dependencies..."
cd "$SERVER_DIR"
npm install --omit=dev

echo "==> Restarting server..."
if command -v pm2 &>/dev/null; then
  pm2 describe "$APP_NAME" &>/dev/null \
    && pm2 restart "$APP_NAME" \
    || pm2 start server.js --name "$APP_NAME"
  pm2 save
  echo "==> Done. Managed by pm2."
  echo "    pm2 logs $APP_NAME   -- view logs"
  echo "    pm2 stop $APP_NAME   -- stop server"
else
  # Fallback: kill old process and restart with nohup
  pkill -f "node server.js" 2>/dev/null || true
  nohup node server.js > "$REPO_DIR/server.log" 2>&1 &
  echo "==> Done. PID $! — logs at $REPO_DIR/server.log"
fi

echo ""
echo "    Presentation:   http://<your-vps-ip>:3000"
echo "    Remote control: http://<your-vps-ip>:3000/remote"
