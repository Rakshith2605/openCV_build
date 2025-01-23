#!/bin/bash
set -e

log_step() {
    echo "===> $1"
}

# Check if Colima is installed, install if not
if ! command -v colima &> /dev/null; then
    log_step "Installing Colima"
    brew install colima
fi

# Check if Colima is running, start if not
if ! colima status &> /dev/null; then
    log_step "Starting Colima"
    colima start
fi

# Set Docker host
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"

# Verify Docker connection
log_step "Verifying Docker connection"
if ! docker ps &> /dev/null; then
    echo "Error: Docker daemon not accessible"
    exit 1
fi

log_step "Building OpenCV Docker image"
docker build -t opencv-app .

log_step "OpenCV image built successfully!"

# Print usage instructions
echo ""
echo "Usage:"
echo " run < docker run -it -v $(pwd):/app opencv-app bash >  use opencv any desired location"
