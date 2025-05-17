#!/bin/bash

# L2TP/IPSec VPN Setup (Basic)

echo "Setting up L2TP..."

apt-get install -y xl2tpd strongswan

cat <<EOF > /etc/ipsec.conf
config setup
  charondebug="ike 2, knl 2, cfg 2"

conn %default
  keyexchange=ikev1
  ikelifetime=60m
  keylife=20m
  authby=secret
  ike=aes256-sha1-modp1024!
  esp=aes256-sha1!

conn L2TP-PSK
  keyexchange=ikev1
  left=%any
  leftprotoport=17/1701
  right=%any
  rightprotoport=17/1701
  auto=add
EOF

cat <<EOF > /etc/ipsec.secrets
: PSK "your_psk_here"
EOF

systemctl enable strongswan
systemctl start strongswan

echo "L2TP setup completed."