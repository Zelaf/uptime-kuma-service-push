# this file is located in 'src/commands/config/install.sh'"
# code for 'uptime-kuma-service-push config install' goes here"
# you can edit it freely and regenerate (it will not be overwritten)"

## Variables
local new_folder="${args[folder]}/uptime-kuma-service-push"
local old_folder=$SCRIPT_PATH

## Notifying of install
printf "Installing Uptime-Kuma-Service-Push to $new_folder\n"
echo

## Creating directory
[[ -d "$new_folder" ]] && printf "Directory '$new_folder' already exists... Skipping.\n" || mkdir "$new_folder"

## Moving script
[[ -f "$new_folder" ]] && printf "$new_folder already exists in... Overwriting." 
mv $old_folder/uptime-kuma-service-push $new_folder/uptime-kuma-service-push

## Moving config file
[[ -f "$old_folder/config.ini" ]] && mv $old_folder/config.ini $new_folder/config.ini

## Moving generated scripts folder
[[ -d "$old_folder/${config[generate.folder_location]}/" ]] && mv $old_folder/${config[generate.folder_location]}/ $new_folder/${config[generate.folder_location]}/

## Move monitor script
[[ -f "$old_folder/monitor-script.sh" ]] && mv $old_folder/monitor-script.sh $new_folder/monitor-script.sh

## Move monitored scripts folder
[[ -d "$old_folder/monitored-push-scripts/" ]] && mv $old_folder/monitored-push-scripts/ $new_folder/monitored-push-scripts/

## Make a symlink to /usr/local/bin
ln -s $new_folder/uptime-kuma-service-push /usr/local/bin/uptime-kuma-service-push

## Message user
printf "Install complete!\nYour installation directory is $new_folder\nYou can now run the script using 'uptime-kuma-service-push' directly in the terminal.\n"
echo
