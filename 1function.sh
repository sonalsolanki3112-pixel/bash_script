#!/bin/bash

set -euo pipefail

 log () {
   echo "[$(date +%H:%M:%S)] $*"
 }  
 check_disk() {
   local disk=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
   log "disk usage: $disk%"
   if [ "$disk" -gt 80 ]; then
    log "WARNING - disk is high"
   else
    log "GOOD - disk is healthy"
   fi
}


log "script started"
check_disk
log "script finished"
