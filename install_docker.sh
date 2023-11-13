#!/bin/bash 

#echo "\n\nupdate everything"
#apt update
#apt upgrade -y 

echo -e "\n\ninstall curl and install docker repo via dockers apt repo"
echo "Add Docker's official GPG key..."
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg


echo -e "\n\nAdd the repository to Apt sources..."
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update


echo -e "\n\ninstall docker stuff..."
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


echo -e "\n\nadd correct permissions to docker user..."
sudo groupadd docker
sudo usermod -aG docker ${USER}

#echo -e "\n\nreboot...bye"
#sudo reboot

