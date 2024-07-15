#!/bin/bash

echo "Running post-create commands..."

# Source the environment variables
source /workspace/.devcontainer/.env
echo "Parent Folder: $PARENT_FOLDER"

# Navigate to the selected server directory
cd /workspace/$PARENT_FOLDER/server/$SELECTED_LANG

echo "Current directory: $(pwd)"

echo "Executing commands for language: $SELECTED_LANG"

# Run the appropriate commands based on the selected language
case $SELECTED_LANG in
    "java")
        echo "Skipping Maven build and run commands for Java."
        # mvn clean install
        # mvn spring-boot:run
        ;;
    "dotnet")
        echo "Skipping .NET restore and run commands."
        # dotnet restore
        # dotnet run
        ;;
    "python")
        echo "Setting up Python environment and starting Flask application."
        # python3 -m venv venv
        # source venv/bin/activate
        # pip install -r requirements.txt
        # flask run --host=0.0.0.0
        ;;
    "node")
        echo "Installing Node.js dependencies and starting application."
        # npm install
        # npm start
        ;;
    *)
        echo "Selected language '$SELECTED_LANG' is not supported."
        ;;
esac

echo "Post-create commands completed."