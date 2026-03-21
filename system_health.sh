#!/bin/bash
set -euo pipefail

# === SETUP ===
LOGFILE="health_report.log"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

# === LOG FUNCTION ===
log() { echo "[$(date +%H:%M:%S)] $*"; }

# === WRITE TO REPORT FILE ===
report() { echo "$*" >> "$LOGFILE"; }

# === CHECK DISK ===
check_disk() {
 local disk=$(df / | awk 'NR==2{print $5}' | tr -d '%')
 log "Disk usage: $disk%"
 report "DISK: $disk%"
if [ "$disk" -gt 90 ]; then
 log "DISK STATUS: CRITICAL!"
 report "DISK STATUS: CRITICAL"
elif [ "$disk" -gt 80 ]; then
 log "DISK STATUS: WARNING"
 report "DISK STATUS: WARNING"
else 
 log "DISK STATUS: GOOD"
 report "DISK STATUS: GOOD"
fi 
} 

# === check ram ===
 check_ram() { 
 local percent=$(free -m | awk 'NR==2 {print int($3*100/$2)}')
 log "RAM usage: $percent%"
 report "RAM: $percent%"
 if [ "$percent" -gt 90 ]; then
  log "RAM STATUS: CRITICAL!"
 report "RAM STATUS: CRITICAL"
elif [ "$percent" -gt 80 ]; then
  log "RAM STATUS: WARNING"
 report "RAM STATUS: WARNING"
else
 log "RAM STATUS: GOOD"
 report "RAM STATUS: GOOD"
fi 
}

# ===CHECK IMPORTANT FILES ===
check_processes() {
 log "top 5 processes by memory:"
 report "TOP PROCESSES:"
ps aux --sort=%mem | awk 'NR>1 && NR<=6 {print $11, $4"%"}' | \
while read -r proc mem; do
log " $proc - $mem"
report " $proc - $mem"
done
}

# ===CHECK IMPORTANT FILE ===
check_file() {
log "checking important files:"
report "FILE CHEKS:"
for file in /etc/hosts /etc/passwd /etc/hostname; do
if [ -f "$file" ]; then
log " $file EXISTS"
report " $file EXISTS"
else
log " $file MISSING"
report " $file MISSING"
fi
done
}

#=== MAIN ===
>"$LOGFILE"
report "=========================="
report "SYSTEM HEALTH REPORT"
report "Date: $DATE"
report "========================="

log "starting system health check..."
check_disk
check_ram
check_processes
check_file
log "Health check complete!"
log "Report saved to: $LOGFILE"

report "======================="
report "END OF REPORT"
report "======================="


echo ""
echo "--- FULL REPORT ---"
cat "$LOGFILE"




















