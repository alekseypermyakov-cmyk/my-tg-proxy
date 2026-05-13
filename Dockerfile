FROM ghcr.io/xtls/xray-core:latest
WORKDIR /app
COPY config.json /app/config.json
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
CMD ["/app/start.sh"]
