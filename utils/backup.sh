#!/bin/bash

BACKUP_DIR="/root/nxbd_backups"
mkdir -p $BACKUP_DIR

FILE_NAME="nxbd_backup_$(date +%F_%T).tar.gz"
BACKUP_PATH="$BACKUP_DIR/$FILE_NAME"

tar -czf "$BACKUP_PATH" /etc/xray /etc/ssh /etc/ppp /etc/openvpn /var/lib/sshd /etc/nxbd >/dev/null 2>&1

# If argument is 'auto', send to Telegram
if [[ "$1" == "auto" ]]; then
    source /root/n-x-bd-vps-autoscript/config/telegram_config.sh
    curl -F document=@"$BACKUP_PATH" "https://api.telegram.org/bot${BOT_TOKEN}/sendDocument?chat_id=${CHAT_ID}&caption=Auto Backup: $FILE_NAME"
else
    echo "Backup created at: $BACKUP_PATH"
fi