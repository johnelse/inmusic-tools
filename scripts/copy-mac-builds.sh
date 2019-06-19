#!/bin/bash

set -eux

WORKSPACE=/Volumes/Jenkins/Jenkins/Home/workspace
PACKAGES_PATH=Software/Build/Mac/build/Packages

DIRECTORIES="ACVS-trunk-Mac-git ACVS-1to1-Mac ACVS-arrange-Mac"

for DIRECTORY in $DIRECTORIES
do
    mkdir -p $DIRECTORY
    PACKAGES=$WORKSPACE/$DIRECTORY/$PACKAGES_PATH
    BUILD=`ssh pete@10.95.0.175 -t "ls -t $PACKAGES | grep PkgFiles | head -1 | tr -d '[:space:]'"`
    scp -r pete@10.95.0.175:$WORKSPACE/$DIRECTORY/$PACKAGES_PATH/$BUILD $DIRECTORY
done
