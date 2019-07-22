#!/bin/bash

unameOut="$(uname -s)"
BASE_DIR=`pwd`
CMD=$BASE_DIR/bin
case "${unameOut}" in
    Linux*)     CMD="$CMD/Linux/air";;
    Darwin*)    CMD="$CMD/Mac/air";;
    CYGWIN*|MINGW*)    CMD="$CMD/Win/air.exe";;
    *)
        echo "UNKNOWN:${unameOut}"
        exit 1
    ;;
esac

COMMAND=${1:-api}
cd ../backend
$CMD -c conf/air/${COMMAND}.conf
