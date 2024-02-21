#!/bin/bash

# Define the directory where the hosts file should be created
ANSIBLE_DIR="../ansible"

# File to generate
HOSTS_FILE="$ANSIBLE_DIR/hosts.ini"

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
echo "ansible_ssh_private_key_file=tdengine.pem" >> $HOSTS_FILE
