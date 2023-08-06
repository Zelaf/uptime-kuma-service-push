# this file is located in 'src/commands/config/monitor.sh'"
# code for 'uptime-kuma-service-push config monitor' goes here"
# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args
## Variables
local monitor_script_location=$SCRIPT_PATH
local monitor_file_name=$(config_get "config.monitor_file_name")
local 