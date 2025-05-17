#!/bin/bash

read -p "Enter path to .tar.gz backup file: " BACKUP_FILE
if [[ ! -f "$BACKUP_FILE" ]]; then
    echo "File not found!"
    exit 1
fi

tar -xzf "$BACKUP_FILE" -C /
echo "Restore complete. Please restart related services or reboot."