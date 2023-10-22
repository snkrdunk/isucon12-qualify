#!/bin/sh

set -eu

# nginx
sudo cp -r ./nginx/conf.d /etc/nginx
sudo nginx -s reload
