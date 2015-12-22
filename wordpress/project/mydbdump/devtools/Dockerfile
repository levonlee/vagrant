FROM php:5.6-apache

MAINTAINER Li Li

RUN apt-get update && \
        apt-get install -y vim ncurses-term && \
        curl https://github.com/pantheon-systems/cli/releases/download/0.10.0/terminus.phar -L -o /usr/local/bin/terminus && \
        chmod +x /usr/local/bin/terminus

ENV TERM=xterm-256color
