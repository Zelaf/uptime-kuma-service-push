## this file is located in 'src/commands/config/install.sh'"
## code for 'uptime-kuma-service-push config install' goes here"
## you can edit it freely and regenerate (it will not be overwritten)"
## Variables
local new_folder
new_folder="${args[directory]}/uptime-kuma-service-push"
local old_folder
old_folder=$SCRIPT_PATH

## Delete symlink if --remove-link is set and the link exists 
if [[ -f "/usr/local/bin/uptime-kuma-service-push" && ${args[--remove-link]} ]]; then
    rm /usr/local/bin/uptime-kuma-service-push && printf "Removing symlink...\n"
    echo "Finished!"
    exit 0
else
    echo "No existing link found..."
    echo "Finished!"
fi

## Notifying of install
printf "Installing Uptime-Kuma-Service-Push in $new_folder\n"
echo

## Creating directory
[[ -d "$new_folder" ]] && printf "Directory '$new_folder' already exists... Skipping.\n" || mkdir "$new_folder"

## Moving script
[[ -f "$new_folder/uptime-kuma-service-push" ]] && printf "Uptime-Kuma-Service-Push already exists in $new_folder... Overwriting.\n"
mv "$old_folder"/uptime-kuma-service-push "$new_folder"/

## Moving generated scripts folder
[[ -d "$old_folder/$GENERATE_DIRECTORY/" ]] && mv "$old_folder"/"$GENERATE_DIRECTORY"/ "$new_folder"/"$GENERATE_DIRECTORY"/

config_set "config.install_directory" "$new_folder"

## Moving config file
if [[ -f "$old_folder/config.ini" ]]; then
    echo "Config already exists in $new_folder... Skipping."
else
    mv "$old_folder"/config.ini "$new_folder"/config.ini
fi
## TODO: Tell users they need to remake the monitor script in new install directory if it exists. or find a way to move the files / recreate them.
## ## Move monitor script
## echo "moving monitor script"
## [[ -f "$old_folder/$(config_get monitor.script_name).sh" ]] && mv "$old_folder"/"$(config_get monitor.file_name)".sh "$new_folder"/"$(config_get monitor.file_name)".sh
##
## ## Move monitored scripts folder
## echo "moving monitored scripts folder"
## [[ -d "$old_folder/$(config_get monitor.directory_name)" ]] && mv "$old_folder"/"$(config_get monitor.directory_name)"/ "$new_folder"/"$(config_get monitor.directory_name)"/

## Skip making a symlink to /usr/local/bin if flag is not set
if [[ -z ${args[--no-link]} ]]; then
    ln -s -f "$new_folder"/uptime-kuma-service-push /usr/local/bin/uptime-kuma-service-push
fi

## Message user
printf "Install complete!\nYour installation directory is $new_folder\n"
if [[ ${args[--no-link]} ]]; then
    printf "No symlink has been made, to run use 'sudo $new_folder/uptime-kuma-service-push'\n"
else
    printf "You can now run the script using 'uptime-kuma-service-push' directly in the terminal.\n"
fi
echo
