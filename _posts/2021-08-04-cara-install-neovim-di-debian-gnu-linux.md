---
title: Cara Install dan Build From Source Neovim di Debian GNU/Linux
description: Neovim adalah fork vim dan salah satu text editor terbaik
lang: id_ID
date: 2021-08-04 18:56 +0700
layout: post
featured: true
author: Radhitya
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-08-04_18-52-57.jpg
categories:
- neovim
---

## Apa Itu Neovim
Sampai saat ini vim masih menjadi text editor pilihan untuk sebagian orang. Ada banyak fork, salah satunya neovim. Neovim adalah fork vim yang disempurnakan dan disederhanakan, sehingga pengoperasiannya jauh lebih mudah. Juga fork ini kompatible dengan banyak plugin. 
## Cara Install Neovim di Debian GNU/Linux

### Lewat Binary di Repositori 
Neovim tersedia di repositori Debian. Untuk mengunduhnya sangat mudah dengan perintah berikut.
```bash
$ sudo apt install neovim
```
Jika sudah, jalankan di terminal dengan cara seperti di bawah.
```bash
$ nvim
```
### Lewat Build / Compile From Source
Terkadang di Debian, versi neovim tergolong jadul, demi mengejar stabilitasnya. Jangan bersedih, karena kita bisa install versi terbaru dengan bangun dari sumbernya. Ikuti cara berikut.

Pertama - tama, kita akan git clone.
```bash
$ git clone https://github.com/neovim/neovim
```
Setelah sudah, kita change directory
```bash
$ cd neovim
```
Sekarang kita akan mulai build from source
```bash
$ sudo make install
```
Nantinya akan muncul proses kompil, bisa jadi suhu laptop akan naik karena cpu yang sedang bekerja. Setelah proses selesai, jalankan program dengan command **nvim**
```bash
$ nvim
```
atau
```bash
$ nvim percobaan.txt
```
