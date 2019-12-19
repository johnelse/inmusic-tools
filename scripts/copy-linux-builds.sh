#!/bin/bash

set -eux

BUILDS_PATH=/jenkins-enos/export

DIRECTORIES="ACV5-acvs_trunk ACV8-acvs_trunk ADA2-acvs_1to1"

for DIRECTORY in $DIRECTORIES
do
    mkdir -p $DIRECTORY
    BUILD=`ssh builds@cam-jenkins.inmusicbrands.com -t "ls -t $BUILDS_PATH/$DIRECTORY | grep update | head -1 | tr -d '[:space:]'"`
    scp builds@cam-jenkins.inmusicbrands.com:$BUILDS_PATH/$DIRECTORY/$BUILD $DIRECTORY
done
