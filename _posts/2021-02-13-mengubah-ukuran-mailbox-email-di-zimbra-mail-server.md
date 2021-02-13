---
title: Mengubah Ukuran Mailbox Email di Zimbra Mail Server
description: 'Zimbra adalah perangkat lunak open source (terbuka) untuk kolaborasi email yang sering digunakan untuk membangun sebuah mail server dan sangat terkemuka didunia.'
lang: id_ID
date: 2021-02-13 19:43 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/mailbox-zimbra.png
categories:
 - Zimbra
 - mail-server
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini akan membahas tentang bagaimana melakukan resize mailbox user email di Zimbra Mail Server, untuk melakukan resize mailbox dapat menggunakan dua cara diantaranya: 

1. Menggunakan CLI
2. Administrator Zimbra

*Baca juga:*

- **[Pengenalan Zimbra](https://belajarlinux.id/pengenalan-zimbra/)**
- **[Install Zimbra Mail Server di Ubuntu 18.04 LTS](https://belajarlinux.id/install-zimbra-di-ubuntu-18.04/)**
- **[Menambahkan DNS Record Zimbra Mail Server](https://belajarlinux.id/menambahkan-dns-record-zimbra-mail-server/)**
- **[Install SSL Letsencrypt di Zimbra Mail Server](https://belajarlinux.id/install-ssl-letsencrypt-di-zimbra-mail-server/)**
- **[Mengatasi Error Upstream di Zimbra Mail Server](https://belajarlinux.id/mengatasi-error-upstream-di-zimbra-mail-server/)**
- **[Membuat User Email di Zimbra Mail Server](https://belajarlinux.id/membuat-user-email-di-zimbra-mail-server/)**
- **[Membuat Multi Akun Email di Zimbra Mail Server](https://belajarlinux.id/membuat-multi-akun-email-di-zimbra-mail-server/)**
- **[Membuat User Administrator Read Only di Zimbra Mail Server](https://belajarlinux.id/membuat-user-administrator-readonly-di-zimbra-mail-server/)**
- **[Membuat Notifikasi User Gagal Login di Zimbra Mail Server](https://belajarlinux.id/membuat-notifikasi-user-gagal-login-di-zimbra-mail-server/)**

## Menggunakan CLI

Untuk malakukan resize mailbox akun email di Zimbra menggunakan CLI silakan login akses ssh ke server zimbra Anda masing-masing. 

Kemudian, pilih akun email dan lihat mailbox yang digunakan oleh akun email tersebut menggunakan command berikut:

```bash
zimbra@mail:~$ zmprov ga staff1@nurhamim.my.id |grep zimbraMailQuota
zimbraMailQuota: 0
zimbra@mail:~$
```

Informasi diatas menjelaskan untuk akun email `staff1@nurhamim.my.id` menggunakan kuota mailbox sebesar `0` artinya `unlimited`. 

Jika ingin diubah misalnya dari `unlimited` ke 2000MB gunakan perintah berikut: 

```bash
zimbra@mail:~$ zmprov ma staff1@nurhamim.my.id zimbraMailQuota 2000485000
```

Verifikasi kembali 

```bash
zimbra@mail:~$ zmprov ga staff1@nurhamim.my.id |grep zimbraMailQuota
zimbraMailQuota: 2000485000
zimbra@mail:~$
```

Catatan: Ukuran `2000485000` dalam satuan `byte`, total = 2000 MB

## Menggunakan Administrator Zimbra

Untuk resize mailbox akun email zimbra melalui administrator Zimbra, berikut tahapannya: 

Login ke **Zimbra Administrator >> Accounts >> Advanced >> Account Quota**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/ma1.png)

Gambar diatas untuk akun email masih menggunakan kuota mailbox `0` atau `unlimited`

Jika ingin diubah menjadi 1000 MB silakan ubah menjadi 1000 lalu **Save**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/ma2.png)

Saat ini mailbox user email zimbra sudah diatur menjadi 1000 MB. 

Selamat mencoba 😁