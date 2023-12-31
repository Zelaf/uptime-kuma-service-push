## This file is located in 'src/generate_command.sh'
## Code for 'uptime-kuma-service-push generate' goes here
## You can edit it freely and regenerate (it will not be overwritten)

## Variables
local service
service=${args[service]}
local url
url=${args[url]}
local script_file
script_file=${GENERATE_NAME}_"$service".sh
local script_directory
script_directory=$SCRIPT_PATH/$GENERATE_DIRECTORY

## Inform user about log flag
[[ -n ${args[--no-logs]} ]] && printf "Skipping logs in message...\n"
[[ -n ${args[--add-logs]} ]] && printf "Appending logs to message...\n"

## Calls the write_script function that generates the script file
write_script

## Adds execution permission so it can run
printf "Modifying execution permissions...\n"
chmod 700 "${script_directory}/${script_file}"

## Enables monitoring on generated script
if [[ ${args[--monitor]} ]]; then
    if [[ -d "${SCRIPT_PATH}/${MONITOR_DIRECTORY}" ]]; then
        printf "Enabling monitoring for $service...\n"
        mv "${SCRIPT_PATH}/${GENERATE_DIRECTORY}/${GENERATE_NAME}_$service.sh" "${SCRIPT_PATH}/${MONITOR_DIRECTORY}/${MONITOR_NAME}_$service.sh"
    else
        echo "Error: $SCRIPT_PATH/$MONITOR_DIRECTORY does not exist. See 'uptime-kuma-service-push config monitor --help'" && exit 1
    fi
fi

## Tells the user that the script is finished
if  [[ ${args[--monitor]} ]]; then
    printf "\nFinished!\n\nYour monitor script has been created in '$(readlink -f "${SCRIPT_PATH}/${MONITOR_DIRECTORY}")'\nIt's ready to be used by the monitor script.\n\n"
    else
    printf "\nFinished!\n\nYour monitor script has been created in '$(readlink -f "${script_directory}/${script_file}")'\nTo use it simply run it as root.\n\nYou can add it to systemd, cron, or your preferred method to automate the execution.\n\n"
fi