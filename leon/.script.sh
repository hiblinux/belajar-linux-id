#!/bin/bash

export file=`ls -1`

read -p "masukan nama : " nama

for db in $file
do
  echo $db;
  sed "2 i\author: leon" -i $db
  echo "";
done

