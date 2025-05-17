#!/bin/bash

# SSH Server Setup with basic configuration
echo "Setting up SSH..."

apt-get install -y openssh-server
systemctl enable ssh
systemctl start ssh

# Enable banner
echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config
touch /etc/issue.net

# Allow root login (if desired)
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Restart SSH
systemctl restart ssh

echo "SSH setup completed."