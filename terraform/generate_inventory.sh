#!/bin/bash

# File to generate
HOSTS_FILE="hosts.ini"

# Start the hosts file
echo "[tdengine_cluster]" > $HOSTS_FILE

# Loop through passed IPs and append to the file
index=1
for ip in "$@"
do
  echo "node$index ansible_host=$ip ansible_user=ubuntu" >> $HOSTS_FILE
  ((index++))
done

# Append the vars section
echo -e "\n[tdengine_cluster:vars]" >> $HOSTS_FILE
echo "tdengine.pem" >> $HOSTS_FILE
