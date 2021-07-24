---
title: Cara Install GNU IceCat Browser di Debian
description: GNU IceCat adalah peramban fork firefox yang dikelola oleh tim GNU
lang: id_ID
date: 2021-07-04 09:22 +0700
layout: post
featured: true
author: Radhitya
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-07-03_10-28-00.jpg
categories:
- gnu icecat
---

## Apa Itu GNU IceCat
GNU IceCat adalah peramban firefox versi GNU yang berisi sepenuhnya free software. Alasan mereka membuat ini karena Mozilla Firefox merekomendasikan non-free software sebagai plugin dan addons.

Privasi lebih diperketat disini, mereka menambahkan fitur, seperti LibreJS, Https-Everywhere, SpyBlock, AboutIceCat, dan Fingerprinting countermeasures.

Jadi browser ini cocok jika anda ingin menjaga privasi agar tetap aman.
## Cara Install GNU IceCat di Debian GNU/Linux
Memasang peramban GNU IceCat sangat mudah, sama seperti Firefox. Hari ini kita akan install GNU IceCat di Debian GNU/Linux.

### 1. Website GNU
Sayangnya repository Debian tidak menyediakan GNU IceCat. Alamatnya kita harus mendownload secara manual, bisa menggunakan **wget**.
```bash
wget http://ftp.gnu.org/gnu/gnuzilla/60.7.0/icecat-60.7.0.en-US.gnulinux-x86_64.tar.bz2
```
Setelah selesai mendownload, kita akan meng-ekstrak file tersebut.
```bash
tar -xf icecat-60.7.0.en-US.gnulinux-x86_64
cd icecat
```
Untuk menjalankan aplikasinya, bisa klik langsung file **icecat** atau lewat terminal.
```bash
cd icecat
./icecat
```
### 2. Repositori Milik Orang (Unofficial)
Beruntungnya ada repositori GNU IceCat milik orang lain, tetapi unofficial. Di repositori ini, versi GNU IceCat sudah terbaru, yaitu 78 esr.

Cara menambah repositorinya mudah, mari kita coba.
```bash
sudo curl -SsL -o /etc/apt/sources.list.d/tmiland.list https://deb.tmiland.com/debian/tmiland.list
curl -SsL https://deb.tmiland.com/debian/KEY.gpg | sudo apt-key add -
sudo apt update
sudo apt install icecat
```

Selesai.
