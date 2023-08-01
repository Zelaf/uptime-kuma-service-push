## this file is located in 'src/generate_command.sh'"
## code for 'uptime-kuma-service-push generate' goes here"
## you can edit it freely and regenerate (it will not be overwritten)"

## Variables - output file name
script_file=uptime-kuma-service-push_${args[service]}

## Calls to script_output that generates the script file
write_script

echo
echo

## Write the script to the new file
echo "Writing file..."
echo "${write_script}" >./${script_file}

## Execution permission so it can run
echo "Adding execution permissions..."
chmod +x ./${script_file}

## Tell user that the script is finnished
echo
echo "Finished!"
echo
echo
echo "Your monitor script has been created in '$(readlink -f uptime-kuma-service-push_${args[service]})'"
echo
echo "To use it simply run '${script_file}' as root."
echo
echo "You can add it to systemd, cron or your preferred method to automate the execution."
echo
