---
title: Cara Migrasi Devuan Stable ke Devuan Testing
description: Cara sederhana untuk migrasi stable ke testing
lang: id_ID
date: 2021-06-17 16:49 +0700
layout: post
featured: true
author: Radhitya
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-06-17_16-46-45.jpg
categories:
- devuan
---

Salah satu kekurangan menggunakan **stable releases distro** adalah program - program yang kuno, alasannya demi stabilitas tinggi. Mungkin terlalu bosan menunggu versi terbaru, sehingga membutuhkan aplikasi tersebut dengan cara backports atau migrasi.

## Cara Migrasi Devuan Stable ke Devuan Testing
Hari ini kita akan praktek cara migrasi devuan stable ke devuan testing. Tidak perlu melakukan install ulang. Harap diingat, praktek kali ini diharuskan masuk sebagai **root**.

Pertama buka file repository
```bash
vi /etc/apt/sources.list
```
Ubah bagian berikut seperti di bawah
```bash
deb http://deb.devuan.org/merged chimaera		main non-free
deb http://deb.devuan.org/merged chimaera-updates	main non-free
deb http://deb.devuan.org/merged chimaera-security	main non-free
```
Setelah mengubah, update dan upgrade repository.
```bash
apt update
apt upgrade
```
Kali ini kita akan mengupgrade distribusi, dari Devuan Beowulf ke Devuan Chimaera. Lakukan perintah berikut.
```bash
apt dist-upgrade
```
Nantinya ada proses download dan upgrade. Mungkin memakan waktu lama, tergantung jaringan internet.

Akan muncul dialog seperti di bawah. Pilih **yes** untuk melanjutkan.
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-06-13_11-27-59.jpg)

Dan selamat, anda berhasil melakukan migrasi.
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-06-13_12-00-49.jpg)
