## this file is located in 'src/commands/monitor/disable.sh'"
## code for 'uptime-kuma-service-push monitor disable' goes here"
## you can edit it freely and regenerate (it will not be overwritten)"
## Variables
service=${args[service]}

## Move script to monitor directory
if ! [[ -d "$SCRIPT_PATH/$MONITOR_DIRECTORY" ]]; then
    echo "Error: $SCRIPT_PATH/$MONITOR_DIRECTORY does not exist. See 'uptime-kuma-service-push monitor install --help'"
else
    echo "Disabling monitoring for $service" && mv "$SCRIPT_PATH/$MONITOR_DIRECTORY/${MONITOR_NAME}_$service.sh" "$SCRIPT_PATH/$GENERATE_DIRECTORY/${GENERATE_NAME}_$service.sh" && echo "Finished!"
fi