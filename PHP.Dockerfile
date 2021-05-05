FROM php:fpm-alpine as base

RUN docker-php-ext-install pdo pdo_mysql \
    && apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug && docker-php-ext-enable xdebug