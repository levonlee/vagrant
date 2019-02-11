-  Fill up files `id_rsa` and `pantheon_login.sh`
- Build it
`docker build --rm --force-rm --no-cache -t li-php-fpm .`
- Some errors may encounter, remove the dummy image `docker rmi $(docker images -f "dangling=true" -q --no-trunc)` and run build again

Run it
- `docker run -d --name my-php-fpm li-php-fpm`
- `docker exec -it my-php-fpm bash`
    - `terminus wp site-name.live -- user list --skip-themes --skip-plugins`
