if [ "$EUID" -ne 0 ]; then
  echo
  printf "This script needs to be run as root to be able to read the available services\nand to write the scrips and configure the automatic monitoring."
  echo
  exit
fi

## Variables
SCRIPT_PATH=$(dirname "$(readlink -f "$0")")
CONFIG_FILE=$SCRIPT_PATH/config.ini

## Generate config file if it doesn't exists
[[ -f "config.ini" ]] || write_config
