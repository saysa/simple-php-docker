# simple-php-docker

- `docker-compose down --volumes`
- `docker-compose up -d`

## Rebuild PHP

After each PHP Dockerfile update, run `docker-compose build` to rebuild the image.
Then restart the server with `docker-compose up -d`

## Composer

`docker exec simple-php-docker_php_1 composer`

