#!/bin/bash -x
OLDDIR=`pwd`

LOAD_DIR=${TRAVIS_BUILD_DIR}/build/html/dim_calendar
DEPLOY_TARGET_PATH="s3://dimcalendar.gregnicol.xyz/dim_calendar/"
aws s3 sync ${LOAD_DIR} ${DEPLOY_TARGET_PATH} --content-encoding gzip --cache-control "max-age=3600"

cd ${OLDDIR}
echo "*************************************** DONE! ****************************************"
