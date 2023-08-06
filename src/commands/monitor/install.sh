# this file is located in 'src/commands/config/monitor.sh'"
# code for 'uptime-kuma-service-push config monitor' goes here"
# you can edit it freely and regenerate (it will not be overwritten)"

## Variables
local directory
## Get the script directory
directory=
local monitor_name
## Get the monitor script name from the config
monitor_name=$(config_get "monitor.script_name")
local monitor_folder
## Get the monitor directory name from the config
monitor_folder=$(config_get "monitor.directory_name")

## Remove the monitor script and folder if the --remove flag is not present
[[ -z ${args[--remove]} ]] && printf '%s' "Removing  and ...\n" && rm -r "?/" "/{}" && printf "Finished!\n" && exit

## Check if the monitor folder already exists, if not create it
[[ -d "/" ]] && printf '%s' "/ already exists... Skipping.\n" || mkdir "/"

## Call the function to write the monitor script
write_monitor_script

## Tell the user the script is created and provide instructions
printf '%s' "Monitoring script created '/'\nTo use it simply run it as root.\nYou can add it to systemd, cron, or your preferred method to automate the execution.\nYou can also enable the systemd unit automatically. See 'uptime-kuma-service-push config systemd-unit --help'.\n"
echo
