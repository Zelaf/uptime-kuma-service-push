## Checks if the folder is valid but doing a curl before generating the script
## src/lib/validations/generate/validate_folder.sh
## This function is responsible for folder validation
filter_folder_exists() {
    [[ -d "$SCRIPT_PATH/$(config_get "generate.folder_location")" ]] || mkdir "$SCRIPT_PATH/$(config_get "generate.folder_location")"
}