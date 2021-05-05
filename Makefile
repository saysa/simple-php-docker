# Constants
DOCKER_COMPOSE = docker-compose
DOCKER = docker

## Environments
ENV_PHP = $(DOCKER) exec sfp_php-fpm

# Tools
COMPOSER = $(ENV_PHP) symfony composer
SYMFONY = $(ENV_PHP) symfony

# Main
start: docker-compose.yml
	$(DOCKER_COMPOSE) build --no-cache
	$(DOCKER_COMPOSE) up -d --build --remove-orphans --force-recreate
	make install
	make cache-clear

restart: docker-compose.yml
	$(DOCKER_COMPOSE) up -d --build --remove-orphans --no-recreate
	make install
	make cache-clear

stop: docker-compose.yml
	$(DOCKER_COMPOSE) stop

install: composer.json
	$(COMPOSER) install -a -o
	$(COMPOSER) clear-cache
	$(COMPOSER) dump-autoload --optimize --classmap-authoritative

cache-clear: var/cache
	$(ENV_PHP) rm -rf ./var/cache/*

router: config/routes
	$(SYMFONY) console debug:router