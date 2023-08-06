## this file is located in 'src/commands/monitor/add.sh'"
## code for 'uptime-kuma-service-push monitor add' goes here"
## you can edit it freely and regenerate (it will not be overwritten)"

## Variables
service=${args[service]}

## Move script to monitor directory
if ! [[ -d "$SCRIPT_PATH/$(config_get monitor.directory_name)" ]]; then
    echo "Error: $SCRIPT_PATH/$(config_get monitor.directory_name) does not exist. See 'uptime-kuma-service-push monitor install --help'"
else
    echo "Enabling monitoring for $service" && mv "$SCRIPT_PATH/$(config_get generate.directory_name)/$(config_get generate.script_name)_$service.sh" "$SCRIPT_PATH/$(config_get monitor.directory_name)/$(config_get monitor.script_name)_$service.sh" && echo "Finished!"
fi
