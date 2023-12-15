if [ "$EUID" -ne 0 ]; then
  echo
  printf "This script needs to be run as root to be able to read the available services\nand to write the scrips and configure the automatic monitoring."
  echo
  exit
fi

## Variables

## File locations
SCRIPT_PATH=$(dirname "$(readlink -f "$0")")
CONFIG_FILE=$SCRIPT_PATH/config.ini
## Generate
GENERATE_NAME=uptime-kuma-service-push
GENERATE_DIRECTORY=push-scripts
## Monitor
MONITOR_NAME=uptime-kuma-service-push-monitor
MONITOR_DIRECTORY=monitored-scripts

## Asks the user if they want to use current directory as the working directory for Uptime-Kuma-Service-Push
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Uptime-Kuma-Service-Push will create files and directories in the current directory of the script."
    read -p "Do you want to continue? [Y/n]" -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Exiting. Move the script to a different directory and re-run it to continue..."
        exit 1
    fi
fi

## Generate config file if it doesn't exists
[[ -f "$CONFIG_FILE" ]] || write_config
