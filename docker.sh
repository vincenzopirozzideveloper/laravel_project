#!/bin/bash

# Script per gestire i container Docker per il progetto Laravel

# Variabili
COMPOSE_FILE=docker-compose.yml
PROJECT_NAME=laravel_project

# Funzioni
build() {
    echo "Building Docker images..."
    docker-compose -f $COMPOSE_FILE -p $PROJECT_NAME build
}

up() {
    echo "Starting Docker containers..."
    docker-compose -f $COMPOSE_FILE -p $PROJECT_NAME up
}

down() {
    echo "Stopping Docker containers..."
    docker-compose -f $COMPOSE_FILE -p $PROJECT_NAME down
}

restart() {
    echo "Restarting Docker containers..."
    down
    up
}

logs() {
    echo "Showing logs for Docker containers..."
    docker-compose -f $COMPOSE_FILE -p $PROJECT_NAME logs -f
}

bash() {
    echo "Accessing the app container bash shell..."
    docker-compose -f $COMPOSE_FILE -p $PROJECT_NAME exec app bash
}

# Menu
case "$1" in
    build)
        build
        ;;
    up)
        up
        ;;
    down)
        down
        ;;
    restart)
        restart
        ;;
    logs)
        logs
        ;;
    bash)
        bash
        ;;
    *)
        echo "Usage: $0 {build|up|down|restart|logs|bash}"
        exit 1
esac
