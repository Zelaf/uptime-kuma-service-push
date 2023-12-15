## this file is located in 'src/commands/config/monitor.sh'"
## code for 'uptime-kuma-service-push config monitor' goes here"
## you can edit it freely and regenerate (it will not be overwritten)"

## Remove the monitor script if --remove is set
if [[ -n ${args[--remove]} ]]; then
    printf "Removing monitor script and and directory...\n"
    rm -r "${SCRIPT_PATH:?}/${MONITOR_DIRECTORY}" "${SCRIPT_PATH:?}/${MONITOR_NAME}.sh"
    printf "Finished!\n"
    exit
fi

## Check if the monitor directory already exists, if not create it
if [[ -d "${SCRIPT_PATH}/${MONITOR_DIRECTORY}" ]]; then
    printf "'%s' already exists... Skipping.\n" "${SCRIPT_PATH}/${MONITOR_DIRECTORY}"
else 
    mkdir "${SCRIPT_PATH}/${MONITOR_DIRECTORY}"
fi

## Call the function to write the monitor script
write_monitor_script

## Add execution permission to the generated script
printf "Adding execution permissions...\n"
chmod 700 "${SCRIPT_PATH}/${MONITOR_NAME}.sh"

## Tell the user the script is created and provide instructions
printf "Monitoring script created at '%s/%s' \nTo use it simply run it as root. \nYou can add it to systemd, cron, or your preferred method to automate the execution. \nYou can also enable a systemd unit automatically. See 'uptime-kuma-service-push config systemd-unit --help'. \n" "$SCRIPT_PATH" "$MONITOR_NAME"
echo
