---
title: Membuat User Administrator Read Only di Zimbra Mail Server
description: 'Zimbra adalah perangkat lunak open source (terbuka) untuk kolaborasi email yang sering digunakan untuk membangun sebuah mail server dan sangat terkemuka didunia.'
lang: id_ID
date: 2021-02-12 20:46 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/admin-zimbra.png
categories:
 - Zimbra
 - mail-server
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini akan dibahas bagaimana cara membuat user administrator dengan privileges atau hak akses hanya read only (bisa melihat saja) di Zimbra Mail Server. 

*Baca juga:*

- **[Pengenalan Zimbra](https://belajarlinux.id/pengenalan-zimbra/)**
- **[Install Zimbra Mail Server di Ubuntu 18.04 LTS](https://belajarlinux.id/install-zimbra-di-ubuntu-18.04/)**
- **[Menambahkan DNS Record Zimbra Mail Server](https://belajarlinux.id/menambahkan-dns-record-zimbra-mail-server/)**
- **[Install SSL Letsencrypt di Zimbra Mail Server](https://belajarlinux.id/install-ssl-letsencrypt-di-zimbra-mail-server/)**
- **[Mengatasi Error Upstream di Zimbra Mail Server](https://belajarlinux.id/mengatasi-error-upstream-di-zimbra-mail-server/)**
- **[Membuat User Email di Zimbra Mail Server](https://belajarlinux.id/membuat-user-email-di-zimbra-mail-server/)**
- **[Membuat Multi Akun Email di Zimbra Mail Server](https://belajarlinux.id/membuat-multi-akun-email-di-zimbra-mail-server/)**

Tutorial ini sangat berguna jika Anda seorang Adminstrator diminta salah satu staff yang ada di kantor etc dijadikan sebagai Administrator Zimbra dengan syarat hanya bisa akses dan lihat saja (read only) dan tidak bisa menambah, edit, hapus dan yang lainnya. 

Untuk membuat user administrator read only dapat dilakukan dengan cara membuat file bash `.sh`

```bash
root@mail:~# cd /opt/zimbra/create-user/
root@mail:/opt/zimbra/create-user#

root@mail:/opt/zimbra/create-user#
root@mail:/opt/zimbra/create-user# vim admin-readonly.sh
```

Berikut isi dari file `admin-readonly.sh` 

```bash
#!/bin/bash
# $1 email
# $2 domain

zmprov ma $1 zimbraIsDelegatedAdminAccount TRUE zimbraAdminConsoleUIComponents accountListView

zmprov grr domain $2 usr $1 -deleteAccount
zmprov grr domain $2 usr $1 -changeAccountPassword
zmprov grr domain $2 usr $1 adminConsoleAccountRights
zmprov grr domain $2 usr $1 -getAccountMembership
zmprov grr domain $2 usr $1 -addAccountAlias
zmprov grr domain $2 usr $1 countAccount
zmprov grr domain $2 usr $1 -modifyAccount
zmprov grr domain $2 usr $1 -createAccount
zmprov grr domain $2 usr $1 -renameAccount
zmprov grr domain $2 usr $1 -setAccountPassword
zmprov grr domain $2 usr $1 -removeAccountAlias
```

Berikan hak akses execute pada file `.sh` tersebut

```bash
root@mail:/opt/zimbra/create-user# chmod +x admin-readonly.sh
root@mail:/opt/zimbra/create-user#
```

Login user zimbra

```bash
root@mail:/opt/zimbra/create-user# su - zimbra
zimbra@mail:~$
```

Cek list email yang ada di zimbra

```bash
zimbra@mail:~$ zmprov -l gaa nurhamim.my.id |grep blinux
blinux1@nurhamim.my.id
blinux2@nurhamim.my.id
zimbra@mail:~$
```

Jadikan user `blinux1@nurhamim.my.id` sebagai user administrator read-only dengan cara menjalankan perintah berikut

```bash
zimbra@mail:~$ /opt/zimbra/create-user/admin-readonly.sh blinux1@nurhamim.my.id nurhamim.my.id
zimbra@mail:~$
```

Validasi user `blinux1@nurhamim.my.id` dengan cara akses ke Administrator Zimbra, hasilnya kurang lebih seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/ar1.png)

Yeay, saat ini Anda sudah berhasil membuat user administrator dengan hak akses read only. 

Selamat mencoba 😁