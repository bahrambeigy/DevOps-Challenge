#!/usr/bin/env bash

sudo -i
cd /srv
git pull --rebase

docker-compose stop --timeout 10

docker-compose build

docker-compose up -d
