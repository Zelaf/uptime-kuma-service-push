# this file is located in 'src/commands/config/monitor.sh'"
# code for 'uptime-kuma-service-push config monitor' goes here"
# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args
## Variables
local directory
directory=$SCRIPT_PATH
local monitor_name
monitor_name=$(config_get "monitor.script_name")
local monitor_folder
monitor_folder=$(config_get "monitor.directory_name")

[[ -z ${args[--remove]} ]] && printf '%s' "Removing $monitor_name and $monitor_folder...\n" && rm -r "${directory:?}/${monitor_name}" "${directory}/{$monitor_folder}" && printf "Finished!\n" && exit

[[ -d "$directory/$monitor_folder" ]] && printf '%s' "${directory}/${monitor_folder} already exists... Skipping.\n" || mkdir "${directory}/${monitor_folder}"

write_monitor_script

# Tell user it's done
printf '%s' "Monitoring script created '$directory/$monitor_name'\nTo use it simply run it as root.\nYou can add it to systemd, cron, or your preferred method to automate the execution.\nYou can also enable the systemd unit automatically. See 'uptime-kuma-service-push config systemd-unit --help'.\n"
echo