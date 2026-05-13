FROM alpine:3.20

WORKDIR /app

RUN apk add --no-cache curl unzip ca-certificates \
 && curl -fsSL https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -o /tmp/xray.zip \
 && unzip -q /tmp/xray.zip xray -d /tmp \
 && mv /tmp/xray /usr/local/bin/xray \
 && chmod +x /usr/local/bin/xray \
 && rm -f /tmp/xray.zip

COPY config.json /app/config.json
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
