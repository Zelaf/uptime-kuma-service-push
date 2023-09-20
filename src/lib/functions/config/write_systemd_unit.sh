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
write_systemd_unit() {
      systemd_service=$(
      cat <<-EOF
[Unit]
Description=Check monitored services using Uptime-Kuma-Service-Push
Documentation=https://github.com/Zelaf/uptime-kuma-service-push

[Service]
Type=simple
ExecStart=$SCRIPT_PATH/${MONITOR_NAME}.sh

[Install]
WantedBy=multi-user.target
EOF
      )

  systemd_timer=$(
      cat <<-EOF
[Unit]
Description=Timer for Uptime-Kuma-Service-Push systemd service
Documentation=https://github.com/Zelaf/uptime-kuma-service-push

[Timer]
OnUnitActiveSec=$unit_interval
AccuracySec=1us

[Install]
WantedBy=$unit_file.service
EOF
      )

  ## Write the unit files to systemd
  printf "Writing systemd unit files...\n"
  echo "$systemd_service" >"/etc/systemd/system/$unit_file.service"
  echo "$systemd_timer" >"/etc/systemd/system/$unit_file.timer"
}