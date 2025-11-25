#!/bin/bash

echo "Installing Torrent-Fox..."

# Update packages
apt update -y

# Install Python
apt install -y python3 python3-pip

# Create service directory
mkdir -p /usr/local/torrent-fox

# Copy program files
git clone https://github.com/Torrent-Fox/Torrent-Fox.git /usr/local/torrent-fox

# Make monitor executable
chmod +x /usr/local/torrent-fox/core/monitor.py

# Copy and enable systemd service
cp /usr/local/torrent-fox/service/torrent-fox.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable torrent-fox
systemctl start torrent-fox

echo "Torrent-Fox Installed Successfully!"
