FROM nginx:alpine

MAINTAINER emtii <marcel.thiesies@me.com>

# set env
ENV NGINX_SERVER_NAME emtii.local

# conf
COPY ./default.conf /etc/nginx/conf.d/default.conf

# force nginx to foreground
CMD ["nginx", "-g", "daemon off;"]