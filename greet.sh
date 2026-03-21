#!/bin/bash

#greet.sh --is varialbes + inpute + arguments
name="$1"
city="$2"     # take name from argument 
 
#if no argument given, ask the user 
if [ -z "$name" ]; then
   read -p "Enter your name: " name
   read -p "Enter your city: " city
fi


time="(date +%H:+%M)"      # store command output
today="date +%A"

echo "--------------------------------------"
echo " hello, $name!"
echo " you live in $city"
echo " today : $(date +%A)"
echo " time  : $(date +%H:%M)"
echo "--------------------------------------"




