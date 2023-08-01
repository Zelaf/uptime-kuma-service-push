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

  ## Script that checks if the service is running and pushes if it does - errors if it doesn't.
  write_script=$(
    cat <<-EOF
 #!/usr/bin/env bash
 
 # Generated using
 # Uptime-Kuma-Service-Push

 if systemctl is-active --quiet ${args[service]}; then
   curl -G ${args[url]%%'?'*}?status=up --silent --data-urlencode --output /dev/null "msg=${args[service]} - running"
 else
   curl -G ${args[url]%%'?'*}?status=down --silent --data-urlencode --output /dev/null "msg=${args[service]} - not running. Log: \$(journalctl -xeu ${args[service]} | tail -n5)"
 fi
EOF
  )

  ## Write the script to the new file
  echo "Generating push-script file..."
  echo "${write_script}" >./${script_file}

}
