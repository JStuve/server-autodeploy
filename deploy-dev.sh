#!/bin/bash

PROJ_PATH=~/Gitproj/Y-Knot-Missions/dev/ykm-web/
SRC_BUILD="$PROJ_PATH"dist/
DEST_BUILD=/var/www/dev.yknotmissions.org/

echo "Creating Build..."
cd $PROJ_PATH
ls
git stash -u
git checkout dev
git pull origin dev

npm install
ng build --buildOptimizer=false --prod


echo "Copying files..."
rm -r "$DEST_BUILD"
cp -R "$SRC_BUILD". "$DEST_BUILD" # dist -> nginx folder


echo "DEV DEPLOYMENT COMPLETE"
date
