#!/usr/bin/env bash
OLDDIR=`pwd`

dropdb --if-exists dimcaldb
createdb --owner=dimcaluser dimcaldb

# Migrations use relative paths so it's important to run them from project root
cd ${TRAVIS_BUILD_DIR}/src/dimcal/
./manage.py migrate
uwsgi --master                                     \
      --socket 127.0.0.1:3031                      \
      --module=dimcal.wsgi:application             \
      --env DJANGO_SETTINGS_MODULE=dimcal.settings \
      --http :8000                                 \
      --processes 2 --threads 2                    \
      --stats 127.0.0.1:9191                       \
      --logto /dev/null                            &
echo "Waiting 11sec for the server to start"
sleep 11s

cd ${TRAVIS_BUILD_DIR}/build/html/
./build_static.sh

cd ${TRAVIS_BUILD_DIR}/build/sql/
./build_sql.sh

cd ${OLDDIR}
kill $!
echo "**************************************** DONE! ****************************************"
