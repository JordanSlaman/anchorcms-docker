# anchorcms-docker

A Dockerfile that sets up a LEMP stack running AnchorCMS

Modified from Eugene Ware's docker-wordpress-nginx script: https://github.com/eugeneware/docker-wordpress-nginx/

## Installation
'''
git clone https://github.com/JordanSlaman/anchorcms-docker.git
cd anchorcms-docker
sudo docker build -t="anchorcms-docker" .
'''

## Usage
Run the container:
'''
sudo docker run -p=80:80 -d anchorcms-docker /bin/bash /start.sh
'''

Stopping the container:
find the ID with 'sudo docker ps'
run 'sudo docker stop $ID'

Modifying the container:
'''
docker run -p=80:80 -i -t anchorcms-docker /bin/bash
'''

MySQL root password is located in a text file in '/mysql-root-pw.txt' after start runs.