# Magic Makefile Help
.PHONY: help
help:
	@cat $(MAKEFILE_LIST) | grep -e "^[a-zA-Z_\-]*: *.*## *" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# Docker Compose Tasks
# --------------------

start: ## Start a docker-compose stack
	docker-compose -f docker-compose-$(task).yml up --force-recreate -d

stop: ## Automatically stop all docker-compose instances
	docker-compose -f docker-compose-$(task).yml down -v --remove-orphans

start-sql: ## Start a SQLPad instance at port 3000
	$(MAKE) start task=sql
	@echo "Access the SQLPad GUI by visiting http://localhost:3000"
	@echo "Please wait ~30 seconds for the Postgres Database to spin up!"

stop-sql: ## Stop a SQLPad instance
	$(MAKE) stop task=sql

start-rstudio: ## Start an R Studio instance at port 8787 and SQLPad at 3000
	$(MAKE) start task=rstudio
	@echo "Access the SQLPad GUI by visiting http://localhost:3000"
	@echo "Access the R Studio by visiting http://localhost:8787"
	@echo "The R/ folder is mounted to this session!"

stop-rstudio: ## Stop an R Studio instance
	$(MAKE) stop task=rstudio

start-jupyter: ## Start a Jupyter instance at port 8888 and SQLPad at 3000
	$(MAKE) start task=jupyter
	@echo "Access the SQLPad GUI by visiting http://localhost:3000"
	@echo "Access Jupyter by visiting http://localhost:8888"
	@echo "The Python/ folder is mounted to this session!"

stop-jupyter: ## Stop a Jupyter instance
	$(MAKE) stop task=jupyter

# GitHub Pages Local Server
# -------------------------

serve: ## Serve website using Jekyll Docker at port 4000
	docker run -it --rm -v "$(PWD)/docs":/usr/src/app -p 4000:4000 -it starefossen/github-pages