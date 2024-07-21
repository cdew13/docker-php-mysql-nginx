# Makefile for Docker Nginx PHP MySQL

# Include environment variables from the example .env file
include docker/.env

# Directory for database dumps
MYSQL_DUMPS_DIR=docker/data/db/dumps

.PHONY: help build up start down destroy stop restart logs logs-app ps exec-app

help:  ## Show help message with a list of available commands
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-30s\033[0m %s\n", $$1, $$2}'

build:  ## Build containers specified in the docker-compose.yml file located in the docker directory
	@docker-compose -f docker/docker-compose.yml build $(c)

up:  ## Start the containers in detached mode
	@docker-compose -f docker/docker-compose.yml up -d $(c)

start:  ## Start already existing containers
	@docker-compose -f docker/docker-compose.yml start $(c)

down:  ## Stop and remove the containers
	@docker-compose -f docker/docker-compose.yml down $(c)

destroy:  ## Stop and remove the containers along with their volumes
	@docker-compose -f docker/docker-compose.yml down -v $(c)

stop:  ## Stop the containers
	@docker-compose -f docker/docker-compose.yml stop $(c)

restart:  ## Restart the containers
	@docker-compose -f docker/docker-compose.yml stop $(c)
	@docker-compose -f docker/docker-compose.yml up -d $(c)

logs:  ## Show logs of all containers
	@docker-compose -f docker/docker-compose.yml logs --tail=100 -f $(c)

logs-app:  ## Show logs of the PHP container
	@docker-compose -f docker/docker-compose.yml logs --tail=100 -f php

ps:  ## Show the status of all containers
	@docker-compose -f docker/docker-compose.yml ps

exec-app:  ## Execute a command in the PHP container
	@docker-compose -f docker/docker-compose.yml exec -it php /bin/bash

mysql-dump:  ## Create a backup of the databases
	@mkdir -p $(MYSQL_DUMPS_DIR)
	@docker exec $(shell docker-compose -f docker/docker-compose.yml ps -q mysqldb) mysqldump --all-databases -u"$(MYSQL_ROOT_USER)" -p"$(MYSQL_ROOT_PASSWORD)" > $(MYSQL_DUMPS_DIR)/db.sql 2>/dev/null

mysql-restore:  ## Restore the databases from a backup
	@docker exec -i $(shell docker-compose -f docker/docker-compose.yml ps -q mysqldb) mysql -u"$(MYSQL_ROOT_USER)" -p"$(MYSQL_ROOT_PASSWORD)" < $(MYSQL_DUMPS_DIR)/db.sql 2>/dev/null