# Use a base image with common development tools
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Start logging
RUN echo "Starting Dockerfile build..."

# Install common dependencies
RUN apt-get update \
    && apt-get install -y \
        curl \
        git \
        wget \
        apt-transport-https \
        software-properties-common \
    && rm -rf /var/lib/apt/lists/* \
    && echo "Common dependencies installed."

# Install Java
# RUN apt-get update \
#     && apt-get install -y openjdk-17-jdk \
#     && export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 \
#     && echo "Java installed."

# Install .NET SDK
# RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
#     && dpkg -i packages-microsoft-prod.deb \
#     && apt-get update \
#     && apt-get install -y dotnet-sdk-6.0 \
#     && rm packages-microsoft-prod.deb \
#     && echo "dotnet-sdk-6.0 installed."

# Install Python
RUN apt-get update \
    && apt-get install -y python3 python3-pip python3-venv \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && echo "Python installed."

Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && echo "Node.js installed."

# Clean up
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo "Clean up completed."

# Set up environment variables
ENV WORKSPACE_ROOT=/workspaces

# Create a directory for the workspace
WORKDIR /workspace

# Copy the contents of the current directory to /workspace
COPY . /workspace

# Copy the .devcontainer folder into the image
COPY .devcontainer /workspaces/.devcontainer

# Set permissions for all .sh files in the .devcontainer folder and its subdirectories
RUN find /workspace/.devcontainer -name "*.sh" -type f -exec chmod +x {} + || echo "No .sh files found" \
    && echo "Permissions check completed."

# Final log message
RUN echo "Dockerfile build completed."