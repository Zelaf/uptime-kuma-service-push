## Checks if the URL is valid but doing a curl before generating the script
## src/lib/validations/url/validate_url.sh
## This function is responsible for URL validation
validate_url() {

  ## This condition checks if the URL is in a valid format, writes error message if not.
  [[ "${1}" =~ ^(http|https)://.*/api/push/.*$ ]] || printf "'${1}' is not a valid URL \nSee 'uptime-kuma-service-push generate --help'"
}