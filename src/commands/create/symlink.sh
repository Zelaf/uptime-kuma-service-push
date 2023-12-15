## code for 'uptime-kuma-service-push create symlink' goes here"
## you can edit it freely and regenerate (it will not be overwritten)"
## this file is located in 'src/commands/create/symlink.sh'"
inspect_args

echo "Creating symlink for Uptime-Kuma-Service-Push..."
ln -s -f "$SCRIPT_PATH"/uptime-kuma-service-push /usr/local/bin/uptime-kuma-service-push
echo "Finished! You can now run Uptime-Kuma-Service-Push using 'uptime-kuma-service-push' directly in the terminal."
echo