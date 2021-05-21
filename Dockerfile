FROM alpine:latest

RUN apk update

RUN addgroup -S actix && adduser -S actix -G actix
USER actix:actix

ENV PATH=$PATH:/home/actix/bin
WORKDIR /home/actix

COPY ./sn_httpd /home/actix/bin/sn_httpd
COPY ./static /home/actix/static

USER root:root
RUN chmod +x /home/actix/bin/sn_httpd

VOLUME ["/tmp"]

ENTRYPOINT ["sn_httpd","0.0.0.0:8080","static"]
EXPOSE 8080
