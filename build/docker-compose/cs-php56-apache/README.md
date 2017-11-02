Initially it was setup to have a production server for Wordpress using PHP 5.6, MySQL and Apache

# Copy from remote dev
- git clone from remote dev
- mysql dump db on remote dev
  - make dbdump
- copy .sql from remote dev to local cs-devops/db/abc.sql
  - make dbtolocal
- copy assets folder to local dev
  - make assetstolocal
- copy setting files from remote dev
  - wp-config.php 
    - modify db credentials
    - sanitize `$_SERVER['HTTP_HOST']`
  - wp-content/advanced-cache.php
- start containers
  - docker-compose up -d
- search remote url and change them to relative paths inside wp-content
  - get_site_url(); // this has no trailing slash
- connect to local dev db localhost:9978
