#!/bin/bash 


echo -e "\n\nexecute in container shell"
sudo -i

cd /opt/splunk/etc/apps

echo -e "\n\ndownload the bots dataset"
wget https://botsdataset.s3.amazonaws.com/botsv3/botsv3_data_set.tgz

echo -e "\n\nuntar the file" 
tar -xvf botsv3_data_set.tgz 

echo -e "\n\nexit the shell and restart docker container"
