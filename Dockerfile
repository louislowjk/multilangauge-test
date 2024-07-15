# Use a base image with common development tools
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Set default build argument
ARG LANG=none

# Start logging
RUN echo "Starting Dockerfile build..."

# Install common dependencies
RUN echo "Installing common dependencies..." && \
    apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    apt-transport-https \
    software-properties-common && \
    rm -rf /var/lib/apt/lists/* && \
    echo "Common dependencies installed."

# Install Java if selected
RUN if [ "$LANG" = "java" ]; then \
    echo "Installing Java..." && \
    apt-get update && apt-get install -y openjdk-17-jdk && \
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 && \
    echo "Java installed."; \
    fi

# Install .NET SDK if selected
RUN if [ "$LANG" = "dotnet" ]; then \
    echo "Installing .NET SDK..." && \
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && apt-get install -y dotnet-sdk-6.0 && \
    echo "dotnet-sdk-6.0 installed." && \
    rm packages-microsoft-prod.deb; \
    fi

# Install Python if selected
RUN if [ "$LANG" = "python" ]; then \
    echo "Installing Python..." && \
    apt-get update && apt-get install -y python3 python3-pip python3-venv && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    echo "Python installed."; \
    fi

# Install Node.js if selected
RUN if [ "$LANG" = "node" ]; then \
    echo "Installing Node.js..." && \
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    echo "Node.js installed."; \
    fi

# Clean up
RUN echo "Cleaning up..." && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    echo "Clean up completed."

# Set up environment variables
ENV WORKSPACE_ROOT=/workspaces

# Create a directory for the workspace
WORKDIR /workspace

# Copy the contents of the current directory to /workspace
COPY . /workspace

# Set permissions for shell scripts in .devcontainer/
RUN echo "Setting permissions for shell scripts..." && \
    chmod +x .devcontainer/*.sh && \
    echo "Permissions set."

# Final log message
RUN echo "Dockerfile build completed."