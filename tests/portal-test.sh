#!/usr/bin/env bash

set -e # Halt on Error
bundle exec htmlproofer nginx/www --disable-external

#BUILD Docker Container
docker-compose --file docker-cicd.yaml build 
docker-compose --file docker-cicd.yaml up

#Test Enpoint with CURL

#TEAR DOWN Container
docker-compose --file docker-cicd.yaml down