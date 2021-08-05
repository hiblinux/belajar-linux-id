---
title: Cara Install Openbox Window Manager di Debian GNU/Linux 
description: Openbox adalah stacking window manager.
lang: id_ID
date: 2021-07-09 17:45 +0700
layout: post
featured: true
author: Radhitya
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-07-09_17-26-25.jpg
categories:
- debian
- openbox
- desktop
---

## Apa itu Openbox Window Manager?
Openbox adalah stacking window manager untuk X11 alias X Window System. Salah satu window manager yang ringan dan banyak digunakan, tidak heran banyak distro menyediakan varian ini, seperti Mabox Linux, ArcoLinux, dan lain - lain. Window manager ini berasal dari Blackbox 0.65.0 yang ditulis ulang dan sejak versi 3.0 tidak lagi menggunakan kode dari Blackbox.

## Cara Install Openbox di Debian GNU/Linux
Disini kita akan memasang openbox sebagai window manager dan tint2 sebagai panel. Mari kita praktek install Openbox di Debian GNU/Linux.
```bash
sudo apt install openbox tint2 obconf
```

Setelah sudah silahkan logout atau restart, lalu pilih **openbox** di display manager masing - masing.

Jika anda pengguna **startx**, maka perlu membuat file .xinitrc seperti berikut.
```bash
$ vim .xinitrc
```
Lalu kita isi **exec openbox-session**.
```bash
exec openbox-session
```
Jika sudah jalankan **startx**.
```bash
$ startx
```
## Cara Membuat Autostart Openbox
Cara membuat script autostart di Openbox sangatlah mudah. Anda harus membuat file **autostart** yang terletak di **.config/openbox** seperti ini.

```bash
$ vim .config/openbox/autostart
```
Lalu kita tulis program yang ingin dijalankan, misal tint2
```bash
tint2 &
```
Jika sudah refresh dengan perintah ini.
```bash
$ openbox --reconfigure
```
