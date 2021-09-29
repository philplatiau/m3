#!/bin/bash
MOBI33=`docker network ls | grep MOBI33 -c`
if [ $MOBI33 -eq 0 ]; then
        echo "Creation network MOBI33"
        docker network create MOBI33 --subnet "172.20.0.0/24" --gateway 172.20.0.1
else
        echo "Network MOBI33 exists"
fi
docker build .
docker tag `docker images --format='{{.ID}}' | head -1` webdev_mobi33
docker-compose -f webdev.yml up -d
docker container rename `docker ps --format {{.Names}} | grep webdev` mybox
sleep 10
docker logs mybox 2>&1 | grep -A1 2/4 | grep -v 2/4
