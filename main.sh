#!/bin/bash

# Exit on any error
set -e

# Function to log steps
log_step() {
    echo "===> $1"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check script files exist
if [ ! -f "install_docker.sh" ] || [ ! -f "build_opencv.sh" ]; then
    log_step "Error: Required script files not found"
    exit 1
fi

# Make scripts executable
log_step "Making scripts executable"
chmod +x install_docker.sh build_opencv.sh

# Check if Docker is already installed
if ! command_exists docker; then
    log_step "Installing Docker"
    ./install_docker.sh
else
    log_step "Docker already installed"
fi

# Build OpenCV image
log_step "Building OpenCV Docker image"
./build_opencv.sh

# Verify installation
log_step "Verifying OpenCV installation"
docker run --rm opencv-app python -c "import cv2; print(f'OpenCV version: {cv2.__version__}')"

log_step "Setup completed successfully!"

# Print usage instructions
echo ""
echo "To run OpenCV container interactively:"
echo "docker run -it -v \$(pwd):/app opencv-app bash"

