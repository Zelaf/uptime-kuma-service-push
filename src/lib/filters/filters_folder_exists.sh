## Checks if the folder is valid but doing a curl before generating the script
## src/lib/validations/generate/validate_folder.sh
## This function is responsible for folder validation
filter_folder_exists() {
    [[ -d "$script_path/${config[generate.folder_location]}" ]] || mkdir "$script_path/${config[generate.folder_location]}"
}