FROM debian:trixie-slim

ARG BUILD_DATE
ARG VERSION
LABEL build_version="Debian version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="nalf3in"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      transmission-daemon \
      transmission-cli \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /config

VOLUME /config
EXPOSE 9091 51413/tcp 51413/udp

CMD ["transmission-daemon", "-f", "--config-dir", "/config"]