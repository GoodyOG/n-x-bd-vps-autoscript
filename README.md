N-X-BD VPS AutoScript

A fully automated script to set up SSH, XRAY (V2Ray: Vmess/Vless), Trojan, OVPN, and L2TP VPN services on Ubuntu servers. Supports Ubuntu 20.04 / 22.04 / 24.04.

Features

SSH WebSocket (80), SSL (443)

XRAY (TLS 443, NTLS 80): Vmess, Vless, Trojan

L2TP/IPSec, OpenVPN, Trojan

Device/IP Limit

Bandwidth Limit

Expiry Date Management

Telegram Bot Alerts on expiry or limit exceed

Custom SSH Banner & HTTP Headers

Auto Backup to .tar.gz

Web Interface for Backup/Restore & Configuration (Port 3000)



---

Installation

Run the following command in your VPS (Ubuntu 20.04+):

bash <(curl -sL https://raw.githubusercontent.com/nayem-48ai/n-x-bd-vps-autoscript/main/install.sh)

> Make sure your server has curl, wget, screen installed. Otherwise, the script installs them automatically.




---

Telegram Bot Setup (Manual)

After install, edit:

nano config/telegram_config.sh

Replace:

BOT_TOKEN="your_bot_token_here"
CHAT_ID="your_chat_id_here"

Save and exit.


---

Backup & Restore

Auto Backup:

Daily backup to .tar.gz

Sent to Telegram Bot if configured


Manual Backup via Web:

Navigate to http://your_server_ip:3000

Download latest backup

Upload .tar.gz file to restore


Manual Restore via Script:

bash utils/restore.sh /path/to/backup.tar.gz


---

Web Interface (Node.js)

Start server manually:


cd web && node server.js

Visit: http://<your-ip>:3000

Features:

Backup Download/Upload

Telegram Bot test ping

Banner & Header Editor




---

Contributions

Developer: Nayem (N-X-BD)

Project Repo: GitHub - nayem-48ai/n-x-bd-vps-autoscript


Feel free to fork, improve, and share.


---

Disclaimer

Use at your own risk. Developer is not responsible for any misuse of this script.

