#!/bin/bash 

echo -e "\n\ninstall splunk enterprise -> change password for accessing the web gui"
#password must be at least 8 chars otherwise splunk throws an error
docker run -d --name bots -p 8000:8000 -e SPLUNK_START_ARGS='--accept-license' -e SPLUNK_PASSWORD='testtest123' splunk/splunk:latest

docker exec -i bots /bin/bash < install_dataset.sh

docker restart bots
