FROM mielune/alpine-apache-arm
LABEL maintainer mielune

RUN apk update && apk upgrade && \
    printf "Build of mielune/nextcloud-arm, date: %s\n"  `date -u +"%Y-%m-%dT%H:%M:%SZ"` >> /etc/BUILD && \
    apk add php5-zip php5-zlib php5-xmlreader && \
    rm -f /var/cache/apk/* && \
    mkdir /www

COPY nextcloud.conf /etc/apache2/conf.d/nextcloud.conf

ADD https://download.nextcloud.com/server/releases/nextcloud-12.0.0.zip /www/
WORKDIR /www
RUN unzip nextcloud-12.0.0.zip && \
    mkdir /www/nextcloud/data && \
    chown -R apache:www-data /www/nextcloud && \
    rm /www/nextcloud-12.0.0.zip

VOLUME /www/nextcloud/data
VOLUME /www/nextcloud/config

CMD /usr/sbin/httpd -D NO_DETACH

