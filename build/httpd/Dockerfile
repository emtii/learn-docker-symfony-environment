FROM httpd:alpine

MAINTAINER emtii <marcel.thiesies@me.com>

# install open ssl
RUN DEBIAN_FRONTEND=noninteractive apk update -q \
    && DEBIAN_FRONTEND=noninteractive apk add openssl

# custom config
ADD ./my-httpd.conf /usr/local/apache2/conf/httpd.conf
ADD run.sh /usr/bin/run
RUN chmod +x /usr/bin/run

ENV APP_DIR '/var/www/html'
ENV SSL_COUNTRY 'DE'
ENV SSL_STATE 'BERLIN'
ENV SSL_CITY 'BERLIN'
ENV SSL_COMPANY 'emtii'
ENV SSL_HOST 'emtii.local'

EXPOSE 80 443

CMD ["/bin/bash", "/usr/bin/run"]