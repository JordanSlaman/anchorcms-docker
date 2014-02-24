# anchorcms-docker

A Dockerfile that sets up a LEMP stack running AnchorCMS

Modified from Eugene Ware's docker-wordpress-nginx script: https://github.com/eugeneware/docker-wordpress-nginx/

## Installation
```
git clone https://github.com/JordanSlaman/anchorcms-docker.git
cd anchorcms-docker
sudo docker build -t="anchorcms-docker" .
```

## Setup
Run the container and get a shell.
```
sudo docker run -p=80:80 -i -t anchorcms-docker /bin/bash
```
run the setup script:
```
./setup.sh
```
The third and fourth lines output the mysql passwords, they are also written to text files: '/mysql-root-pw.txt' and '/anchor-db-pw.txt' respectively.

Make note of the mysql passwords and open another shell.
Commit your 'set-up' container to it's new home:

find the ID with docker ps
```
sudo docker ps
```
commit it to a new name
```
sudo docker commit --run="{"Cmd": ["/usr/local/bin/supervisord", "-n"]}" $ID myblogname
```
You can then exit your running shells, anchor should be ready for use.


## Run the container
```
sudo docker run -d myblogname
```

