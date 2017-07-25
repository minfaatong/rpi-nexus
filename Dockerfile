FROM paperinik/rpi-java8

RUN apt-get update && apt-get install -y wget \
    && mkdir -p /opt/sonatype/ \
    && mkdir -p /opt/sonatype-work \
    && wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.1-01-unix.tar.gz && tar -xzf /nexus-3.0.1-01-unix.tar.gz && rm /nexus-3.0.1-01-unix.tar.gz \
    && mv /nexus-3.0.1-01 /opt/sonatype/nexus \
    && useradd -r -u 200 -m -c "nexus role account" -d /opt/sonatype-work -s /bin/false nexus \
    && chown -Rv nexus:nexus /opt/sonatype/nexus  \
    && chown -Rv nexus:nexus /opt/sonatype-work \
    && apt-get purge --auto-remove wget \
    && rm -rf /var/lib/apt/lists/*


VOLUME /opt/sonatype-work

WORKDIR /opt/sonatype/nexus

COPY nexus.vmoptions /opt/sonatype/nexus/bin/nexus.vmoptions

USER nexus
CMD ["/opt/sonatype/nexus/bin/nexus", "run"]
