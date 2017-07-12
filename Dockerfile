FROM resin/rpi-raspbian

RUN apt-get update \
    && apt-get install oracle-java8-jdk -y \
    && apt-get install wget -y \ 
    && wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.1-01-unix.tar.gz -O /tmp/nexus-3.0.1-01-unix.tar.gz \
    && useradd -r -u 200 -m -c "nexus role account" -d /opt/sonatype-work -s /bin/false nexus \
    && mkdir -p /opt/sonatype/ \
    && mkdir -p /opt/sonatype-work \
    && tar -C /opt/sonatype/ -xvaf /tmp/nexus-3.0.1-01-unix.tar.gz \
    && ln -s /opt/sonatype/nexus-3.0.1-01/ /opt/sonatype/nexus \
    && rm -f /tmp/nexus-3.0.1-01-unix.tar.gz \
    && chown -Rv nexus:nexus /opt/sonatype/nexus \
    && chown -Rv nexus:nexus /opt/sonatype/nexus-3.0.1-01 \
    && chown -Rv nexus:nexus /opt/sonatype-work

VOLUME /opt/sonatype-work

WORKDIR /opt/sonatype/nexus

COPY nexus.vmoptions /opt/sonatype/nexus/bin/nexus.vmoptions

USER nexus
CMD ["/opt/sonatype/nexus/bin/nexus", "run"]
