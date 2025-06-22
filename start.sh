#!/bin/sh

./xray -c config.json &
tail -f /dev/null
