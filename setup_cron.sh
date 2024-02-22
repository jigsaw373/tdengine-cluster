#!/bin/bash

# Define variables
PLAYBOOK_PATH="backup_tdengine.yml"
CRON_TIME="0 2 * * *"  # This sets the cron job to run at 02:00 AM every day
CRON_JOB="$CRON_TIME /usr/bin/ansible-playbook $PLAYBOOK_PATH > /var/log/ansible-playbook-cron.log 2>&1"

# Check if the cron job already exists
CRON_EXISTS=$(crontab -l | grep -F "$PLAYBOOK_PATH" | wc -l)
if [ "$CRON_EXISTS" -eq "0" ]; then
    # Add the cron job if it doesn't exist
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    echo "Cron job added successfully."
else
    echo "Cron job already exists."
fi

