VOLUME_WP = ~/data/wordpress
VOLUME_DB = ~/data/mariadb
VOLUME_DATA = ~/data
VOLUME_MKDIR_SCRIPT = ./srcs/requirements/wordpress/tools/dir.sh
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yaml
all:
	@bash $(VOLUME_MKDIR_SCRIPT)
	@docker-compose -f ${DOCKER_COMPOSE_FILE} up -d

build:
	@bash $(VOLUME_MKDIR_SCRIPT)
	@docker-compose -f ${DOCKER_COMPOSE_FILE} up -d --build

debug:
	@bash $(VOLUME_MKDIR_SCRIPT)
	@docker-compose -f ${DOCKER_COMPOSE_FILE} up --build

down:
	@docker-compose -f ${DOCKER_COMPOSE_FILE} down

re: down
	@docker-compose -f ${DOCKER_COMPOSE_FILE} up -d --build

clean: down
	@docker system prune -a
	@sudo rm -rf $(VOLUME_WP)/*
	@sudo rm -rf $(VOLUME_DB)/*
	@sudo rm -rf $(VOLUME_DATA)

fclean:
	if [ -z "$(shell docker ps -q)" ]; then echo "No container running"; else docker stop $$(docker ps -qa); fi
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf $(VOLUME_WP)/*
	@sudo rm -rf $(VOLUME_DB)/*
	@sudo rm -rf $(VOLUME_DATA)

.PHONY	: all build debug down re clean fclean