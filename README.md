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

Make note of the mysql password and open another shell. - the password is also recorded to '/mysql-root-pw.txt' if you ever need to grab it again.

Commit your 'set-up' container to it's new home:

find the ID with docker ps
```
sudo docker ps
```
commit it to a new name
```
sudo docker commit $ID myblogname
```
You should then stop your previous container with it's ID
```
sudo docker stop $ID
```

## Runs the container on port 80. If hosting multiple sites use nginx/hipache/varnish/... to route different hostnames to different docker ports.
```
sudo docker run -d -p=80:80 myblogname /usr/local/bin/supervisord -n
```
This is how you'd run the containers from now on. You can now go setup anchor from the web with the mysql password ou generated in the setup stage.


Remember to commit your container to a new name 'myblog-date' before shutting it down, any changes to the database would be lost elsewise..

Feel free to fork this and make it easier to use!