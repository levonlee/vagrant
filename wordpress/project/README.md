Before `vagrant up`, you need to do the following:
- `git clone` to get codes from Pantheon
- `mkdir mydbdump` and download the MySQL file from Pantheon and rename it to `pantheon_db.sql`
- Include the default `.htaccess` file in code (It's provided here)
- Add `wp-config-local.php`. Pantheon will .gitignore
- Modify `.git/info/exclude`, add the following lines
```
.htaccess
/mydbdump
.vagrant
```
- `vagrant up` and run `sudo /home/vagrant/import_db.sh` and `sudo /home/vagrant/start_wp.sh` 
- After starting Wordpress Docker container, the following files will be changed. Just ignore those changes and include `wp-config-local.php`
- `git update-index --assume-unchanged wp-config.php`
- `git update-index --assume-unchanged wp-config-sample.php`

Docker Configuration
wordpressdb maps /tmp/mydbdump to /vagrant/mydbdump
