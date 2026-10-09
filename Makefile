.PHONY: help install install-backend install-mobile backend start mobile db-generate db-migrate clean

.DEFAULT_GOAL := help

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-16s %s\n", $$1, $$2}'

install: install-backend install-mobile ## Install all dependencies

install-backend: ## Install backend dependencies
	cd backend && npm install

install-mobile: ## Install mobile dependencies
	cd mobile && npm install

backend: ## Run the API in development mode (nodemon)
	cd backend && npm run dev

start: ## Run the API in production mode
	cd backend && npm start

mobile: ## Start the Expo dev server
	cd mobile && npm start

db-generate: ## Generate a migration from schema changes
	cd backend && npx drizzle-kit generate

db-migrate: ## Apply migrations to the database
	cd backend && npx drizzle-kit migrate

clean: ## Remove node_modules and Expo caches
	rm -rf backend/node_modules mobile/node_modules mobile/.expo
