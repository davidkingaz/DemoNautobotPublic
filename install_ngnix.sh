#!/bin/bash

# give it executable permissions with 
# "chmod +x install_nginx.sh"
# and run it with "./install_nginx.sh".

# Update the package index
sudo apt-get update

# Install Docker
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce

echo "Docker installed successfully."

# Install Docker Compose
sudo apt-get install docker-compose-plugin

echo "Docker Compose installed successfully."

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Add the current user to the Docker group
sudo usermod -aG docker $(whoami)

# Print Docker version to verify installation
docker --version
docker compose version
 
echo "Pre-requisites Completed"