FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y curl ca-certificates supervisor && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY xray .
COPY geoip.dat .
COPY geosite.dat .
COPY config.json .
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN chmod +x ./xray

EXPOSE 3000

CMD ["/usr/bin/supervisord"]
