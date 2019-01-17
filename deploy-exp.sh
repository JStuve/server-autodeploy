#!/bin/bash

PROJ_PATH=~/Gitproj/Y-Knot-Missions/exp/ykm-web/
SRC_BUILD="$PROJ_PATH"dist/
DEST_BUILD=/var/www/exp.yknotmissions.org/
echo "#######################################"
echo "######### Creating Build ##############"
echo "#######################################"
cd $PROJ_PATH
ls
git stash -u
git branch exp
git checkout exp
git pull origin exp

npm install
ng build --prod --buildOptimizer=false


echo "#######################################"
echo "######## Removing Old Files ###########"
echo "#######################################"
rm -r "$DEST_BUILD"

echo "#######################################"
echo "########### Copying Files #############"
echo "#######################################"
cp -R "$SRC_BUILD". "$DEST_BUILD" # dist -> nginx folder


echo "EXP DEPLOYMENT COMPLETE"
date
