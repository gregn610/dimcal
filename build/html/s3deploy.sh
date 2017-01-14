#!/usr/bin/env bash -x
OLDDIR=`pwd`

LOAD_DIR=${TRAVIS_BUILD_DIR}/build/html/dim_calendar
DEPLOY_TARGET_PATH=dimcalendar.gregnicol.xyz/dim_calendar
ls ${LOAD_DIR} -lh
ls ${LOAD_DIR} | xargs -n 1 -P8 -I % aws s3 cp % s3://${DEPLOY_TARGET_PATH}

cd ${OLDDIR}
echo "**************************************** DONE! ****************************************"
