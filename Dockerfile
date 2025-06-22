FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY xray .
COPY geoip.dat .
COPY geosite.dat .
COPY config.json .
COPY start.sh .

RUN chmod +x ./xray ./start.sh

EXPOSE 3000

CMD ["./start.sh"]
