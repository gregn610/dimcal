#!/bin/bash -x
DIR=`dirname $0`
${DIR}/../src/dimcal/manage.py migrate
${DIR}/../src/dimcal/manage.py runserver &
echo "Waiting 7sec for the server to start"
sleep 7s
cd ${DIR}/ && wget -r localhost:8000/dim_calendar/
kill $!
