FROM ubuntu:16.04

COPY ./generate-cert.sh ./

RUN apt-get update \
  && apt install -y software-properties-common \
  && add-apt-repository ppa:certbot/certbot \
  && apt-get update \
  && apt-get install -y \
    python-certbot-nginx \
  && rm -rf /var/lib/apt/lists/*

RUN ln -s /generate-cert.sh /usr/local/bin/generate-cert

VOLUME /etc/letsencrypt
