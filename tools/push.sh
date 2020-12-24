#!/bin/bash
cd /home/imonk/belajar-linux-id

#add file and directory
git add .

#add commit message
read -p "Masukan Commit : " commit
echo ""
git commit -m "$commit"

#pull before push
git pull

#push to master
git push origin master