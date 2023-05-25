LOGIN = dicisner
VOLUME_DIR = /home/$(LOGIN)/data

ifeq ($(shell uname -s),Darwin)
VOLUME_DIR = /Users/diego/data
endif

VOLUMEN_PATH_WP = $(VOLUME_DIR)/wordpress_data
VOLUMEN_PATH_MYSQL = $(VOLUME_DIR)/db_data

all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@docker compose -f ./srcs/docker-compose.yml down --volumes
	rm -rf $(VOLUMEN_PATH_WP)/*
	rm -rf $(VOLUMEN_PATH_MYSQL)/*

setup:
	mkdir -p $(VOLUME_DIR)
	mkdir -p $(VOLUMEN_PATH_WP)
	mkdir -p $(VOLUMEN_PATH_MYSQL)
	grep $(LOGIN).42.fr /etc/hosts || echo "\n127.0.0.1 $(LOGIN).42.fr" >> /etc/hosts
	grep VOLUME_DIR srcs/.env || echo "\nVOLUME_DIR=$(VOLUME_DIR)" >> srcs/.env
