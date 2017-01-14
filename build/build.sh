#!/usr/bin/env bash
OLDDIR=`pwd`

cd ${TRAVIS_BUILD_DIR}/build/html/
./build_static.sh

cd ${TRAVIS_BUILD_DIR}/build/sql/
./build_sql.sh

cd ${OLDDIR}
echo "**************************************** DONE! ****************************************"
