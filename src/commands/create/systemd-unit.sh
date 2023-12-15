## this file is located in 'src/commands/config/systemd-unit.sh'"
## code for 'uptime-kuma-service-push config systemd-unit' goes here"
## you can edit it freely and regenerate (it will not be overwritten)"

## Variables
unit_file="$(config_get "config.systemd_unit_name")"
unit_interval="$(config_get "config.systemd_push_interval")"

## Remove the systemd unit file
## if the "--remove" argument is provided.
if [[ ${args[--remove]} ]]; then
    printf "Disabling unit files...\n"
    systemctl disable "$unit_file".service
    systemctl disable "$unit_file".timer
    printf "Removing systemd unit file...\n"
    if [[ -f "/etc/systemd/system/${unit_file}.service" ]]; then
        rm "/etc/systemd/system/${unit_file}.service"
    else
        echo "Systemd service file does not exist... Skipping."
    fi
    if [[ -f "/etc/systemd/system/${unit_file}.timer" ]]; then
        rm "/etc/systemd/system/${unit_file}.timer"
    else
        echo "Systemd timer file does not exist... Skipping."
    fi
    echo "Reloading systemd..."
    systemctl daemon-reload
    printf "Finished!\n"
    exit 0
fi

echo "Installing systemd unit files..."

write_systemd_unit

echo "Enabling systemd unit..."
systemctl daemon-reload
systemctl enable ${unit_file}.service --now
systemctl enable ${unit_file}.timer --now


echo "Finished!"
echo "Your services will now be monitored by systemd."