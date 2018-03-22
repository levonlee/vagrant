FROM php:5.6.31-apache-jessie
ARG DEBIAN_FRONTEND=noninteractive

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
            libtidy-dev \
            libbz2-dev \
            libicu-dev \
            libpspell-dev \
            aspell-en \
            libxslt-dev \
            sendmail \            
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    \
    docker-php-ext-install -j$(nproc) calendar bcmath tidy bz2 intl gettext pspell iconv mcrypt sockets && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd mysqli mysql pdo pdo_mysql pcntl exif zip xmlrpc xsl opcache

# may need to also install sendmail-bin mailutils

# default image has these php modules:
# pcre curl libedit openssl zlib
# these extra are enabled:
# zlib ftp mbstring mysqlnd

# php by default should have these extensions enabled
# date ereg libxml pcre sqlite3 ctype dom fileinfo filter hash json SPL PDO session posix Reflection standard SimpleXML pdo_sqlite Phar tokenizer xml xmlreader xmlwriter

# extention apache2handler is installed by Apache2

# extention mysql is deprecated in PHP 5.5.0 removed in 7

# https://github.com/Chialab/docker-php
# https://github.com/docker-library/php/issues/75

# Other modules might need to add
# imap:
# RUN apt install -y libc-client-dev libkrb5-dev
# RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
# RUN docker-php-ext-install imaplibc-client-dev libkrb5-dev (configure: --with-kerberos --with-imap-ssl)

# extensions are not going to be included
# pgsql (PDO_PGSQL)
# pdo_sqlite
# cgi-fcgi
# htscanner (useful for IIS, lighttpd)
# mhash https://github.com/docker-library/php/issues/439
# ionCube Loader and Zend Guard Loader
# homeloader (to load PEAR repositories)

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
