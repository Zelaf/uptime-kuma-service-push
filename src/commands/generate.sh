## this file is located in 'src/generate_command.sh'"
## code for 'uptime-kuma-service-push generate' goes here"
## you can edit it freely and regenerate (it will not be overwritten)"

## Variables
local service=${args[service]}
local url=${args[url]}
local script_file=$(config_get generate.file_name uptime_kuma_service_push)_$service.sh
local script_folder=$(config_get generate.folder_location push-scripts)

## Calls to the write_script function that generates the script file
write_script
echo
echo

## Execution permission so it can run
echo "Adding execution permissions..."
chmod +x ${script_folder}/${script_file}

## Tell user that the script is finnished
echo
echo "Finished!"
echo
echo "Your monitor script has been created in '$(readlink -f ${script_folder}/${script_file})'"
echo "To use it simply run it as root."
echo
echo "You can add it to systemd, cron or your preferred method to automate the execution."
echo
