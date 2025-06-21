FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY xray .
COPY geoip.dat .
COPY geosite.dat .
COPY config.json .

RUN chmod +x ./xray

EXPOSE 443

CMD ["./xray", "-c", "config.json"]
