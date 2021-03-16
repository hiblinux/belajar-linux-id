---
title: Deploy Website Menggunakan Git di RunCloud
description: 'RunCloud adalah panel server web modern yang dirancang untuk membantu Anda mengelola aplikasi web dan situs web PHP (PHP Cloud Server Management Panel) dengan mudah dan cepat'
lang: id_ID
date: 2021-03-16 23:48 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runcloud-git.png
categories:
 - runcloud
 - ubuntu
 - git
---

[Belajar Linux ID](https://belajarlinux.id) - Salah satu fitur terbaik dari RunCloud adalah Anda dapat menggunakan GIT untuk attach project website yang Anda miliki di salah satu repository berikut: **Github, Gitlab, Bitbucket** dan yang lainnya ke Web Application RunCloud. Anda juga dapat melakukan pull otomatis untuk menyinkronkan (sync) situs web Anda dengan kode Anda yang berada di repository tersebut. Anda juga dapat mengubah branch GIT Anda dengan cepat. Jika Anda menggunakan GIT, Anda tidak akan dapat menggunakan fitur *Script Installer* yang ada di *Web Application* RunCloud. 

*Baca juga:*

- [**Install RunCloud di Ubuntu 20.04 LTS**](https://belajarlinux.id/install-runcloud-di-ubuntu-20-04-lts/)
- [**Membuat Web App di RunCloud**](https://belajarlinux.id/membuat-webapp-di-runcloud/)
- [**Membuat Database di RunCloud**](https://belajarlinux.id/membuat-database-di-runcloud/)
- [**Install WordPress di RunCloud**](https://belajarlinux.id/install-wordpress-di-runcloud/)
- [**Install phpMyAdmin di RunCloud**](https://belajarlinux.id/install-phpmyadmin-di-runcloud/)
- [**1 Click Install WordPress di RunCloud**](https://belajarlinux.id/1-click-wordpress-install-di-runcloud/)

Untuk mengikuti tutorial ini pastikan Anda sudah menyiapkan project website yang ada pada salah satu repository diatas, disini kami menggunakan Github repository.

Pertama yang harus Anda lakukan yaitu memasang *Deployment key* RunCloud ke repository github Anda

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-git-dep1.png)

View dan copy deployment key pada user `runcloud`

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-git-dep2.png)

Masuk ke akun github Anda dan pilih repository github Anda lalu masuk ke menu *Settings >> Deploy keys*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-git-dep3.png)

Silakan *Add deploy key*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-git-dep4.png)

Apabila sudah akan nampak seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-git-dep5.png)

Selanjutnya, kembali lagi ke RunCloud Admin silakan membuat web app untuk website Anda, untuk panduan membuat web app di RunCloud dapat dilihat pada link berikut: **[Membuat Web App di RunCloud](https://belajarlinux.id/membuat-webapp-di-runcloud/)**.

Masuk ke menu *Web Application >> Pilih Web App >> Git*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-git5.png)

Kemudian pilih source repository ayng ingin Anda gunakan, disini kami menggunakan GitHub, silakan input `github-username/repository-name` seperti gambar dibawah ini lalu klik **Attach Git Repository**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-git6.png)

Apabila berhasil akan nampak seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-git7.png)

Silakan akses domain atau subdomain Anda di browser

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-git8.png)

Saat ini Anda sudah berhasil deploy website yang berada di repository github ke RunCloud Anda juga dapat memasang SSL gratis di RunCloud untuk website Anda dengan cara masuk ke menu *SSL/TLS >> Pilih protokol dan sesuaikan konfigurasi >> Submit* seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-git9.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-git10.png)

Saat ini web app sudah secure

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-git11.png)

Silakan akses kembali website Anda melalui browser dan pastikan sudah menggunakan protokol HTTPS

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-git12.png)

Jika ingin melihat detail informasi dari web app silakan lihat di menu summary

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-git13.png)

Sampai disini Anda sudah berhasil deploy website menggunakan Git di RunCloud.

Selamat mencoba 😁