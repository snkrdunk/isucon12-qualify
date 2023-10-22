#!/bin/sh

set -eu

APP_HOME=/home/isucon/webapp

# log rotation
mv /var/log/nginx/access.log /var/log/nginx/access.log.`date +%Y%m%d%H%M%S`
nginx -s reopen
cp /tmp/mysql-slow.log /var/log/mysql/slowquery.log.`date +%Y%m%d%H%M%S`
truncate -s 0 /tmp/mysql-slow.log

BRANCH=${1:-main}
git fetch origin $BRANCH
git checkout $BRANCH

# nginx
# cp ~/etc/nginx/nginx.conf /etc/nginx/nginx.conf
# cp ./etc/nginx/sites-available/isucondition.conf /etc/nginx/sites-available/isucondition.conf

sudo systemctl daemon-reload
sudo systemctl restart isuports.service
