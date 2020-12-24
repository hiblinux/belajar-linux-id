#!/bin/bash
# MAINTENER LEON

#export path=$PWD/tools

# Verification User

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Remove previous binary

rm -fv /usr/bin/push
rm -fv /usr/bin/new-post

# Get your path git
echo "Saat ini berada pada directory $PWD"
echo ""
read -p "Masukan Path Git (ex: /xxx/xxx/belajar-linux-id) : " path

# Check tools dir is exist
mkdir -v $path/tools

# Download Default File
echo "Start downloading default tools ====>"
wget "https://gitlab.com/leonyonz/mediumish-theme-jekyll/-/snippets/2051126/raw/master/push.sh" -O $path/tools/push.sh
wget "https://gitlab.com/leonyonz/mediumish-theme-jekyll/-/snippets/2051127/raw/master/new-post.sh" -O $path/tools/new-post.sh

# Define variable in tools
sed -i "s|path|$path|g" $path/tools/new-post.sh
sed -i "s|path|$path|g" $path/tools/push.sh

# Change permission
echo "Change permission tools ====>"
chmod +x $path/tools/*

ls -la $path/tools/

# Make binary for tools
echo ""
echo "Send tool to binary path ====>"
mv $path/tools/new-post.sh /usr/bin/new-post
mv $path/tools/push.sh /usr/bin/push

#Check
echo "Tes command baru ===>"
which new-post
which push
echo ""
echo "Inisiate Done, Please refer to : https://gitlab.com/hiblinux/belajar-linux-id"
