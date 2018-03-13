FROM php:5.6.31-apache-jessie

# apt-utils has to be installed to avoid throwing errors during installation on Debian
RUN set -ex; \
    \
    apt-get update && apt-get install -y \
            apt-utils \
            nano \
            libfreetype6-dev \
            libmcrypt-dev \
            libjpeg62-turbo-dev \
            libpng-dev \
            sendmail \            
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    \
    docker-php-ext-install -j$(nproc) iconv mcrypt sockets && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd mysqli mysql pdo pdo_mysql pcntl exif zip opcache

# may need to also install sendmail-bin mailutils

# default image has these php modules:
# curl libedit openssl zlib
# these are enabled:
# ftp mbstring mysqlnd

# other modules might need to add
# calendar gettext homeloader htscanner imap intl pspell tidy xmlrpc xsl Zend Guard Loader

# Additional Modules
# ionCube Loader

COPY config/php-prod.ini /usr/local/etc/php/conf.d/

RUN { \
                echo 'opcache.memory_consumption=128'; \
                echo 'opcache.interned_strings_buffer=8'; \
                echo 'opcache.max_accelerated_files=4000'; \
                echo 'opcache.revalidate_freq=2'; \
                echo 'opcache.fast_shutdown=1'; \
                echo 'opcache.enable_cli=1'; \
        } > /usr/local/etc/php/conf.d/opcache-recommended.ini

# prepare sendmail..
COPY config/prepare-sendmail.sh /prepare-sendmail.sh
RUN chmod +x /prepare-sendmail.sh
# refer to CMD in this dockerfile or command in docker-compose

# enable apache modules
RUN a2enmod rewrite expires

VOLUME /var/www/html

# TODO chown -R www-data:www-data /var/www/html

# because not every docker container instance needs sendmail
# if needed, use command in docker-compose
# CMD /prepare-sendmail.sh && apache2-foreground

CMD ["apache2-foreground"]
