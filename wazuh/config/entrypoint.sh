#!/bin/bash
# Wazuh Docker Copyright (C) 2019 Wazuh Inc. (License GPLv2)

# Trap to kill container if it is necessary.
trap "exit" SIGINT SIGTERM
# It will run every .sh script located in entrypoint-scripts folder in lexicographical order
for script in `ls /entrypoint-scripts/*.sh | sort -n`; do
  bash "$script"
done

##############################################################################
# Start Wazuh Server.
##############################################################################

/sbin/my_init 
