---
title: Cara Install dwmblocks di Debian GNU/Linux
description: dwmblocks adalah status monitor bar untuk dwm
lang: id_ID
date: 2021-07-22 14:12 +0700
layout: post
featured: true
author: Radhitya
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-07-22_14-11-44.jpg
categories:
- debian
- suckless
- dwmblocks
- dwm
---

## Apa Itu dwmblocks
Ada banyak monitor bar yang digunakan untuk dwm, salah satunya dwmblocks. dwmblocks adalah status bar yang ditulis dengan bahasa C. Menurut saya, monitor bar ini paling mudah digunakan dan mirip dengan i3blocks. 
## Cara Install dwmblocks
Kita akan melakukan git clone, pastikan package **git** sudah terpasang. Jika belum, lakukan perintah ini.
```bash
# apt install git
```
Lalu clone repository dwmblocks dengan cara berikut.
```bash
$ git clone https://github.com/torrinfail/dwmblocks.git
```
Jika sudah change directory ke dwmblocks.
```bash
$ cd dwmblocks
```
Untuk install dwmblocks, kita harus compile source code dengan command di bawah
```bash
$ sudo make install
```
Nantinya akan ada proses seperti di bawah
```bash
cc  dwmblocks.c -lX11 -o dwmblocks
mkdir -p /usr/local/bin
install -m 0755 dwmblocks /usr/local/bin/dwmblocks
```
Jika tidak ada masalah, dwmblocks berhasil terpasang.
