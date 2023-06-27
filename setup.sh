
##update everything
RUN apt update
RUN apt upgrade -y 

#install curl and install docker via convenience script
RUN apt install curl
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh

#install splunk enterprise -> change password for accessing the web gui
#password must be at least 8 chars otherwise splunk throws an error
RUN docker run -d --name bots -p 8000:8000 -e SPLUNK_START_ARGS='--accept-license' -e SPLUNK_PASSWORD='testtest123' splunk/splunk:latest

RUN docker exec -it bots /bin/bash 

#execute in container shell
RUN sudo -i

RUN cd /opt/splunk/etc/apps

#download the bots dataset
RUN wget https://botsdataset.s3.amazonaws.com/botsv3/botsv3_data_set.tgz

#untar the file 
RUN tar -xvf botsv3_data_set.tgz 

#exit the shell and restart docker container
RUN docker restart bots


