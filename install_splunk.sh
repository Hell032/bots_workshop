
echo -e "\n\ninstall splunk enterprise -> change password for accessing the web gui"
#password must be at least 8 chars otherwise splunk throws an error
docker run -d --name bots -p 8000:8000 -e SPLUNK_START_ARGS='--accept-license' -e SPLUNK_PASSWORD='testtest123' splunk/splunk:latest

docker exec -it bots /bin/bash 

echo -e "\n\nexecute in container shell"
sudo -i

cd /opt/splunk/etc/apps

echo -e "\n\ndownload the bots dataset"
wget https://botsdataset.s3.amazonaws.com/botsv3/botsv3_data_set.tgz

echo -e "\n\nuntar the file" 
tar -xvf botsv3_data_set.tgz 

echo -e "\n\nexit the shell and restart docker container"
docker restart bots
