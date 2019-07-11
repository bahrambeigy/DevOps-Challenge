#!/usr/bin/env bash

sudo -i
cd /srv/prod
git pull --rebase

docker-compose build

docker-compose stop --timeout 10

docker-compose up -d
