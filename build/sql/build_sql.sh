#!/bin/bash -x
OLDDIR=`pwd`

dropdb --if-exists dimcaldb
dropuser --if-exists dimcaluser

createuser --createdb dimcaluser
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
      --pidfile /tmp/uwsgi.build.pid               \
      --logto /dev/null                            &
echo "Waiting 11sec for the server to start"
sleep 11s
echo "Starting crawl"
cd ${TRAVIS_BUILD_DIR}/build/sql/
# make rerunnable for local builds
rm -rf build
mkdir -p build

# Thanks: http://stackoverflow.com/a/11850469/266387
./extract_links.py
./extract_links.py | grep -v dim_calendar |                  \
                     grep -v "http://localhost:8000[#]*$" |  \
                     sort -r |                               \
                     xargs -n 1 -P 2 wget --recursive --no-host-directories --no-clobber --quiet

cd ${TRAVIS_BUILD_DIR}/build/sql/build
tar -czvf dim_calendar.tar.gz plpgsql mysql

uwsgi --stop /tmp/uwsgi.build.pid
cd ${OLDDIR}
echo "**************************************** DONE! ****************************************"
