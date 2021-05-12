FROM php:fpm as base

ARG WORKFOLDER

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN apt-get update && apt-get install -y libicu-dev \
    wget \
    git \
    libzip-dev \
    zip \
    && docker-php-ext-configure intl \
    && docker-php-ext-install pdo pdo_mysql zip intl \
    && pecl install xdebug && docker-php-ext-enable xdebug

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Symfony CLI
RUN wget https://get.symfony.com/cli/installer -O - | bash && \
    mv /root/.symfony/bin/symfony /usr/local/bin/symfony

RUN mkdir -p /var/www/sfp \
    && chown -R www-data /tmp/ \
    && mkdir -p \
       /var/www/sfp/var/cache \
       /var/www/sfp/var/logs \
       /var/www/sfp/var/sessions \
    && chown -R www-data /var/www/sfp/var

WORKDIR /var/www/sfp

COPY --chown=www-data:www-data . ./