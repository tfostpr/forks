FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor zip unzip wget && \
    wget -O Xray-linux-64.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    wget -O speeder https://cdn.jsdelivr.net/gh/FourthInternational/forks@master/net_speeder && \
    unzip Xray-linux-64.zip && \
    chmod +x /xray && \
    rm -rf /var/cache/apk/*https://cdn.jsdelivr.net/gh/FourthInternational/forks@master/net_speeder

ADD speeder spd
ADD start.sh /start.sh
RUN chmod +x /start.sh && chmod +x spd

CMD /start.sh
