#!/bin/bash
set -euo pipefail

LOGFILE="app.log"

log() { echo "[$(date +%H:%M:%S)] $*"; }

# ===WRITE LOG ENTRIES ===
write_log() {
  log "Writing log entries..."
 echo "INFO: server started" >> "$LOGFILE"
 echo "INFO: connected to database" >> "$LOGFILE"
 echo "ERROR: connection timeout" >> "$LOGFILE"
 echo "INFO: retrying connection" >> "$LOGFILE"
 echo "ERROR: disk space low" >> "$LOGFILE"
 echo "INFO: backup completed" >> "$LOGFILE"
  log "log entries written!"
}

# === READ LOG FILE ===

read_log() { 
 log "reading all log entries:"
 while IFS= read -r line; do
   echo " >> $line"
 done < "$LOGFILE"
}

# === SERCH FOR ERRORS ===
check_error() { 
  local count=$(grep -c "ERROR" "$LOGFILE")
  log "total errors found: $count"
  log "error details:"
 grep "ERROR" "$LOGFILE"
}


# === MAIN ===
 log "script started"
 write_log
 read_log
 check_error
 log "Script finished"
