#!/bin/bash 
SOURCE="/home/rinku/data1/Devops/Github"
DESTINATION="/home/rinku/data2"
DATE=$(date +%Y-%m-%d_%H_%M-%S)
# Create  backup Dirctory and copy file
mkdir -p $DESTINATION/$DATE
cp -rv $SOURCE $DESTINATION/$DATE
echo "$DATE Backup completed on"
