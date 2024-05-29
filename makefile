.PHONY: up down config ps

.env: config
	@if [ ! -f .env ]; then \
		cp .env.example .env; \
	fi
	@export $(cat .env | xargs)


up: 
	@echo "Démarrage des conteneurs Docker..."
	docker-compose up -d


down:
	@echo "Arrêt des conteneurs Docker..."
	docker-compose down


config:
	@echo "Installation de Docker et Docker Compose..."
	sudo apt update
	sudo apt install -y docker.io docker-compose

ps:
	@echo "Liste des conteneurs Docker..."
	docker ps
