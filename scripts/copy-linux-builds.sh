#!/bin/bash

set -eux

DIRECTORIES="ACV5-acvs_trunk ACV8-acvs_trunk ADA2-acvs_1to1 ADA2-acvs_arrange"

for DIRECTORY in $DIRECTORIES
do
    BUILD=`ssh builds@10.95.0.141 -t "ls -t /jenkins-enos/export/$DIRECTORY | grep update | head -1 | tr -d '[:space:]'"`
    scp builds@10.95.0.141:/jenkins-enos/export/$DIRECTORY/$BUILD .
done
