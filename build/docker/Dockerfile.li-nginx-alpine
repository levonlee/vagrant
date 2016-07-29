FROM nginx:1.10-alpine
MAINTAINER Li Li

# Require li-nginx-alpine.conf in this directory to overwrite default.conf
RUN mkdir -p /var/www/html
WORKDIR /var/www.html
COPY li-nginx-alpine.conf /etc/nginx/conf.d/default.conf
