## this file is located in 'src/commands/config/systemd-unit.sh'"
## code for 'uptime-kuma-service-push config systemd-unit' goes here"
## you can edit it freely and regenerate (it will not be overwritten)"

echo "Installing systemd unit files..."

write_systemd_unit

echo "Enabling systemd unit..."
systemctl daemon-reload
systemctl enable uptime-kuma-service-push.timer --now
systemctl enable uptime-kuma-service-push.service --now

echo "Finished!"
echo "Your services will now be monitored by systemd."