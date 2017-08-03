FROM resin/rpi-raspbian
MAINTAINER Bruno Cardoso Cantisano <bruno.cantisano@gmail.com>

LABEL version latest
LABEL description Sonatype Nexus Repository Container

ENV NEXUS_VERSION 3.0.1-01

RUN cd /tmp \
    && apt-get clean \
    && apt-get update \
    && apt-get install -y wget oracle-java8-jdk \
    && wget -O /tmp/nexus-${NEXUS_VERSION}-unix.tar.gz https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-${NEXUS_VERSION}-unix.tar.gz \
    && tar -zxf /tmp/nexus-${NEXUS_VERSION}-unix.tar.gz -C /usr/local \
    && mv /usr/local/nexus-${NEXUS_VERSION}* /usr/local/nexus \
    && rm -f /tmp/nexus-${NEXUS_VERSION}-unix.tar.gz \
    && useradd -m nexus \
    && chown -R nexus /usr/local/nexus \
    && apt-get purge --auto-remove wget \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/jdk-8-oracle-arm32-vfp-hflt
#COPY nexus.vmoptions /usr/local/nexus/bin/nexus.vmoptions

EXPOSE 8081

VOLUME /usr/local/nexus/data

WORKDIR /usr/local/nexus/bin

USER nexus

CMD ["./nexus", "run"]
