#!/bin/bash -x
OLDDIR=`pwd`

LOAD_DIR=${TRAVIS_BUILD_DIR}/build/html/dim_calendar
DEPLOY_TARGET_PATH="s3://dimcalendar.gregnicol.xyz/dim_calendar"
ls ${LOAD_DIR} -lh
ls ${LOAD_DIR} | xargs -n 1 -P8 -I % aws s3 sync % ${DEPLOY_TARGET_PATH} --content-encoding gzip --cache-control "max-age=3600"

cd ${OLDDIR}
echo "**************************************** DONE! ****************************************"
