#!/bin/bash

echo "=== Torrent-Fox Installer ==="

apt update -y
apt install -y curl jq iptables

# Download the main Torrent-Fox script
curl -o /usr/local/bin/torrent-fox https://raw.githubusercontent.com/Torrent-Fox/Torrent-Fox/main/torrent-fox.sh
chmod +x /usr/local/bin/torrent-fox

echo ""
echo "Torrent-Fox installed successfully!"
echo "Run it with: torrent-fox"
