FROM mielune/alpine-apache-arm

ADD nextcloud-12.0.0.zip /var/www/

COPY nextcloud.conf /etc/apache2/conf.d/nextcloud.conf

WORKDIR /var/www
RUN apk --update add php5-zip php5-zlib php5-xmlreader \
    && rm -f /var/cache/apk/* \
    && unzip -q nextcloud-12.0.0.zip && rm nextcloud-12.0.0.zip && chown -R apache:apache nextcloud \
    && mv /var/www/nextcloud/config / \
    && mkdir /data \
    && ln -s /config /var/www/nextcloud/ \
    && ln -s /data /var/www/nextcloud/data \
    && chown apache:apache /data /config

VOLUME /data
VOLUME /config
CMD httpd
