#!/bin/bash
set -e

echo "Running post-attach commands..."


# Navigate to the selected server directory
cd /workspace/paypal/server/$SELECTED_LANG

echo "Current directory: $(pwd)"

echo "Starting application for language: $SELECTED_LANG"

# Run the appropriate start commands based on the selected language
case $SELECTED_LANG in
    "java")
        echo "Starting Java application."
        mvn spring-boot:run
        ;;
    "dotnet")
        echo "Starting .NET application."
        dotnet run
        ;;
    "python")
        echo "Starting Python Flask application."
        source venv/bin/activate
        python app.py
        ;;
    "node")
        echo "Starting Node.js application."
        npm start
        ;;
    *)
        echo "Selected language '$SELECTED_LANG' is not supported."
        ;;
esac

echo "Application started."