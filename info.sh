#!/bin/bash

# ============================
# SYSTEM DIAGNOSTICS TOOL
# Author: Moise Iradukunda Ingabire
# Description: Display essential system info in a structured, colorful format
# ============================

GREEN='\e[1;32m'
BLUE='\e[1;34m'
NC='\e[0m' # No Color

# === Section 1: System Info ===
echo -e "${BLUE}===== SYSTEM INFORMATION =====${NC}"
echo -e "${GREEN}Hostname:${NC} $(hostname)"
echo -e "${GREEN}Current User:${NC} $USER"
echo -e "${GREEN}System Uptime:${NC} $(uptime -p)"
echo -e "${GREEN}Date and Time:${NC} $(date)"

# === Section 2: CPU and Memory ===
echo -e "\n${BLUE}===== CPU AND MEMORY INFORMATION =====${NC}"
echo -e "${GREEN}Number of CPU cores:${NC} $(nproc)"
echo -e "${GREEN}CPU Model:${NC} $(grep -m 1 'model name' /proc/cpuinfo | cut -d: -f2 | sed 's/^ //')"
echo -e "${GREEN}Total RAM:${NC} $(free -h | awk '/^Mem:/ {print $2}')"
echo -e "${GREEN}Free RAM:${NC} $(free -h | awk '/^Mem:/ {print $4}')"

# === Section 3: Disk and Filesystem ===
echo -e "\n${BLUE}===== DISK & FILESYSTEM INFORMATION =====${NC}"
echo -e "${GREEN}Disk Usage Summary:${NC}"
df -h --total | grep -E 'Filesystem|total'
echo -e "\n${GREEN}Mounted Filesystems:${NC}"
mount | grep "^/dev"
echo -e "\n${GREEN}Disk Usage in /home:${NC}"
du -sh /home 2>/dev/null
echo -e "${GREEN}Disk Usage in /var:${NC}"
du -sh /var 2>/dev/null

# === Section 4: Networking ===
echo -e "\n${BLUE}===== NETWORKING INFORMATION =====${NC}"
echo -e "${GREEN}IP Addresses:${NC}"
ip -o -4 addr show | awk '{print $2 ": " $4}'
ip -o -6 addr show | awk '{print $2 ": " $4}'
echo -e "\n${GREEN}Active Network Interfaces:${NC}"
ip link show up | awk -F: '$0 !~ "lo|vir|^[^0-9]"{print $2}' | sed 's/^[ \t]*//'
echo -e "\n${GREEN}Top 5 Processes by Memory Usage:${NC}"
ps aux --sort=-%mem | awk 'NR<=6{printf "%-10s %-8s %-5s %-5s %s\n", $1, $2, $3, $4, $11}'
echo -e "\n${GREEN}Top 5 Processes by CPU Usage:${NC}"
ps aux --sort=-%cpu | awk 'NR<=6{printf "%-10s %-8s %-5s %-5s %s\n", $1, $2, $3, $4, $11}'
