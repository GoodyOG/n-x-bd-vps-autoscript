# N-X-BD VPS AutoScript

<p align="center">
  <img src="https://img.shields.io/badge/OS-Ubuntu%2020.04%2F22.04-orange">
  <img src="https://img.shields.io/badge/SSH-Enabled-green">
  <img src="https://img.shields.io/badge/Xray-Vmess%2FVless-blue">
  <img src="https://img.shields.io/badge/Trojan-Enabled-yellow">
  <img src="https://img.shields.io/badge/L2TP-Enabled-blueviolet">
  <img src="https://img.shields.io/badge/OpenVPN-Supported-success">
</p>
---

A comprehensive VPS AutoScript for setting up and managing various VPN protocols with user control features.

## ✨ Features

- **Multi-Protocol Support**: SSH, XRAY (Vmess, Vless), Trojan, L2TP/IPSec, and OpenVPN.
- **User Management**: Set expiry dates, device/IP limits, and bandwidth limits per user.
- **Automated Monitoring**: Services are monitored, and alerts for limit breaches are sent via Telegram.
- **Auto Backup System**: Daily backups are automatically created and sent to your Telegram (if configured).
- **Web UI & Manual Restore**: A simple web interface to download the latest backup or upload a file to restore it.
- **Customizable Banners**: Easily edit the SSH login banner.
- **Management Menu**: A user-friendly command-line menu to manage the script's functions.

---

## ⚙️ Installation

**1. Clone the Repository:**
First, log in to your fresh Ubuntu 20.04/22.04 VPS as root. Then, clone the repository:
```bash
apt update && apt install -y git && git clone [https://github.com/GoodyOG/n-x-bd-vps-autoscript.git](https://github.com/GoodyOG/n-x-bd-vps-autoscript.git) && cd n-x-bd-vps-autoscript
