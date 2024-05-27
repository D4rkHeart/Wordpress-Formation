.PHONY: up stop backup config

.env:
	cp .env.example .env

# Lancer le projet
up: 
	sudo docker-compose up -d

stop:
	sudo docker-compose down

config:
	sudo apt install docker
	sudo apt install docker-compose

