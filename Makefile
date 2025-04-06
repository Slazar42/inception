# .SILENT:

COMPOSE_PATH	=	srcs/docker-compose.yml

all: start

start:
	mkdir -p /home/slazar/data/wordpress /home/slazar/data/database
	docker compose -f $(COMPOSE_PATH) up -d --build

watch:
	docker compose -f $(COMPOSE_PATH) logs -f || true

stop:
	docker compose -f $(COMPOSE_PATH) stop

down:
	docker compose -f $(COMPOSE_PATH) down

clean: down
	rm -rf /home/slazar/
	docker compose -f $(COMPOSE_PATH) rm

fclean: clean
	docker compose -f $(COMPOSE_PATH) down -v

wipe: fclean
	docker system prune -af --volumes

re: restart

restart: wipe start