# this file is located in 'src/commands/config/install.sh'"
# code for 'uptime-kuma-service-push config install' goes here"
# you can edit it freely and regenerate (it will not be overwritten)"

## Variables
local new_folder
new_folder="${args[folder]}/uptime-kuma-service-push"
local old_folder
old_folder=$SCRIPT_PATH

## Notifying of install
printf '%s' "Installing Uptime-Kuma-Service-Push in $new_folder\n"
echo

## Creating directory
[[ -d "$new_folder" ]] && printf '%s' "Directory '$new_folder' already exists... Skipping.\n" || mkdir "$new_folder"

## Moving script
[[ -f "$new_folder" ]] && printf '%s' "$new_folder already exists in... Overwriting."
mv "$old_folder"/uptime-kuma-service-push "$new_folder"/uptime-kuma-service-push

## Moving config file
[[ -f "$old_folder/config.ini" ]] && mv "$old_folder"/config.ini "$new_folder"/config.ini

## Moving generated scripts folder
[[ -d "$old_folder/$(config_get generate.directory_name)/" ]] && mv "$old_folder"/"$(config_get generate.directory_name)"/ "$new_folder"/"$(config_get generate.directory_name)"/

## Move monitor script
[[ -f "$old_folder/$(config_get monitor.script_name).sh" ]] && mv "$old_folder"/"$(config_get monitor.file_name)".sh "$new_folder"/"$(config_get monitor.file_name)".sh

## Move monitored scripts folder
[[ -d "$old_folder/$(config_get monitor.directory_name)" ]] && mv "$old_folder"/"$(config_get monitor.directory_name)"/ "$new_folder"/"$(config_get monitor.directory_name)"/

## Skip making a symlink to /usr/local/bin if flag is set
[[ -z ${args[--no-link]} ]] || ln -s "$new_folder"/uptime-kuma-service-push /usr/local/bin/uptime-kuma-service-push

## Set install directory in config.ini
config_set "config.install_directory" "$new_folder"

## Message user
printf '%s' "Install complete!\nYour installation directory is $new_folder\n"
[[ -z ${args[--no-link]} ]] && printf '%s' "No symlink has been made, to run use 'sudo $new_folder/uptime-kuma-service-push'\n" || printf "You can now run the script using 'uptime-kuma-service-push' directly in the terminal.\n"
echo
