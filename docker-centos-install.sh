#!/bin/bash

#Get Docker Engine - Community for CentOS + docker compose

set -e
#Uninstall old versions
sudo yum remove docker docker-common docker-selinux docker-engine-selinux docker-engine docker-ce
#Update the packages:
sudo yum update -y

#Install needed packages 
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Configure the docker-ce repo:
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install the latest docker-ce
sudo yum install docker-ce

# Enable & start docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

# add current user to the docker group to avoid using sudo when running docker
sudo usermod -a -G docker $(whoami)

# Install docker-compose

# get latest docker compose released tag
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)

sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod a+x /usr/local/bin/docker-compose

# Output current version
docker -v
docker-compose -v

echo "Installation Completed!"