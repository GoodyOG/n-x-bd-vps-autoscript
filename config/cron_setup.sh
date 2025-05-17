#!/bin/bash

# SSH Monitor Job
(crontab -l 2>/dev/null; echo "*/5 * * * * bash /root/script/limit_monitors/ssh_limit_monitor.sh") | crontab -

# XRAY Monitor Job
(crontab -l 2>/dev/null; echo "*/5 * * * * bash /root/script/limit_monitors/xray_limit_monitor.sh") | crontab -

echo "✅ Cronjobs for SSH & Xray limit monitoring added!"