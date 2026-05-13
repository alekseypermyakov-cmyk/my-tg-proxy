#!/bin/sh
set -eu
PORT="${PORT:-10000}"
sed "s/"port": 10000/"port": ${PORT}/" /app/config.json > /app/config.runtime.json
exec /usr/local/bin/xray run -c /app/config.runtime.json
