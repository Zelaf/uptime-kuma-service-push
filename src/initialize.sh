if [ "$EUID" -ne 0 ]
  then echo "This script needs to be run as root to be able to read the available services."
  echo "Example:\n"
  echo "sudo ./uptime-kuma-service-push"
  exit
fi