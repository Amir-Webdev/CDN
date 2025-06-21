FROM alpine:latest

RUN apk add --no-cache curl ca-certificates

WORKDIR /app

COPY xray .
COPY geoip.dat .
COPY geosite.dat .
COPY config.json .

RUN chmod +x ./xray

# Optional: Document internal port for humans
EXPOSE 3000

CMD ["./xray", "-c", "./config.json"]
