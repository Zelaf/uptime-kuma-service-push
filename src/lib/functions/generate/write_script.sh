## Add any function here that is needed in more than one parts of your
## application, or that you otherwise wish to extract from the main function
## scripts.
##
## Note that code here should be wrapped inside bash functions, and it is
## recommended to have a separate file for each function.
##
## Subdirectories will also be scanned for *.sh, so you have no reason not
## to organize your code neatly.
##
write_script() {

  ## Generate script
  write_script=$(
    cat <<-EOF
 #!/usr/bin/env bash
 
 # Made using
 # Uptime-Kuma-Service-Push
 # https://github.com/Zelaf/uptime-kuma-service-push

 if systemctl is-active --quiet ${service}; then
   curl -G ${url%%'?'*}?status=up --silent --output /dev/null --data-urlencode "msg=${service} - running"
 else
   curl -G ${url%%'?'*}?status=down --silent --output /dev/null --data-urlencode "msg=${service} - not running. Log: \$(journalctl -xeu ${service} | tail -n5)"
 fi
EOF
  )

  ## Write the script to the new file
  printf "Generating push-script..."
  echo "${write_script}" >"${script_folder}/${script_file}"

}
