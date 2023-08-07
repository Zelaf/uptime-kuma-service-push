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
write_monitor_script() {
      ## Generate script
  write_monitor_script=$(
    cat <<-EOF
#!/bin/bash
# Generated using
# Uptime-Kuma-Service-Push
# https://github.com/Zelaf/uptime-kuma-service-push
for monitor in ${SCRIPT_PATH}/${MONITOR_DIRECTORY}/${MONITOR_NAME}_*.sh; do
  if [[ "\$(stat -c %U "\$monitor")" == "root" && "\$(stat -c %a "\$monitor")" == "700" ]]; then
    bash "\$monitor"
  else
    printf '%s' "Error: '\${monitor}' is not does not have permissions 700 or is not owned by 'root'."
  fi
done
EOF
  )

  ## Write the script to the new file
  printf "Generating monitor script...\n"
  echo "${write_monitor_script}" >"${SCRIPT_PATH}/${MONITOR_NAME}.sh"

}