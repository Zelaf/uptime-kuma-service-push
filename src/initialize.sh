if [ "$EUID" -ne 0 ]; then
  echo
  printf "This script needs to be run as root to be able to read the available services\nand to write the scrips and configure the automatic monitoring."
  echo
  exit
fi

## Variables
SCRIPT_PATH=$(dirname "$(readlink -f "$0")")
CONFIG_FILE=$SCRIPT_PATH/config.ini
## Script & Directory names
## Generate
GENERATE_NAME=uptime-kuma-service-push
GENERATE_DIRECTORY=push-scripts
## Monitor
MONITOR_NAME=uptime-kuma-service-push-monitor
MONITOR_DIRECTORY=monitored-scripts

## Generate config file if it doesn't exists
[[ -f "$CONFIG_FILE" ]] || write_config
