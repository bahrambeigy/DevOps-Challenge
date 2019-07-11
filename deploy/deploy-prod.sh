#!/usr/bin/env bash

sudo -i
cd /srv/prod
git pull --rebase

docker-compose build tornado-server

docker-compose stop tornado-server

docker-compose up -d
