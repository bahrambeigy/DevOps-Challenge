#!/usr/bin/env bash

sudo -i
cd /srv/dev
git pull --rebase

docker-compose build

docker-compose stop --timeout 10

docker-compose up -d
