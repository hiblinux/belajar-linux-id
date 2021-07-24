---
title: Cara Install Balena Etcher di Debian GNU/Linux
description: Balena Etcher adalah program burning iso terbaik menurut saya
lang: id_ID
date: yyyy-mm-dd HH:MM +0700
layout: post
featured: true
author: Nama-Mu
image: https://s3-kita-com/gambar.png
categories:
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
