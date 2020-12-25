#!/bin/bash

clear

cat banner

echo ""
echo "Apa yang Anda butuhkan ?"
echo ""
echo ""
echo "1. Push perubahan ke repo"
echo "2. Buat posting baru"
echo "3. Pindahkan draft ke folder _posts"
echo ""

read -p "Masukan pilihan Anda : " opsi

clear

case "$opsi" in
        1) push ;;
        2) new-post ;;
        3) moving
        exit 1;;
esac
