FROM alpine:latest

# Install curl + ca-certificates
RUN apk add --no-cache curl ca-certificates

# Set working directory
WORKDIR /app

# Use env PORT from Railway
ENV PORT=3000

# Copy files into container
COPY xray .
COPY geoip.dat .
COPY geosite.dat .
COPY config.json .

# Make binary executable
RUN chmod +x ./xray

# Expose port 443 for TLS traffic
EXPOSE 443

# Run Xray
CMD ["./xray", "-c", "./config.json"]
