if [ "$EUID" -ne 0 ]
  then 
  echo
  printf "This script needs to be run as root to be able to read the available services.\n"
  echo
  exit
fi

## Variable for script location
script_path=$(dirname "$(readlink -f "$0")")

## Generate config file if it doesn't exists
[[ -f "config.ini" ]] || write_config

## Set config file
config_load $script_path/config.ini