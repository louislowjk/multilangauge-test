#!/bin/bash
set -e

{
    echo "Running post-create commands..."

    # Source the environment variables
    source /workspace/.devcontainer/.env
    echo "Parent Folder: $PARENT_FOLDER"

    # Navigate to the selected server directory
    cd /workspace/$PARENT_FOLDER/server/$SELECTED_LANG

    echo "Current directory: $(pwd)"

    echo "Executing setup commands for language: $SELECTED_LANG"

    # Run the appropriate setup commands based on the selected language
    case $SELECTED_LANG in
        "java")
            echo "Setting up Java environment."
            # mvn clean install
            ;;
        "dotnet")
            echo "Setting up .NET environment."
            # dotnet restore
            ;;
        "python")
            echo "Setting up Python environment."
            python3 -m venv venv
            source venv/bin/activate
            pip install -r requirements.txt
            ;;
        "node")
            echo "Setting up Node.js environment."
            npm install
            ;;
        *)
            echo "Selected language '$SELECTED_LANG' is not supported."
            ;;
    esac

    echo "Post-create commands completed."
} 2>&1 | tee /workspaces/post-create-output.log