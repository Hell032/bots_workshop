#!/bin/bash 

##update everything
apt update
apt upgrade -y 

#install curl and install docker repo via dockers apt repo
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

#install docker stuff
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#permissions of docker (if necessary!)
sudo groupadd docker
sudo usermod -aG docker ${USER}

sudo reboot

#old version
#install curl and install docker via convenience script
#apt install curl
#curl -fsSL https://get.docker.com -o get-docker.sh
#sh get-docker.sh


#install splunk enterprise -> change password for accessing the web gui
#password must be at least 8 chars otherwise splunk throws an error
docker run -d --name bots -p 8000:8000 -e SPLUNK_START_ARGS='--accept-license' -e SPLUNK_PASSWORD='testtest123' splunk/splunk:latest

docker exec -it bots /bin/bash 

#execute in container shell
sudo -i

cd /opt/splunk/etc/apps

#download the bots dataset
wget https://botsdataset.s3.amazonaws.com/botsv3/botsv3_data_set.tgz

#untar the file 
tar -xvf botsv3_data_set.tgz 

#exit the shell and restart docker container
docker restart bots


