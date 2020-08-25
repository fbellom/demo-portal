#!/usr/bin/env bash

set -e # Halt on Error
bundle exec htmlproofer nginx/www --disable-external

ruby -run -e httpd nginx/www -p 5000

# Testing Enpoints
STATUSCODE=$(curl -I http://localhost:5000/index.html &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE 52; then exit 0; fi
STATUSCODE=$(curl -I http://localhost:5000/index.html &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE 52; then exit 0; fi
