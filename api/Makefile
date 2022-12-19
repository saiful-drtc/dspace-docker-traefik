#version: 7.5

.PHONY: help start startl up pull logs restart restartl stop stoprm rm clean status ps deploy config

help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

start:	        ## Start in backgroun
	@docker-compose up -d --remove-orphans

startl:         ## Start with logs in background
	@docker-compose up -d --remove-orphans
	@docker-compose logs -f --tail="500"

up:             ## Start in foreground
	@docker-compose up

startb:
	@docker-compose up --build

startbl:
	@docker-compose up -d --build
	@docker-compose logs -f --tail="100"

pull:           ## Pull images
	@docker-compose pull

logs:           ## Show logs
	@docker-compose logs -f --tail="300"

restart:        ## Restart
	@docker-compose restart

restartl:       ## Restart with logs
	@docker-compose restart
	@docker-compose logs -f --tail="50"

restartrm:      ## Restart with remove
	@docker-compose stop
	@docker-compose rm -f
	@docker-compose up -d

stop:           ## Stop
	@docker-compose stop

stoprm:         ## Stop and remove containers
	@docker-compose stop
	@docker-compose rm -f

down:         ## Stop and remove containers
	@docker-compose stop
	@docker-compose rm -f

rm:             ## Remove containers
	@docker-compose rm

clean:          ## Clean - docker-comnpose down
	@docker-compose down

status:         ## Show status
	@docker-compose ps

ps: status      ## Show status

deploy: pull down startl  ## Deploy == ALL ops: pull images,stop and remove containers, start, print logs

config: ## Show docker-compose configured with env
	@docker-compose config

