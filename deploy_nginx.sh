#!/bin/sh

set -eu

# nginx
sudo cp -r ./nginx/conf.d /etc/nginx/conf.d
sudo nginx -s reload
