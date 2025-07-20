#!/run/current-system/sw/bin/bash


# This script collects and displays server statistics such as
# Total CPU usage
# Total memory usage (Free vs Used including percentage)
# Total disk usage (Free vs Used including percentage)
# Top 5 processes by CPU usage
# Top 5 processes by memory usage


# Function to display CPU usage
display_cpu_usage() {
  echo "CPU Usage: " 
  # Using `top` command to get CPU usage
  top -bn1 | grep "Cpu(s)" | awk '{print "Used: " $2 + $4 "%"}'

}
display_memory_usage() {
  echo "Memory Usage: "
  # Using `free` command to get memory usage
  free -m | grep "Mem:" | awk '{print "Free: "$4" MB, Used: "$3" MB ("($3/$2*100)"%)"}'

}
display_disk_usage() {
  echo "Disk Usage: "
  # Using `df` command to get disk usage
  df -h / | grep "/" | awk '{print "Free: "$4", Used: "$3" ("$5")"}'
}
display_top_processes_cpu() {
  echo "Top 5 Processes by CPU Usage:"
  ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 6
}

display_top_processes_memory() {
  echo "Top 5 Processes by Memory Usage:"
  ps -eo pid,user,%cpu,%mem,comm --sort=-%mem | head -n 6
}
# Main script execution
case "$1" in
  cpu)
    display_cpu_usage
    ;;
  mem)
    display_memory_usage
    ;;
  disk)
    display_disk_usage
    ;;
  topcpu)
    display_top_processes_cpu
    ;;
  topmem)
    display_top_processes_memory
    ;;
  all)
    display_cpu_usage
    echo
    display_memory_usage
    echo
    display_disk_usage
    echo
    display_top_processes_cpu
    echo
    display_top_processes_memory
    ;;
  *)
    echo "Uso: $0 {cpu|mem|disk|topcpu|topmem|all}"
    ;;
esac




