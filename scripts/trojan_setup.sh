#!/bin/bash

# Trojan Setup Script

echo "Installing Trojan..."

apt-get install -y trojan

cat <<EOF > /etc/trojan/config.json
{
  "run_type": "server",
  "local_addr": "0.0.0.0",
  "local_port": 443,
  "password": ["your_password_here"],
  "ssl": {
    "cert": "/etc/ssl/certs/ssl-cert-snakeoil.pem",
    "key": "/etc/ssl/private/ssl-cert-snakeoil.key",
    "sni": ""
  }
}
EOF

systemctl enable trojan
systemctl restart trojan

echo "Trojan setup completed."