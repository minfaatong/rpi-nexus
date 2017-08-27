# Nexus

![docker_logo](https://raw.githubusercontent.com/brunocantisano/rpi-nexus/master/files/docker.png)![docker_nexus_logo](https://raw.githubusercontent.com/brunocantisano/rpi-nexus/master/files/logo-nexus.png)![docker_paperinik_logo](https://raw.githubusercontent.com/brunocantisano/rpi-nexus/master/files/docker_paperinik_120x120.png)

This Docker container implements nexus on Raspberry pi.

 * Raspbian base image: [resin/rpi-raspbian](https://hub.docker.com/r/resin/rpi-raspbian/)
 * Nexus Repository Manager OSS 3.xx
 
### Installation from [Docker registry hub](https://registry.hub.docker.com/u/paperinik/rpi-nexus/).

You can download the image with the following command:

```bash
docker pull paperinik/rpi-nexus
```

# How to use this image

Use cases
----

1) Run a container with a binded data directory:
```bash
docker run -d -p 8081:8081 --name nexus --restart=always -v /media/usbraid/docker/nexus-data:/opt/sonatype/nexus paperinik/rpi-nexus
```