#!/usr/bin/env bash

set -e # Halt on Error
bundle exec htmlproofer nginx/www --disable-external
