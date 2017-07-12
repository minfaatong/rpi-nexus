# rpi-nexus => base image: resin/rpi-raspbian
Nexus Repository Manager OSS 3.xx on Raspberry pi with docker

Only tested on Raspberry Pi 2
```
docker run -d --name nexus-data paperinik/rpi-nexus echo "data-only container for Nexus"
docker run -d -p 8081:8081 --name nexus --restart=always -v /media/usbraid/docker/nexus-data:/opt/sonatype/nexus paperinik/rpi-nexus
```
