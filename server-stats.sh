#!/run/current-system/sw/bin/bash


# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
RESET='\033[0m'

# Separator
print_separator() {
  echo -e "${MAGENTA}────────────────────────────────────────────${RESET}"
}

display_cpu_usage() {
  print_separator
  echo -e "${BOLD}${CYAN}🖥️  CPU Usage${RESET}"
  echo -e "${GREEN}$(top -bn1 | grep "Cpu(s)" | awk '{print "Used: " $2 + $4 "%"}')${RESET}"
}

display_memory_usage() {
  print_separator
  echo -e "${BOLD}${YELLOW}💾 Memory Usage${RESET}"
  echo -e "${GREEN}$(free -m | awk '/Mem:/ {printf "Free: %d MB, Used: %d MB (%.2f%%)\n", $4, $3, $3/$2*100}')${RESET}"
}

display_disk_usage() {
  print_separator
  echo -e "${BOLD}${MAGENTA}🗄️  Disk Usage${RESET}"
  echo -e "${GREEN}$(df -h / | awk 'NR==2 {printf "Free: %s, Used: %s (%s)\n", $4, $3, $5}')${RESET}"
}

display_top_processes_cpu() {
  print_separator
  echo -e "${BOLD}${CYAN}🔥 Top 5 Processes by CPU${RESET}"
  ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 6 | awk 'NR==1 {print "\033[0;32m" $0 "\033[0m"} NR>1 {print}'
}

display_top_processes_memory() {
  print_separator
  echo -e "${BOLD}${YELLOW}🐏 Top 5 Processes by Memory${RESET}"
  ps -eo pid,user,%cpu,%mem,comm --sort=-%mem | head -n 6 | awk 'NR==1 {print "\033[0;32m" $0 "\033[0m"} NR>1 {print}'
}


# Main
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
    display_memory_usage
    display_disk_usage
    display_top_processes_cpu
    display_top_processes_memory
    ;;
  *)
    echo -e "${BOLD}${RED}Uso:${RESET} $0 {cpu|mem|disk|topcpu|topmem|all}"
    ;;
esac



