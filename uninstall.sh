#!/bin/bash

systemctl stop torrent-fox
systemctl disable torrent-fox
rm -f /etc/systemd/system/torrent-fox.service

ipset destroy torrent_block

rm -rf /usr/local/torrent-fox

rm -f /usr/bin/torrent-fox

echo "Torrent-Fox uninstalled successfully!"
