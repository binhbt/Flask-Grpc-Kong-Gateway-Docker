FROM kong:1.4.0-ubuntu
ENV KONG_PLUGINS bundled, jwt-claims-headers, http-to-https-redirect, grpc-gateway

#For grpc-gateway plugin
RUN apt-get update 
RUN apt-get install -y python3-pip
RUN pip3 install lua-protobuf

RUN luarocks install kong-plugin-jwt-claims-to-headers
# RUN luarocks install kong-plugin-http-to-https-redirect
RUN USER=root luarocks install https://github.com/binhbt/kong-plugin-jwt-claims-headers/raw/master/kong-plugin-jwt-claims-headers-1.0-2.all.rock
RUN USER=root luarocks install https://github.com/binhbt/kong-http-to-https-redirect/raw/master/kong-plugin-http-to-https-redirect-1.0-0.all.rock
RUN USER=root luarocks install https://github.com/binhbt/kong-plugin-grpc-gateway/raw/master/kong-plugin-grpc-gateway-0.1.3-1.all.rock

COPY kong/protos /etc/kong/protos

COPY kong/entrypoint.sh /entrypoint.sh

COPY kong/kong.conf.default /etc/kong/kong.conf
RUN mkdir -p /tmp
VOLUME ["/tmp"]
# ENTRYPOINT ["bash", "/entrypoint.sh"]
COPY kong/checklog.sh /usr/local/bin/checklog
COPY kong/cron.sh /cron.sh
CMD /cron.sh
CMD ["kong", "docker-start"]
