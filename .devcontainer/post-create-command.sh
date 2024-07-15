#!/bin/bash

echo "Running post-create commands..."

# # Source the environment variables
# source /workspace/.devcontainer/.env

# # Navigate to the selected server directory
# cd /workspace/$PARENT_FOLDER/server/$SELECTED_LANG

# # Run the appropriate commands based on the selected language
# case $SELECTED_LANG in
#     "java")
#         mvn clean install
#         mvn spring-boot:run
#         ;;
#     "dotnet")
#         dotnet restore
#         dotnet run
#         ;;
#     "python")
#         python3 -m venv venv
#         source venv/bin/activate
#         pip install -r requirements.txt
#         flask run --host=0.0.0.0
#         ;;
#     "node")
#         npm install
