---
title: Cara Install dwm di Debian GNU/Linux
description: dynamic window manager atau dwm adalah window manager buatan komunitas suckless.org
lang: id_ID
date: 2021-06-25 10:08 +0700
layout: post
featured: true
author: Radhitya
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-06-25_10-12-51.jpg
categories:
- dwm
- suckless
- desktop
---
## Apa itu DWM?
DWM atau Dynamic Window Manager adalah window manager untuk X buatan komunitas **suckless.org**. Window manager ini hanya memiliki kode baris yang singkat, tidak lebih dari 2000. Karena itu, dwm sangat ringan dan cepat. Untuk kustomisasi, anda diharuskan mengkonfigurasi sumber kode sesuai keinginan.

## Install DWM di Debian GNU/Linux
Instalasi DWM di Debian GNU/Linux sangat mudah. Pastikan sudah unduh **git**.
```bash
apt install git
```
Jika sudah, kita akan melakukan git clone **dmenu**,**dwm**, dan **st** dari repositori git suckless.
```bash
git clone https://git.suckless.org/st
git clone https://git.suckless.org/dmenu/
git clone https://git.suckless.org/dwm/
```
Setelah git clone, pemasangan dimulai dengan cara **make install**, seperti ini
```bash
cd st
sudo make install
```
Lakukan yang sama untuk `dmenu` dan `dwm`.
```bash
cd dmenu
sudo make install
```
dan untuk dwm
```bash
cd dwm
sudo make install
```
