#!/bin/bash

export file=`ls -1`

read -p "masukan nama : " nama

for db in $file
do
  echo "Tambah author $nama ke $db >> Sukses Gan !";
  sed "2 i\author: $nama" -i $db
  echo "";
done

