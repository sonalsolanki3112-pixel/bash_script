#!/bin/bash

for name in sonal kets yohan shrihan; do
  echo "hello , $name"
done


# for number 1 to 5

for i in {1..5}; do
 echo "number :$i"
done

# loop over file in a folder
for file in ~/bash-practice/*.sh; do
 echo "found script: $file"
done
