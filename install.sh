#!/bin/bash

# Get the directory where the project is located
REPO_ROOT=$(cd "$(dirname "$0")" && pwd)

clear
echo "===================================="
echo "  N-X-BD VPS AutoScript Installer"
echo "===================================="
echo ""

echo "▶️ System update and installing requirements..."
apt-get update -y
apt-get install -y curl wget screen dnsutils nano jq nodejs npm

# Create necessary directories
mkdir -p /etc/nxbd
mkdir -p /var/log/xray

echo "▶️ Running SSH setup..."
bash "$REPO_ROOT/scripts/ssh_setup.sh"

echo "▶️ Running XRAY (VMess/VLESS) setup..."
bash "$REPO_ROOT/scripts/xray_setup.sh"

echo "▶️ Running Trojan setup..."
bash "$REPO_ROOT/scripts/trojan_setup.sh"

echo "▶️ Running L2TP setup..."
bash "$REPO_ROOT/scripts/l2tp_setup.sh"

echo "▶️ Running OVPN setup..."
bash "$REPO_ROOT/scripts/ovpn_setup.sh"

echo "▶️ Setting up Cronjobs for monitoring..."
bash "$REPO_ROOT/config/cron_setup.sh"

echo "▶️ Starting Limit Checker in background..."
screen -dmS limit_checker bash "$REPO_ROOT/utils/limit_checker.sh"

echo "▶️ Setting up Backup and Restore utilities..."
chmod +x "$REPO_ROOT/utils/backup.sh" "$REPO_ROOT/utils/restore.sh" "$REPO_ROOT/menu.sh"

echo "▶️ Starting Web UI for Backup/Restore..."
# Use a process manager like pm2 for production, but for this script, screen is fine.
cd "$REPO_ROOT" && npm install express multer
screen -dmS nxbd_web_ui node "$REPO_ROOT/utils/backup.js"

cat "$REPO_ROOT/ascii/banner.txt"

echo ""
echo "✅ Installation complete!"
echo "-----------------------------------------------------"
echo "‼️ IMPORTANT NEXT STEPS ‼️"
echo ""
echo "1. Configure your Telegram Bot in:"
echo "   nano $REPO_ROOT/config/telegram_config.sh"
echo ""
echo "2. The Web Backup/Restore Interface is running on:"
echo "   http://<your-server-ip>:3000"
echo ""
echo "3. To manage your VPS, run the menu command:"
echo "   bash $REPO_ROOT/menu.sh"
echo ""
echo "Thank you for using N-X-BD VPS AutoScript."
echo "-----------------------------------------------------"
