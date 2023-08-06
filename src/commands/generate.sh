## This file is located in 'src/generate_command.sh'
## Code for 'uptime-kuma-service-push generate' goes here
## You can edit it freely and regenerate (it will not be overwritten)

## Variables
local service
service=${args[service]}
local url
url=${args[url]}
local script_file
script_file=$(config_get "generate.script_name")_"$service".sh
local script_folder
script_folder=$SCRIPT_PATH/$(config_get "generate.directory_name")

## Calls the write_script function that generates the script file
write_script

## Adds execution permission so it can run
printf "Adding execution permissions..."
chmod +x "${script_folder}/${script_file}"

## Tells the user that the script is finished
printf '%s' "\nFinished!\n\nYour monitor script has been created in '$(readlink -f "${script_folder}/${script_file}")'\nTo use it simply run it as root.\n\nYou can add it to systemd, cron, or your preferred method to automate the execution.\n"
