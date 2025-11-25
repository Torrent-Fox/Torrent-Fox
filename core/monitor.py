#!/usr/bin/env python3
import time
import re
import subprocess

LOG_FILE = "/var/log/xray/access.log"
BT_REGEX = re.compile(r"bittorrent", re.IGNORECASE)

def block_ip(ip):
    subprocess.run(["ipset", "add", "torrent_block", ip, "-exist"])
    print(f"[Torrent-Fox] Blocked IP: {ip}")

def main():
    print("[Torrent-Fox] Monitor started...")
    with subprocess.Popen(["tail", "-F", LOG_FILE], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True) as p:
        for line in p.stdout:
            if "bittorrent" in line.lower():
                match = re.search(r"(\d+\.\d+\.\d+\.\d+)", line)
                if match:
                    block_ip(match.group(1))

if __name__ == "__main__":
    main()
