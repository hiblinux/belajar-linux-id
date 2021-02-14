---
title: Reset Password Email Melalui Webmail di Zimbra Mail Server
description: 'Zimbra adalah perangkat lunak open source (terbuka) untuk kolaborasi email yang sering digunakan untuk membangun sebuah mail server dan sangat terkemuka didunia.'
lang: id_ID
date: 2021-02-14 19:41 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/password-zimbra.png
categories:
 - Zimbra
 - mail-server
---

[Belajar Linux ID](https://belajarlinux.id)  - Pada tutorial kali ini kami akan memberikan cara bagaimana melakukan reset password akun email Zimbra melalui webmail. Untuk mengikuti tutorial ini pastikan Anda sudah mengikuti tutorial berikut: ***[Enable Fitur Forgot Password di Webmail Zimbra Mail Server](https://belajarlinux.id/enable-fitur-forgot-password-webmail-di-zimbra-mail-server/)***.

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
- **[Mengubah Ukuran Mailbox Email di Zimbra Mail Server](https://belajarlinux.id/mengubah-ukuran-mailbox-email-di-zimbra-mail-server/)**

Tujuan dari tutorial ini yaitu untuk mempermudah Anda melakukan recovery akun email zimbra Anda apabila mengalami lupa password. 

Pertama silakan login ke akun email Anda melalui webmail zimbra lalu masuk ke menu *Preference >> Accounts >> Password Recovery Account Settings >> Email: Input email Anda (yang akan digunakan untuk recovery emailnya) >> Add Recovery Email*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/f1.png)

Status email recovery saat ini masih *Pending verification* silakan buka email tersebut dan melakukan verifikasi

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/f2.png)

Pada email verifikasi Anda akan mendapatkan code verifikasi yang akan Anda gunakan untuk aktivasi akun email recovernya. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/f3.png)

Input kode verifikasi yang Anda dapatkan pada seperti gambar dibawah ini lalu klik *Verify code*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/f4.png)

Apabila sudah berhasil verifikasi status email recovery akan berubah menjadi *Email Verified*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/f5.png)

Contoh ketikan gagal login, silakan klik tombol *Forgot Password*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/f6.png)

Input email yang ingin di reset password lalu *Submit*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/f7.png)

Klik *Request Code* untuk mendapatkan kode verifikasi untuk kebutuhan reset password

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/f8.png)

Periksa email recovery Anda

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/f10.png)

Input code verifikasi Pada kolom *Reset Code* lalu *Verify Code*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/f11.png)

Apabila code verifikasinya berhasil, silakan klik *Reset Password* untuk melakukan reset password akun email Anda

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/f12.png)

Input password baru email Anda lalu *Submit*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/f13.png)

Saat ini password email sudah berhasil di reset

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/f14.png)

Silakan coba login kembali menggunakan password yang baru

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/f15.png)

Saat ini Anda sudah dapat login menggunakan password baru. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/f16.png)

Selamat mencoba 😁