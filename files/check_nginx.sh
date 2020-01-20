#!/bin/bash

result=$(sudo netstat -tulpn | grep :80 | grep nginx);

if [ ! -z "$result" ]; then
  echo "Nginx running on port 80";
else
  echo "Nginx is NOT running on port 80";
fi