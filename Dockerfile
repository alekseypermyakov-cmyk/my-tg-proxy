FROM alpine:3.20

WORKDIR /app

RUN apk add --no-cache curl unzip ca-certificates \
 && curl -fsSL https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -o /tmp/xray.zip \
 && unzip -q /tmp/xray.zip xray -d /tmp \
 && mv /tmp/xray /usr/local/bin/xray \
 && chmod +x /usr/local/bin/xray \
 && rm -f /tmp/xray.zip

COPY config.json /app/config.json

CMD ["sh", "-c", "PORT=${PORT:-10000}; sed \"s/\\\"port\\\": 10000/\\\"port\\\": ${PORT}/\" /app/config.json > /app/config.runtime.json; exec /usr/local/bin/xray run -c /app/config.runtime.json"]
