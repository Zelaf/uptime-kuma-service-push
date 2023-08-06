## Add any function here that is needed in more than one parts of your
## application, or that you otherwise wish to extract from the main function
## scripts.
##
## Note that code here should be wrapped inside bash functions, and it is
## recommended to have a separate file for each function.
##
## Subdirectories will also be scanned for *.sh, so you have no reason not
## to organize your code neatly.
## Function that geerates the config file.
write_config() {

    ## Default values
    config_set "generate.file_name" "uptime-kuma-service-push"
    config_set "generate.folder_location" "push-scripts"
    config_set "config.monitored_folder_location" "monitored-scripts"
    config_set "config.monitor_file_name" "uptime-kuma-service-push-monitor"
    config_set "config.systemd_unit_installed" "false"

}
