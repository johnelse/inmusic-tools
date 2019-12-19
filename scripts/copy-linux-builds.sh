#!/bin/bash

set -eux

DIRECTORIES="ACV5-acvs_trunk ACV8-acvs_trunk ADA2-acvs_1to1"

for DIRECTORY in $DIRECTORIES
do
    BUILD=`ssh builds@cam-jenkins.inmusicbrands.com -t "ls -t /jenkins-enos/export/$DIRECTORY | grep update | head -1 | tr -d '[:space:]'"`
    scp builds@cam-jenkins.inmusicbrands.com:/jenkins-enos/export/$DIRECTORY/$BUILD .
done
