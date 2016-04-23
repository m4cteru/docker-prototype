#https://github.com/tcnksm/dockerfile-rbenv/blob/master/Dockerfile
FROM debian:jessie

MAINTAINER tcnksm "https://github.com/tcnksm"

ENV ZABBIX_VERSION="3.0"

RUN wget http://repo.zabbix.com/zabbix/3.0/debian/pool/main/z/zabbix-release/zabbix-release_3.0-1+jessie_all.deb \
    && dpkg -i zabbix-release_3.0-1+jessie_all.deb \
    && apt-get update \
    && apt-get install zabbix-server-mysql zabbix-frontend-php \
    && apt-get clean

EXPOSE 80

ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
