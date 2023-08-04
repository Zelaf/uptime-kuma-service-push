## this file is located in 'src/generate_command.sh'"
## code for 'uptime-kuma-service-push generate' goes here"
## you can edit it freely and regenerate (it will not be overwritten)"

## Variables
local service=${args[service]}
local url=${args[url]}
local script_file=${config[generate.file_name]}_$service.sh
local script_folder=$script_path/${config[generate.folder_location]}

## Calls to the write_script function that generates the script file
write_script
echo

## Execution permission so it can run
printf "Adding execution permissions..."
chmod +x ${script_folder}/${script_file}

## Tell user that the script is finnished
## Shorter version
printf "\nFinished!\n\nYour monitor script has been created in '$(readlink -f ${script_folder}/${script_file})'\nTo use it simply run it as root.\n\nYou can add it to systemd, cron or your preferred method to automate the execution.\n"