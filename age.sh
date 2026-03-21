#!/bin/bash

read -p "Enter your age: " age

if [ "$age" -gt 18 ]; then
  echo "you are an adult"
else 
  echo "you are an minor"
fi
