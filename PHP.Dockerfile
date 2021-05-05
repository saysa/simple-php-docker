FROM php:fpm-alpine as base

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN docker-php-ext-install pdo pdo_mysql \
    && apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug && docker-php-ext-enable xdebug

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer