FROM php:7.0-fpm
MAINTAINER Li Li

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql

# Enable and configure xdebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN sed -i '1 a xdebug.remote_autostart=true' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN sed -i '1 a xdebug.remote_mode=req' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN sed -i '1 a xdebug.remote_handler=dbgp' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN sed -i '1 a xdebug.remote_connect_back=1 ' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN sed -i '1 a xdebug.remote_port=9001' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN sed -i '1 a xdebug.remote_host=172.18.0.3' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN sed -i '1 a xdebug.remote_enable=1' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN apt-get install -y openssh-server
RUN dpkg-reconfigure openssh-server
ADD id_rsa /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh/id_rsa

# Drush
RUN curl http://files.drush.org/drush.phar -L -o /usr/local/bin/drush && chmod +x /usr/local/bin/drush

# Pantheon Terminus
RUN curl https://github.com/pantheon-systems/terminus/releases/download/0.11.2/terminus.phar -L -o /usr/local/bin/terminus && chmod +x /usr/local/bin/terminus
COPY pantheon_login.sh /usr/local/bin/pantheon_login
RUN chmod +x /usr/local/bin/pantheon_login
RUN /usr/local/bin/pantheon_login

VOLUME /var/www/html
