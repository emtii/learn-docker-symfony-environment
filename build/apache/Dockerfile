FROM alpine:3.4

MAINTAINER Stephan Straubel <straubel@bestit-online.de>

RUN apk upgrade -U
RUN apk add ca-certificates

RUN apk add apache2 apache2-proxy apache-mod-fcgid

# configure apache
RUN sed -i -e 's/^ServerTokens OS/ServerTokens Prod/g' /etc/apache2/httpd.conf; \
    sed -i -e 's/^Listen 80/Listen 80 443/g' /etc/apache2/httpd.conf; \
    sed -i -e 's/^#LoadModule rewrite_module/LoadModule rewrite_module/g' /etc/apache2/httpd.conf; \
    sed -i -e 's/^ServerSignature On/ServerSignature Off/g' /etc/apache2/httpd.conf; \
    sed -i -e 's#^ErrorLog logs/error.log#ErrorLog /dev/stdout#g' /etc/apache2/httpd.conf; \
    sed -i -e 's/^LogLevel warn/LogLevel debug/g' /etc/apache2/httpd.conf; \
    sed -i -e 's/^LoadModule proxy_fdpass_module/#LoadModule proxy_fdpass_module/' /etc/apache2/conf.d/proxy.conf; \
    echo "IncludeOptional /etc/apache2/vhost.d/*.conf" >> /etc/apache2/httpd.conf

RUN mkdir -p /etc/apache2/vhost.d/

EXPOSE 80 443

VOLUME [ "/var/www" ]

CMD [ "httpd", "-D", "FOREGROUND" ]
