FROM phusion/baseimage:0.9.18

MAINTAINER Li Li

RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

# Use phusion/baseimage's init system.
CMD ["/sbin/my_init"]

# Upgrade OS
# --force-confold: don't overwrite old conf files
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

# PHP
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
        php-pear        \
        php5-cli        \
        php5-common     \
        php5-curl       \
        php5-dev        \
        php5-fpm        \
        php5-gd         \
        php5-imagick    \
        php5-imap       \
        php5-intl       \
        php5-json       \
        php5-ldap       \
        php5-mcrypt     \
        php5-memcache   \
        php5-mysql      \
        php5-redis      \
        php5-sqlite     \
        php5-tidy       \
        php5-xdebug     \
        php5-xhprof
RUN service php5-fpm stop

# Clean up APT when done. phusion/baseimage
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

