default: start

project:=wb-www-mysql
service:=wb-www-drupal
servicedb:=wb-www-mysql
dump_name:=ecr-ms-live_lasha_2023-05-03T16-25-27_UTC_database.sql
mysql_root_pwd:=
NODE_ENV?=dev
COMMIT_HASH = $(shell git rev-parse --verify HEAD)

.PHONY: start
start: 
	docker compose up -d

.PHONY: stop
stop: 
	docker compose down

.PHONY: restart
restart: stop start

.PHONY: logs
logs: 
	docker compose logs -f ${service}

.PHONY: logs-db
logs-db: 
	docker compose logs -f ${servicedb}

.PHONY: ps
ps: 
	docker ps

.PHONY: build
build:
	docker compose build --no-cache

.PHONY: clean
clean: stop build start

.PHONY: shell
shell:
	docker exec -it ${service} sh

.PHONY: restore
restore:
	docker exec -i ${servicedb} mysql -uroot -p pantheon < ${dump_name}
