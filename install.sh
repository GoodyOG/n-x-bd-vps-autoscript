#!/bin/bash

clear echo "====================================" echo "  N-X-BD VPS AutoScript Installer" echo "====================================" echo ""

System update and install requirements

apt-get update -y apt-get install curl wget screen dnsutils -y

Run SSH setup

bash scripts/ssh_setup.sh

Run XRAY (VMess/VLESS) setup

bash scripts/xray_setup.sh

Run Trojan setup

bash scripts/trojan_setup.sh

Run L2TP setup

bash scripts/l2tp_setup.sh

Run OVPN setup

bash scripts/ovpn_setup.sh

Configure custom banner for SSH

bash utils/http_banner_editor.sh

Start Limit Checker (runs in background using screen)

screen -dmS limit_checker bash utils/limit_checker.sh

Setup Backup and Restore utilities

chmod +x utils/backup.sh utils/restore.sh

Setup web interface (optional for backup/restore)

echo "Web Backup/Restore Interface available at: http://<your-server-ip>/" echo "Upload your .tar.gz file to restore via web, or use backup script to generate."

Show ASCII banner

cat ascii/banner.txt

Final Message

echo "" echo "Installation complete!" echo "Please configure your Telegram Bot in:" echo "  config/telegram_config.sh" echo "" echo "Automatic backups will be sent to your Telegram bot as configured." echo "Thank you for using N-X-BD VPS AutoScript."

