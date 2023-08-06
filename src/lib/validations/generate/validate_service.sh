## Checks if the URL is valid but doing a curl before generating the script
## src/lib/validations/url/validate_url.sh
## This function is responsible for URL validation
validate_service() {

  ## This condition checks if the service is running, writes error message if not.
  systemctl is-active --quiet "${1}" || printf '%s' "'${1}' is not a running service \nSee 'uptime-kuma-service-push generate --help'"

}
