#!/usr/bin/env bash

set -e # Halt on Error
bundle exec htmlproofer nginx/www --disable-external

#BUILD Docker Container
docker-compose --file docker-cicd --build 
docker-compose --file docker-cicd up -d

#Test Enpoint with CURL
STATUSCODE=$(curl -I http://localhost/index.html &> /dev/stderr --write-out "%{h    ttp_code}") | if test $STATUSCODE 52; then exit 0; fi
STATUSCODE=$(curl -I http://localhost/portal.html &> /dev/stderr --write-out "%{    http_code}") | if test $STATUSCODE 52; then exit 0; fi