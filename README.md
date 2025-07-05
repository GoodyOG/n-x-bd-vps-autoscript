N-X-BD VPS AutoScript

<p align="center">
  <img src="https://img.shields.io/badge/OS-Ubuntu%2020.04%2F22.04%2F24.04-orange">
  <img src="https://img.shields.io/badge/SSH-Enabled-green">
  <img src="https://img.shields.io/badge/Xray-Vmess%2FVless-blue">
  <img src="https://img.shields.io/badge/Trojan-Enabled-yellow">
  <img src="https://img.shields.io/badge/L2TP-Enabled-blueviolet">
  <img src="https://img.shields.io/badge/OpenVPN-Supported-success">
</p>
---

✅ Supported Protocols

SSH (WebSocket 80 / SSL 443)

XRAY (Vmess, Vless) TLS 443 / NTLS 80

Trojan (TLS)

L2TP/IPSec

OpenVPN (OVPN)



---

✨ Features

User Expiry & Auto Lock System

Device/IP Limit Per User

Bandwidth Limit Per User

Telegram Notification for Expired / Limit Crossed

Auto Backup System (Daily .tar.gz)

Manual Backup/Restore via Web UI

Editable SSH Banner & HTTP Response

ASCII Username Banner

Installation runs on fresh Ubuntu VPS



---

⚙️ Installation
```
sysctl -w net.ipv6.conf.all.disable_ipv6=1 \
&& sysctl -w net.ipv6.conf.default.disable_ipv6=1 \
&& apt-get update -y \
&& apt-get update --fix-missing \
&& apt-get install wget curl screen dnsutils -y \
&& curl -L -k -sS https://raw.githubusercontent.com/GoodyOG/n-x-bd-vps-autoscript/main/install.sh -o install-nxbd \
&& chmod +x install-nxbd \
&& screen -S nxbd-autoscript ./install-nxbd; \
if [ $? -ne 0 ]; then rm -f install-nxbd; fi
```

> After install, configure Telegram manually in: config/telegram_config.sh




---

📦 Backup & Restore

Manual Backup:

bash utils/backup.sh

Auto Backup (Daily at 3AM):

Enabled by default via cron. Sent to Telegram if configured.

Restore:

```bash utils/restore.sh |/path/to/your-backup.tar.gz```


---

🌐 Web Interface (Port 3000)

Accessible via: ```http://your-server-ip:3000```

Features:

Download latest backup

Upload backup to restore

Banner editor (SSH / HTTP)




---

📲 Telegram Bot Setup (Manual)

Open file:

```
nano config/telegram_config.sh
```

Edit values:

```
BOT_TOKEN="your_bot_token_here"
CHAT_ID="your_chat_id_here"
```

✅ If you want the menu to auto-show upon login to the VPS:

Then you need to add a line like the following to your ```.bashrc``` or .profile:

```
echo "bash /usr/local/nxbd/menu.sh" >> ~/.bashrc
```

Now whenever you log in to the VPS, the ```menu.sh``` script will run and display the menu options.

---

📁 Directory Structure

n-x-bd-vps-autoscript/
├── install.sh
├── ascii/banner.txt
├── config/telegram_config.sh
├── data/user_db.txt
├── public/index.html
├── scripts/
│   ├── ssh_setup.sh
│   ├── xray_setup.sh
│   └── ...
├── utils/
│   ├── backup.sh / restore.sh
│   ├── ssh_limit_monitor.sh
│   └── xray_limit_monitor.sh


---

☑️ Maintainer

Developer: Nayem (N-X-BD)

GitHub: nayem-48ai


Enjoy secure, monitored, and auto-managed VPN service from your VPS!

