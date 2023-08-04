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

    declare -A config

    ## Default vaules
    config[generate.file_name]=uptime-kuma-service-push
    config["generate.folder_location"]=push-scripts

    ## Save config
    config_save "$script_path/config.ini"

}
