#!/usr/bin/env bash

sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main"

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo apt-get update
sudo apt-get install -y postgresql-$1 libpq-dev

echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /etc/postgresql/$1/main/pg_hba.conf

sudo -u postgres psql -c "CREATE ROLE ubuntu SUPERUSER LOGIN;"

sudo service postgresql start
