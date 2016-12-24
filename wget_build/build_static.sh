#!/bin/bash
DIR=`dirname $0`
dropdb --if-exists dimcaldb
createdb --owner=dimcaluser dimcaldb
${DIR}/../src/dimcal/manage.py migrate
${DIR}/../src/dimcal/manage.py runserver &
echo "Waiting 17sec for the server to start"
sleep 17s
echo "Starting crawl"
cd ${DIR}/ && wget --recursive --no-host-directories --no-verbose localhost:8000/dim_calendar/
rm localhost:8000/dim_calendar/about # This is configured on s3 with a redirect
kill $!
