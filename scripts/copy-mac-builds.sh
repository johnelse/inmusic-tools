#!/bin/bash

set -eux

BUILDS_PATH=/Volumes/Jenkins/Builds

DIRECTORIES="ACVS-Master-Mac ACVS-1to1-Mac"

for DIRECTORY in $DIRECTORIES
do
    mkdir -p $DIRECTORY
    BUILD=`ssh pete@10.95.0.175 -t "ls -t $BUILDS_PATH/$DIRECTORY | grep PkgFiles | head -1 | tr -d '[:space:]'"`
    scp -r pete@10.95.0.175:$BUILDS_PATH/$DIRECTORY/$BUILD $DIRECTORY
done
