FROM gitpod/workspace-full:latest

USER gitpod

# Copy GlobalProtect App for Linux from your repository
# COPY PanGPLinux-6.1.3-c3.tgz /tmp/
COPY GlobalProtect_deb-6.1.3.0-703.deb /tmp/

# Install dependencies
RUN sudo apt-get update && \
    sudo apt-get install -y curl && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*

# Extract and install GlobalProtect App for Linux
RUN cd /tmp && \
#    sudo tar -xvf PanGPLinux-6.1.3-c3.tgz && \
    sudo dpkg -i GlobalProtect_deb-6.1.3.0-703.deb

# Cleanup
RUN sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*
