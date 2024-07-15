#!/bin/bash

echo "Initializing devcontainer..."

# Function to select the server language
select_language() {
    PS3="Select the server language: "
    options=("java" "dotnet" "python" "node")
    select opt in "${options[@]}"; do
        case $opt in
            "java"|"dotnet"|"python"|"node")
                echo "You chose $opt"
                export SELECTED_LANG=$opt
                break
                ;;
            *) echo "Invalid option $REPLY";;
        esac
    done
}

select_language

# Store the selected language in environment variables
echo "SELECTED_LANG=$SELECTED_LANG" >> /workspace/.devcontainer/.env
