#!/bin/bash

clear
echo "==============================="
echo "         Torrent-Fox           "
echo "==============================="

menu() {
echo ""
echo "1) Enable Torrent Block"
echo "2) Disable Torrent Block"
echo "3) Check Status"
echo "4) Exit"
echo ""
read -p 'Select option: ' opt

case $opt in
1) enable ;;
2) disable ;;
3) status ;;
4) exit ;;
*) echo "Invalid Option"; sleep 1; menu ;;
esac
}

enable() {
echo "Blocking torrent traffic..."
iptables -F
iptables -A INPUT -m string --algo bm --string "BitTorrent" -j DROP
iptables -A INPUT -m string --algo bm --string "peer_id=" -j DROP
iptables -A INPUT -m string --algo bm --string ".torrent" -j DROP
iptables -A INPUT -m string --algo bm --string "announce" -j DROP
iptables -A INPUT -m string --algo bm --string "info_hash" -j DROP
echo "Torrent block enabled!"
}

disable() {
echo "Removing torrent block..."
iptables -F
echo "Torrent block disabled!"
}

status() {
echo "Checking firewall rules..."
iptables -L
}

menu
