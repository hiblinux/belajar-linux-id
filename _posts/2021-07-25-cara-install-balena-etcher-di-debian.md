---
title: Cara Install Balena Etcher di Debian GNU/Linux
description: Balena Etcher adalah program burning iso terbaik menurut saya
lang: id_ID
date: 2021-07-25 10:55 +0700
layout: post
featured: true
author: Radhitya
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-07-24_21-17-36.jpg
categories:
- debian
- linux
---

## Apa Itu Balena Etcher
Balena Etcher adalah program flash iso untuk SD Card dan Flashdisk. Program ini tersedia secara gratis di Windows, Linux, dan MacOS. Kabar baiknya anda dapat melihat kode sumber Etcher di repositori github Balena. 
## Cara Install Balena Etcher di Debian
Instalasi Balena Etcher di Debian sangat mudah. 

Program ini tidak tersedia di repositori utama Debian, jadi anda harus menambah repositori server Balena.
```bash
$ curl -1sLf \ 'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' \
$ sudo -E bash
```
Setelah menambahkan, kita update repo.
```bash
$ sudo apt update
```
Install Balena Etcher dengan perintah berikut
```bash
$ sudo apt install balena-etcher-electron
```
## Cara Menggunakan Balena Etcher
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-07-24_21-19-48.jpg)
Menggunakan Balena Etcher cukup mudah karena antarmuka nya sederhana sekali. Di kotak warna hijau, ada tombol **Flash from file**, artinya memilih iso yang akan diburn. Lalu di kota warna kuning adalah tombol untuk menentukan drive yang akan digunakan. Terakhir kotak ungu bertujuan untuk memulai flash.
