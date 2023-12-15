## Checks if the monitor script exists
## src/lib/filters/filters_directory_exists.sh
## This function is responsible for directory validation
filter_monitor_directory_exists() {
    [[ -f "$SCRIPT_PATH/${MONITOR_NAME}" ]] || printf "Monitor script does not exist, please see 'uptime-kuma-service-push config monitor --help'\n"
}
