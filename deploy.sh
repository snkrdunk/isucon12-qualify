#!/bin/sh

set -eu

# log rotation
sudo mv /var/log/nginx/access.log /var/log/nginx/access.log.`date +%Y%m%d%H%M%S`
sudo nginx -s reopen
sudo cp /tmp/mysql-slow.log /var/log/mysql/slowquery.log.`date +%Y%m%d%H%M%S`
# NOTE: chown root /tmp/mysql-slow.logしたら動いた
sudo truncate -s 0 /tmp/mysql-slow.log

BRANCH=${1:-main}
git fetch origin $BRANCH
git checkout $BRANCH

sudo systemctl daemon-reload
sudo systemctl restart isuports.service
