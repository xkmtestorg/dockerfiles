FROM debian:trixie

RUN apt update && \
    apt install -y sudo wget curl && \
    curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash && \
    apt install -y speedtest

ENTRYPOINT ["/usr/bin/speedtest"]

