#!/bin/bash

# loops.sh - prctice for and while loops

echo "=== my AWS servers ==="
for server in web-server-1 web-server-2 db-server; do 
 echo "checking: $server"
done 

echo""
echo "=== creating 3 backup file ==="
for i in {1..3}; do
  filename="backup_$i.txt"
  touch "$filename"
  echo "created: $filename"
done

echo""
echo "=== my bash scripts ==="
for file in ~/bash-practice/*.sh; do
 echo "script found: $file"
done

echo""
echo "=== countdown ==="
count=3 
while [ "$count" -gt 0 ]; do
 echo "$count..."
 count=$((count - 1))
done

echo "Done!"
