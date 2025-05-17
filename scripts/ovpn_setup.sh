#!/bin/bash

# OpenVPN Setup (basic)
echo "Installing OpenVPN..."

apt-get install -y openvpn easy-rsa

make-cadir ~/openvpn-ca
cd ~/openvpn-ca

# Note: Full PKI and server.conf setup would go here
echo "Manual configuration needed for full OVPN setup"

echo "OpenVPN installed. Please configure manually."