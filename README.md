# Server Performance Stats Script

A simple bash script to quickly analyze and display basic server performance statistics such as CPU, memory, disk usage, and top resource-consuming processes. The output is colorized and formatted for easy reading in the terminal.

---

## Features

- Show total CPU usage (percentage used)
- Show memory usage: free, used, and used percentage
- Show disk usage of root partition: free, used, and percentage used
- List top 5 processes by CPU usage
- List top 5 processes by memory usage
- Colorful and well-formatted terminal output for better readability
- Run specific checks or all stats at once via command-line arguments

---

## Requirements

- Linux system
- Bash shell (path might vary; update the shebang line accordingly)
- Standard Linux utilities:
  - `top`
  - `free`
  - `df`
  - `ps`
  - `awk`
  - `grep`

---

## Installation

1. Download or clone the repository (or save the script file):

   ```bash
   git clone https://github.com/William-Ro/server-stats.git
   cd server-stats
   ```

   Or simply save the `server-stats.sh` file.

2. Make the script executable:

   ```bash
   chmod +x server-stats.sh
   ```

3. (Optional) Verify baesh path on your systm:

   ```bash
   which bash
   ```

   If different from `/bin/bash`, update the first line (shebang) of the script accordingly, e.g.:

   ```bash
   #!/run/current-system/sw/bin/bash
   ```

---

## Usage

Run the script followed by one of the following options:

```bash
./server-stats.sh cpu       # Show CPU usage
./server-stats.sh mem       # Show memory usage
./server-stats.sh disk      # Show disk usage
./server-stats.sh topcpu    # Show top 5 CPU-consuming processes
./server-stats.sh topmem    # Show top 5 memory-consuming processes
./server-stats.sh all       # Show all stats in sequence
```

Example:

```bash
./server-stats.sh all
```

This will display all available statistics in a nicely formatted manner.

---

## Example Output

```
────────────────────────────────────────────
🖥️  CPU Usage
Used: 12.5%

────────────────────────────────────────────
💾 Memory Usage
Free: 12345 MB, Used: 6789 MB (35.5%)

────────────────────────────────────────────
🗄️  Disk Usage
Free: 100G, Used: 50G (50%)

────────────────────────────────────────────
🔥 Top 5 Processes by CPU
  PID USER     %CPU %MEM COMMAND
 1234 user     25.0  1.2 chrome
 5678 user     15.0  3.4 code
 ...

────────────────────────────────────────────
🐏 Top 5 Processes by Memory
  PID USER     %CPU %MEM COMMAND
 1234 user     25.0  1.2 chrome
 5678 user     15.0  3.4 code
 ...
```

---

## License

MIT License — feel free to use and modify!
