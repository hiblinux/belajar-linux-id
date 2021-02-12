---
title: Membuat Multi Akun Email di Zimbra Mail Server
description: 'Zimbra adalah perangkat lunak open source (terbuka) untuk kolaborasi email yang sering digunakan untuk membangun sebuah mail server dan sangat terkemuka didunia.'
lang: id_ID
date: 2021-02-12 20:00 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/user1-zimbra.png
categories:
 - Zimbra
 - mail-server
---

[Belajar Linux ID](https://belajarlinux.id) - Kali ini kita akan memberikan tips dan cara membuat user dengan jumlah yang banyak dan secara bersamaan (multiple akun email) di Zimbra Mail Server, tentunya cara ini sangat berguna bagi Anda administrator Zimbra jika terdapat permintaan untuk membuat user banyak sekaligus. 

*Baca juga:*

- **[Pengenalan Zimbra](https://belajarlinux.id/pengenalan-zimbra/)**
- **[Install Zimbra Mail Server di Ubuntu 18.04 LTS](https://belajarlinux.id/install-zimbra-di-ubuntu-18.04/)**
- **[Menambahkan DNS Record Zimbra Mail Server](https://belajarlinux.id/menambahkan-dns-record-zimbra-mail-server/)**
- **[Install SSL Letsencrypt di Zimbra Mail Server](https://belajarlinux.id/install-ssl-letsencrypt-di-zimbra-mail-server/)**
- **[Mengatasi Error Upstream di Zimbra Mail Server](https://belajarlinux.id/mengatasi-error-upstream-di-zimbra-mail-server/)**
- **[Membuat User Email di Zimbra Mail Server](https://belajarlinux.id/membuat-user-email-di-zimbra-mail-server/)**

Untuk membuat multi akun email di Zimbra dapat menggunakan `.zmp` dimana file `.zmp` nantinya akan di jalankan menggunakan command promt dari Zimbra, tentunya menggunakan CLI. 

Disini kami akan membuat direktori khusus untuk meletakan file `.zmp` nya: 

```bash
root@mail:~# mkdir -p /opt/zimbra/create-user
root@mail:~# cd /opt/zimbra/create-user/
root@mail:/opt/zimbra/create-user#
```

Buat file dengan extensi `.zmp`

```bash
root@mail:/opt/zimbra/create-user# touch zimbra-user.zmp
```

Berikut isi konten dari file `zimbra-user.zmp`

```bash
createAccount blinux1@nurhamim.my.id 123456789 sn it1 'Departemen, IT 1' zimbraMailHost mail.nurhamim.my.id
createAccount blinux2@nurhamim.my.id 123456789 sn it2 'Departemen, IT 2' zimbraMailHost mail.nurhamim.my.id
```

**Keterangan:**

- *Account: blinux1@nurhamim.my.id*
- *Password: 123456789*
- *SN: it1*
- *displayName: 'Departemen, IT 1'*
- *zimbraMailHost: mail.nurhamim.my.id*

Jika sudah silakan simpan dan login ke user zimbra dan pindah ke direktori yang telah dibuat diatas

```bash
root@mail:/opt/zimbra/create-user# su - zimbra
zimbra@mail:~$
zimbra@mail:~$ cd /opt/zimbra/create-user/
zimbra@mail:~/create-user$
zimbra@mail:~/create-user$ ls
zimbra-user.zmp
zimbra@mail:~/create-user$
```

Untuk membuat akun email yang telah didefinisikan diatas jalankan perintah berikut:

```bash
zimbra@mail:~/create-user$ zmprov -f zimbra-user.zmp
prov> ffe9a6f5-28f3-4bc3-b8c7-4019302d41c3
prov> 1e8fb2c0-a191-47d7-bf4b-a74c187db42c
prov> zimbra@mail:~/create-user$
```

Pastikan akun email sudah terbuat menggunakan perintah berikut

```bash
zimbra@mail:~/create-user$ zmprov -l gaa nurhamim.my.id |grep blinux
blinux1@nurhamim.my.id
blinux2@nurhamim.my.id
zimbra@mail:~/create-user$
```

Anda dapat memastikannya melalui administrator web Zimbra 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/mul2.png)

Saat ini user sudah berhasil dibuat dengan benar. 

Selamat mencoba 😁