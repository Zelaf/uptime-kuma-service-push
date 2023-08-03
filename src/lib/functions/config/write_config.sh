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

    ## Generate config file
    write_config="$(
        cat <<-EOF
; Config file for
; Uptime-Kuma-Service-Push
; For more information do 'uptime-kuma-service-push config --help'
; https://github.com/Zelaf/uptime-kuma-service-push
[generate]
file_name = uptime-kuma-service-push
folder_location = push-scripts
EOF
    )"

    ## Write the script to the new file
    echo "Config file created!"
    echo "${write_config}" >"${CONFIG_FILE}"

}
