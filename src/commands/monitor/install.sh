# this file is located in 'src/commands/config/monitor.sh'"
# code for 'uptime-kuma-service-push config monitor' goes here"
# you can edit it freely and regenerate (it will not be overwritten)"

## Variables
## Get the script directory
local directory
directory=$SCRIPT_PATH
## Get the monitor script name from the config
local monitor_name
monitor_name=$(config_get "monitor.script_name")
## Get the monitor directory name from the config
local monitor_directory
monitor_directory=$(config_get "monitor.directory_name")
## Get the push script name from the config
local script_name
script_name=$(config_get "generate.script_name")

if [[ -n ${args[--remove]} ]]; then
    printf "Removing monitor script and and directory...\n"
    rm -r "${directory:?}/${monitor_directory:?}" "${directory:?}/${monitor_name:?}.sh"
    printf "Finished!\n"
    exit
fi

## Check if the monitor directory already exists, if not create it
[[ -d "${directory}/${monitor_directory}" ]] && printf "'${directory}/${monitor_directory}' already exists... Skipping.\n" || mkdir "${directory}/${monitor_directory}"

## Call the function to write the monitor script
write_monitor_script

## Add execution permission to the generated script
printf "Adding execution permissions...\n"
chmod 700 "${directory}/${monitor_name}.sh"

## Tell the user the script is created and provide instructions
printf "Monitoring script created at '${directory}/${monitor_name}' \nTo use it simply run it as root. \nYou can add it to systemd, cron, or your preferred method to automate the execution. \nYou can also enable a systemd unit automatically. See 'uptime-kuma-service-push config systemd-unit --help'. \n"
echo
