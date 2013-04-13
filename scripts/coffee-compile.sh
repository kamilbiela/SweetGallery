#!/bin/bash

BASE_DIR=`dirname $0`

echo ""
echo "Starting to autocompile *.coffee scripts in app/ dir "
echo "-------------------------------------------------------------------"

coffee -w -b --join $BASE_DIR/../app/app.js --compile $BASE_DIR/../app/