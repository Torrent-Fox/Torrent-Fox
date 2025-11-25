#!/bin/bash

echo "Installing Torrent-Fox..."

apt update
apt install -y python3 ipset

ipset create torrent_block hash:ip -exist

mkdir -p /usr/local/torrent-fox
cp -r core /usr/local/torrent-fox/
cp torrent-fox.sh /usr/bin/torrent-fox
chmod +x /usr/bin/torrent-fox

cp service/torrent-fox.service /etc/systemd/system/torrent-fox.service

systemctl daemon-reload
systemctl enable torrent-fox
systemctl start torrent-fox

echo "Torrent-Fox installed successfully!"
echo "Run with: torrent-fox"
