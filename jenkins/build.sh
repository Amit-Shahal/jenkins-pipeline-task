#!/bin/bash

# Path to your private key
SSH_KEY_PATH="${1:-$HOME/.ssh/jenkins_user}"

if [ ! -f "$SSH_KEY_PATH" ]; then
    echo "Error: SSH key not found at $SSH_KEY_PATH"
    exit 1
fi

# Export the private key content (preserve newlines)
export GITHUB_SSH_PRIVATE_KEY=$(cat "$SSH_KEY_PATH")

# Rebuild and restart
docker-compose down
docker-compose build --no-cache
docker-compose up -d
docker logs jenkins

echo "Jenkins started with SSH key configured"
