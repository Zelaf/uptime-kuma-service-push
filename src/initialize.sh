if [ "$EUID" -ne 0 ]
  then 
  echo
  echo "This script needs to be run as root to be able to read the available services."
  echo
  echo "Example:"
  echo "sudo ${PWD}/uptime-kuma-service-push"
  echo
  exit
fi