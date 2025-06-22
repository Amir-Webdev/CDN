#!/bin/sh

# Run a dummy HTTP server on port 80
python3 -m http.server 80 &

# Start xray as intended
./xray -c config.json
