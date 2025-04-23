## Master Basic Linux Command-Line and Bash Scripting – `info.sh`

### Description

`info.sh` is a Bash script that displays essential system information in a structured, colorful format. It was developed as part of a DevOps internship at **Irembo** to practice core Linux command-line utilities and Bash scripting.

---

### Features

The script is divided into four main sections:

1. **System Information**
2. **CPU and Memory Details**
3. **Disk and Filesystem Stats**
4. **Networking and Resource Usage**

---

### How to Run

```bash
chmod +x info.sh
./info.sh
```

---

### Commands Explained

#### Section 1: System Info

- `hostname`: Prints the system's hostname.
- `echo $USER`: Displays the username of the current user.
- `uptime -p`: Shows system uptime in a human-readable format (e.g., "up 1 hour, 24 minutes").
- `date`: Prints the current system date and time.

#### Section 2: CPU and Memory

- `nproc`: Returns the number of available CPU cores.
- `grep -m 1 'model name' /proc/cpuinfo`: Extracts the model name of the processor.
  - `cut -d: -f2`: Cuts the line after the `:` to get just the model.
  - `sed 's/^ //'`: Removes leading whitespace.
- `free -h`: Shows memory usage in a human-readable format.
  - `awk '/^Mem:/ {print $2}'`: Prints total memory.
  - `awk '/^Mem:/ {print $4}'`: Prints available/free memory.

#### Section 3: Disk and Filesystem

- `df -h --total`: Displays disk space usage, including a total at the end.
- `mount | grep "^/dev"`: Lists mounted filesystems that are device-based.
- `du -sh /home`: Shows total disk usage of the `/home` directory.
- `du -sh /var`: Shows total disk usage of the `/var` directory.
- `2>/dev/null`: Silences permission-denied errors.

#### Section 4: Networking

- `ip -o -4 addr show`: Lists all IPv4 addresses with interfaces.
- `ip -o -6 addr show`: Lists all IPv6 addresses with interfaces.
- `ip link show up`: Shows active network interfaces.
  - `awk -F: '$0 !~ "lo|vir|^[^0-9]" {print $2}'`: Filters out loopback and virtual devices.
- `ps aux --sort=-%mem`: Lists processes sorted by memory usage.
- `ps aux --sort=-%cpu`: Lists processes sorted by CPU usage.
- `awk 'NR<=6 { ... }'`: Prints only the top 5 results (plus header).

#### Bonus: ANSI Color Codes

- `\e[1;34m`, `\e[1;32m`: Used to colorize output (blue and green).
- `\e[0m`: Resets to default color.

---

### Sample Output

```bash
===== SYSTEM INFORMATION =====
Hostname: my-ubuntu-box
Current User: moise
System Uptime: up 45 minutes
Date and Time: Tue Apr 23 14:00:32 CAT 2025
...
```

---

### Files

- `info.sh`: Main script
- `README.md`: Documentation

---

### 🛠️ GitHub Repository

**[GitHub Repository](https://github.com/1moses1/Master-Basic-Linux-Command-Line-and-Bash-Scripting)**
