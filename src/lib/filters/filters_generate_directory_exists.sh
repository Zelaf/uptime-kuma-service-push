## Checks if the generate directory exists and if not, creates it.
## src/lib/filters/filters_directory_exists.sh
## This function is responsible for directory validation
filter_generate_directory_exists() {
    [[ -d "$SCRIPT_PATH/${GENERATE_DIRECTORY}" ]] || mkdir "$SCRIPT_PATH/${GENERATE_DIRECTORY}"
}
