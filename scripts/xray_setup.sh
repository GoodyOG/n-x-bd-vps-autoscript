#!/bin/bash

# Xray (V2Ray) Setup Script

echo "Installing Xray Core..."

bash <(curl -s https://raw.githubusercontent.com/XTLS/Xray-install/main/install-release.sh)

mkdir -p /etc/xray
cat <<EOF > /etc/xray/config.json
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "warning"
  },
  "inbounds": [
    {
      "port": 443,
      "protocol": "vless",
      "settings": {
        "clients": [],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "tcp",
        "security": "none"
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF

systemctl enable xray
systemctl restart xray

echo "Xray (V2Ray) setup completed."