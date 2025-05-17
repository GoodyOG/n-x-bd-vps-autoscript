#!/bin/bash

LIMIT_FILE="/etc/ssh/user_limits.json"

while true; do
    if [[ -f "$LIMIT_FILE" ]]; then
        USERS=$(jq -r 'keys[]' $LIMIT_FILE)
        for user in $USERS; do
            DEVICE_LIMIT=$(jq -r --arg u "$user" '.[$u].device_limit' $LIMIT_FILE)
            LIMIT_MB=$(jq -r --arg u "$user" '.[$u].bandwidth_limit_mb' $LIMIT_FILE)

            # Count active sessions
            IP_COUNT=$(who | grep "$user" | awk '{print $5}' | sort | uniq | wc -l)

            # Placeholder for bandwidth usage in MB (needs actual tracking logic if desired)
            BW=0

            ALERT=0
            MSG="User: $user"

            if [[ "$DEVICE_LIMIT" -ne 0 && "$IP_COUNT" -gt "$DEVICE_LIMIT" ]]; then
                MSG="$MSG | Device Limit Exceeded: $IP_COUNT > $DEVICE_LIMIT"
                ALERT=1
            fi

            if [[ "$LIMIT_MB" -ne 0 && "$BW" -gt "$LIMIT_MB" ]]; then
                MSG="$MSG | Bandwidth Limit Exceeded: ${BW}MB > ${LIMIT_MB}MB"
                ALERT=1
            fi

            if [[ $ALERT -eq 1 ]]; then
                bash config/telegram_config.sh "$MSG"
            fi
        done
    fi
    sleep 60
done