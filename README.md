# simple-php-docker

- `docker-compose down --volumes`
- `docker-compose up -d`
- `docker exec -it sfp_php-fpm bash`
- `composer update`
- `sudo chmod -R 777 var/`

## Rebuild PHP

After each PHP Dockerfile update, run `docker-compose build` to rebuild the image.
Then restart the server with `docker-compose up -d`

## Symfony CLI tool

`docker exec sfp_php-fpm symfony`

