echo "# this file is located in 'src/generate_command.sh'"
echo "# code for 'uptime-kuma-service-push generate' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

#Variables - output file name
script_file=uptime-kuma-service-push_${args[service]}

#Calls to script_output that generates the script file
write_script

echo
echo
echo "Finished!"
echo
echo
echo "Your monitor script has been created in '$(readlink -f uptime-kuma-service-push_docker)'"
echo
echo "To use it simply run '${script_file}' as root."
echo
echo "You can add it to systemd, cron or your preferred method to automate the execution."
echo