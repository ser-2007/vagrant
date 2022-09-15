#!/bin/bash
    sudo apt-get remove docker docker-engine docker.io containerd runc
    #it checks and if there is a docker engine before remove it
    sudo apt-get update
    #update 
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    # Install packages
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    # Verify that you now have the key with the fingerprint
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    # Set up the stable repository
    sudo apt-get update
    # Update the apt package index
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    # sudo groupadd docker
    sudo gpasswd -a $USER docker    
    #Docker-Compose Install
    sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    # docker-compose --version
    sudo chmod 666 /var/run/docker.sock
    sudo service docker restart
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo apt-get install ansible
    docker run hello-world # we could try small docker container run