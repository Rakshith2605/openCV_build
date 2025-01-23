#!/bin/bash
set -e

# Function to log steps
log_step() {
    echo "===> $1"
}

# Function to check command status
check_status() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed"
        exit 1
    fi
}

# Check if Homebrew is installed, install if not
if ! command -v brew &> /dev/null; then
    log_step "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    check_status "Homebrew installation"
fi

# Install Docker CLI and dependencies
log_step "Installing Docker CLI and dependencies"
brew install docker docker-credential-helper
check_status "Docker CLI installation"

# Create required directories
log_step "Creating Docker config directory"
mkdir -p ~/.docker
check_status "Directory creation"

# Configure Docker credentials
log_step "Configuring Docker credentials"
echo '{"credsStore":"osxkeychain"}' > ~/.docker/config.json
check_status "Credentials configuration"

log_step "Docker CLI installation completed!"
