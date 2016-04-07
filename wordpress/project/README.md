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
- Finally, you can `vagrant up` and run `sudo /home/vagrant/import_db.sh` and `sudo /home/vagrant/import_wp.sh` 

Docker Configuration
wordpressdb maps /tmp/mydbdump to /vagrant/mydbdump
