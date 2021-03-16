---
title: Install phpMyAdmin di RunCloud
description: 'RunCloud adalah panel server web modern yang dirancang untuk membantu Anda mengelola aplikasi web dan situs web PHP (PHP Cloud Server Management Panel) dengan mudah dan cepat'
lang: id_ID
date: 2021-03-16 22:36 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runcloud-phpmyadmin.png
categories:
 - runcloud
 - ubuntu
 - database
---

[Belajar Linux ID](https://belajarlinux.id) - [phpMyAdmin](https://www.phpmyadmin.net/) adalah salah satu aplikasi open source (bebas) yang dapat Anda  gunakan untuk mengelola database server MariaDB atau MySQL melalui web  base. phpMyAdmin ditulis menggunakan PHP.

Dengan phpMyAdmin Anda dapat dengan mudah melakukan dan membuat  database, tables, columns, relations, indexes, useres, permissions, dan  lainnya.

*Baca juga:*

- [**Install RunCloud di Ubuntu 20.04 LTS**](https://belajarlinux.id/install-runcloud-di-ubuntu-20-04-lts/)
- [**Membuat Web App di RunCloud**](https://belajarlinux.id/membuat-webapp-di-runcloud/)
- [**Membuat Database di RunCloud**](https://belajarlinux.id/membuat-database-di-runcloud/)
- [**Install WordPress di RunCloud**](https://belajarlinux.id/install-wordpress-di-runcloud/)

Untuk melakukan instalasi phpMyAdmin di runcloud sangatlah mudah karena runcloud sudah menyediakan *oneclick installer* untuk phpMyAdmin silakan membuat Web App terlebih dahulu

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-php1.png)

Kemudian, pilih *1 Click PHPMyAdmin*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-php2.png)

Sebelum lanjut ke tahapan selanjutnya siapkan domain atau subdomain Anda, pastikan sudah dipointing ke IP server runcloud

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-php3.png)

Selanjutnya isi nama web app sesuai keinginan Anda dan input domain atau subdomain Anda dan pilih PHP versi yang ingin Anda gunakan. Klik *Add web* untuk membuat web apps phpMyAdmin

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-php4.png)

Jika sudah akan nampa summary dari web app phpMyAdmin yang sudah dibuat.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-php5.png)

Akses domain atau subdomain phpMyAdmin Anda melalui browser

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-php6.png)

Supaya secure Anda dapat memasang ssl gratis yang disediakan oleh runcloud dengan cara masuk ke menu *SSL/TLS >> SSL Provider Let's Encrypt >> Let's Encrypt Environment >> Live >> Submit*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-php7.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-php8.png)

Saat ini web app phpMyAdmin sudah secure dengan menggunakan SSL.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-php9.png)

Silakan akses kembali domain atau subdomain phpMyAdmin di web browser pastikan sudah secure menggunakan protokol HTTPS

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-php10.png)

Login ke phpMyAdmin menggunakan user root dan password root yang Anda dapatkan pada saat instalasi awal RunCloud

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-php11.png)

Berikut tampilan dashboard phpMyAdmin

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-php12.png)

Jika dilihat di menu *Database* RunCloud PHPMyAdmin sudah ada di list. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-php13.png)

Sampai disini Anda sudah berhasil melakukan instalasi phpMyAdmin di RunCloud. 

Selamat mencoba 😁