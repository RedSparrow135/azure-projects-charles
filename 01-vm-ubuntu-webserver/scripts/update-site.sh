#!/bin/bash

WEB_DIR="/var/www/html"
REPO_DIR="/var/www/repo"
REPO_URL="https://github.com/RedSparrow135/azure-projects-charles.git"
PROJECT_PATH="01-vm-ubuntu-webserver/azure-web-demo"

if [ "$EUID" -ne 0 ]; then
  echo "Ejecuta este script como root o con sudo."
  exit 1
fi

if ! command -v git &> /dev/null; then
  apt-get update -y && apt-get install -y git
fi

if [ ! -d "$REPO_DIR/.git" ]; then
  git clone "$REPO_URL" "$REPO_DIR"
fi

cd "$REPO_DIR" || exit
git fetch origin main > /dev/null 2>&1

LOCAL_HASH=$(git rev-parse HEAD)
REMOTE_HASH=$(git rev-parse origin/main)

if [ "$LOCAL_HASH" != "$REMOTE_HASH" ]; then
  git pull origin main
  rm -rf "$WEB_DIR"/*
  cp -r "$REPO_DIR/$PROJECT_PATH"/* "$WEB_DIR"
  chown -R www-data:www-data "$WEB_DIR"
  chmod -R 755 "$WEB_DIR"
  systemctl reload nginx
  echo "Sitio actualizado correctamente."
else
  echo "No hay cambios nuevos."
fi
