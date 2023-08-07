## this file is located in 'src/commands/monitor/add.sh'"
## code for 'uptime-kuma-service-push monitor add' goes here"
## you can edit it freely and regenerate (it will not be overwritten)"

## Variables
service=${args[service]}

## Move script to monitor directory
if ! [[ -d "$SCRIPT_PATH/$MONITOR_DIRECTORY" ]]; then
    echo "Error: $SCRIPT_PATH/$MONITOR_DIRECTORY does not exist. See 'uptime-kuma-service-push monitor install --help'" && exit 1
else
    echo "Enabling monitoring for $service" && mv "$SCRIPT_PATH/$GENERATE_DIRECTORY/${GENERATE_NAME}_$service.sh" "$SCRIPT_PATH/$MONITOR_DIRECTORY/${MONITOR_NAME}_$service.sh" && echo "Finished!"
fi
