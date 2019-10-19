#!/bin/bash
#Get Docker Engine - Community for CentOS + docker compose
set -e
#Uninstall old versions
sudo yum remove docker docker-common docker-selinux docker-engine-selinux docker-engine docker-ce
#Update the packages:
sudo yum update -y

#Install the most recent Docker Community Edition package.
sudo amazon-linux-extras install docker -y
# Enable & start docker
sudo service docker start

# add current user to the docker group to avoid using sudo when running docker
#sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker $(whoami)

# Install docker-compose

# get latest docker compose released tag
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)

sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod a+x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Output current version
docker -v
docker-compose -v

echo "Installation Completed!"
