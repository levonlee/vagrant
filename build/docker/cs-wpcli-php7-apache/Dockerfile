FROM wordpress:4.9.5-php7.2-apache
ARG DEBIAN_FRONTEND=noninteractive

# Install requirements for wp-cli support
RUN set -ex; \
  \
  apt-get update && apt-get install -y \
  sudo less mysql-client \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add WP-CLI
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY wp-su.sh /bin/wp
RUN chmod +x /bin/wp-cli.phar
