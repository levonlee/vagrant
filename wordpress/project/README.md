

Before `vagrant up`, you need to do the following:
- `git clone` to get codes from Pantheon
- `mkdir mydbdump` and download the MySQL file from Pantheon and rename it to `pantheon_db.sql`
- Include the default `.htaccess` file in code (It's provided here)
- Modify `wp-config.php`
  - Add 
```
define('WP_HOME', 'http://192.168.33.10:8080/' );
define('WP_SITEURL', 'https://192.168.33.10:8080/');
```

Under 

```
define('SECURE_AUTH_SALT', 'put your unique phrase here');
define('LOGGED_IN_SALT',   'put your unique phrase here');
define('NONCE_SALT',       'put your unique phrase here');
```
- Modify `.git/info/exclude`, add the following lines
```
.htaccess
/mydbdump
.vagrant
```
- Tell git to assume unchanged for `wp-config.php`: `git update-index --assume-unchanged wp-config.php`
- Finally, you can `vagrant up` and run `sudo /home/vagrant/import_db.sh` and `sudo /home/vagrant/import_wp.sh` 
