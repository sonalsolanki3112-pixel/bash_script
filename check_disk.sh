#!/bin/bash

#check disk,ram,and a file

# ----- DISK CHECK -----
disk=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
echo "Disk usage: $disk%"

if [ "$disk" -gt 90 ]; then 
 echo "STATUS: CRITICAL - Disk almost full"

elif [ "$disk" -gt 80 ]; then
 echo "STATUS: WARNING - disk filling up"

else
 echo "STATUS: GOOD - disk healthy"
fi

#------ FILE CHECK ------- 
echo""
if [ -f "/etc/hosts" ]; then
 echo "/etc/hosts file : EXISTS"
else
echo "/etc/hosts file : NOT EXISTS"
fi

#------ FOLDER CHECK -------

if [ -d "/home/kets" ]; then
  echo "home folder : EXISTS"
else
  echo "home folder :NOT EXISTS"
fi
