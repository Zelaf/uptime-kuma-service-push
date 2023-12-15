## Checks if the monitor script exists
## src/lib/filters/filters_directory_exists.sh
## This function is responsible for directory validation
filter_monitor_script_exists() {
    [[ -f "$SCRIPT_PATH/${MONITOR_NAME}.sh" ]] || printf "Monitor script does not exist, please see 'uptime-kuma-service-push create monitor --help'\n"
}
