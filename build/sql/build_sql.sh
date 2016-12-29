#!/bin/bash -x
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
tar -czvf dim_calendar.plpgsql.tar.gz plpgsql
echo "************** DEBUG ****************"
echo `pwd`
ls -la
