#!/bin/bash -x
DIR=`dirname $0`
createdb --owner=dimcaluser dimcaldb
${DIR}/../src/dimcal/manage.py migrate
${DIR}/../src/dimcal/manage.py runserver &
echo "Waiting 7sec for the server to start"
sleep 7s
cd ${DIR}/ && wget -r localhost:8000/dim_calendar/
rm localhost:8000/dim_calendar/about # This is configured on s3 with a redirect
kill $!
