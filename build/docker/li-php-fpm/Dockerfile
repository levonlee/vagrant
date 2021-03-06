FROM php:7.2-fpm
MAINTAINER Li Li

ARG DEBIAN_FRONTEND=noninteractive

# change from libpng12-dev to libpng-dev after php:7.0-fpm
RUN apt-get update && apt-get install -y \
        apt-utils \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql pcntl zip

# mycrypt extension is not provided with PHP source since 7.2, use pecl to install
RUN pecl install mcrypt-1.0.2
RUN docker-php-ext-enable mcrypt

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

# Install mariadb client and Git
# (mysql command required for drush e.g. 'drush sqlc')
RUN apt-get -y --no-install-recommends install mariadb-client git

# Composer
RUN curl -sS -L https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV PATH="/root/.composer/vendor/bin:$PATH"

# Drush
RUN composer global require drush/drush

# Pantheon Terminus
# https://github.com/pantheon-systems/terminus

# v. 0.11
# RUN composer global require pantheon-systems/terminus

# v. 1.x
RUN curl -O https://raw.githubusercontent.com/pantheon-systems/terminus-installer/master/builds/installer.phar && php installer.phar install --install-dir=/usr/local/bin

COPY pantheon_login.sh /usr/local/bin/pantheon_login
RUN chmod +x /usr/local/bin/pantheon_login
RUN /usr/local/bin/pantheon_login

VOLUME /var/www/html
