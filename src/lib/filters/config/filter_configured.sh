## These filter functions can reside in any path under the `lib` directory.
## You can use a single file for all filter functions, or a separate file
## for each function.
## Note that the `${args[]}` array is available to you in your filter functions.
## Checks if the initial configuration has been made.
## Check if the environmental variable `config_configured` is set to 'false'
filter_generated() {
    [[ "$config_configured" == "false" ]] &&
        ## Check the value of the `action` variable
        [[ "$action" != "config" ]] ||
        printf "Uptime-Kuma-Service-Push is not configured yet\nSee 'uptime-kuma-service-push config --help'\n\n"
    exit 1
}
