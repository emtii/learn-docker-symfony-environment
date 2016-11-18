FROM php:7.0-fpm-alpine

MAINTAINER emtii <marcel.thiesies@me.com>

RUN docker-php-ext-install \
        pdo_mysql

COPY run.sh /run.sh
RUN chmod +x /run.sh

RUN echo 'Install composer'; apk add -q -U curl
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN apk del --purge -q curl
RUN rm -rf /var/cache/apk/*

CMD [ "/run.sh" ]
