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

folder="${directory}/${monitor_folder}"  # Replace with the path to your folder

for script in ""/$monitor_name.sh*; do
    if [[ -x "" && $(stat -c %U "") == "root" ]]; then
        ""
    fi
done
EOF
  )

  ## Write the script to the new file
  printf "Generating monitor script..."
  echo "${write_monitor_script}" >"${directory}/${monitor_name}.sh"

}