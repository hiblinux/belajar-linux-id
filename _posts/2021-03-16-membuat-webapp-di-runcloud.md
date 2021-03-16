---
title: Membuat Web App di RunCloud
description: 'RunCloud adalah panel server web modern yang dirancang untuk membantu Anda mengelola aplikasi web dan situs web PHP (PHP Cloud Server Management Panel) dengan mudah dan cepat'
lang: id_ID
date: 2021-03-16 20:45 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runcloud-webapp.png
categories:
 - runcloud
 - ubuntu
---

[Belajar Linux ID](https://belajarlinux.id) - Seperti yang kita ketahui bersama runcloud adalah panel server web modern yang dirancang untuk membantu Anda mengelola aplikasi web dan situs web PHP *(PHP Cloud Server Management Panel)* dengan mudah dan pada tutorial kali ini kami akan memberikan cara bagaimana membuat web apps untuk website Anda di RunCloud. 

*Baca Juga:*

- ***[Install RunCloud di Ubuntu 20.04 LTS](https://belajarlinux.id/install-runcloud-di-ubuntu-20-04-lts/)***

Untuk mengikuti tutorial ini pastikan Anda sudah memiliki dan install RunCloud terlebih dahulu. Untuk membuat web app untuk website Anda silakan *Login runcloud >> Pilih Server RunCloud Anda >> Web Application >> Create Web App*.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost1.png)

Disini kami menggunakan subdomain runcloud.belajarlinux.my.id dimana nanti subdomain ini yang akan digunakan untuk hosting web nya. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost2.png)

Kembali ke runcloud silakan pilih menu *Custom Web Application*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost3.png)

Pada menu **Web Aplication Name** isi nama web app sesuai keinginan Anda dan jika ingin menggunakan domain atau subdomain pribadi pilih **Use my onwn domain/subdomain** namun jika ingin menggunakan domain test dari runcloud pilih **Use test domain**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost4.png)

Tentukan PHP version yang ingin Anda gunakan dan Anda juga dapat menentukan web server yang ingin digunakan terdapat beberapa pilihan mulai dari nginx, apache atau hybrid/reverse proxy antara nginx dan apache

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost5.png)

Pada menu **Advanced Settings** disini Anda dapat melakukan beberapa konfigurasi tambahan jika dibutuhkan

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost6.png)

Paga gambar dibawah ini Anda dapat menyesuaikan konfigurasi PHP FPM dan PHP Setting sesuai keinginan Anda

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost7.png)

Apabila semua konfigurasi sudah dirasa sesuai semua Anda dapat membuat web app di runcloud dengan cara klik *Add Web Application*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost8.png)

Jika sudah berhasil dibuat akan nampak seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost9.png)

Silakan akses subdomain Anda maka Anda akan melihat tampilan default web app yang telah dibuat

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost10.png)

Untuk menggah data file PHP atau data web apps ke runcloud klik pada menu **File Manager**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost11.png)

Sebagai contoh klik `index.html` diatas dan ubah menggunakan file editor default dari runcloud

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost12.png)

Apabila sudah silakan akses kembali subdomain Anda

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost13.png)

Selanjutnya membuat file `info.php` silakan klik menu *Create >> File >> info.php*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost14.png)

isi file `info.php` menggunakan script berikut

```bash
<?php
phpinfo();
?>
```

Kemudian akses kembali `subdomain/info.php` hasilnya akan seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost15.png)

RunCloud menyediakan SSL/TLS free menggunakan let's encrypt namun jika Anda ingin menggunakan SSL yang berbayar juga dapat dilakukan, untuk install ssl free silakan masuk ke menu **SSL/TLS**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost16.png)

Pada bagian *Let's Encrypt Environment* pilih yang Live dan untuk protokol sesuai dengan kebutuhan lalu klik *Submit*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost17.png)

Jika berhasil akan nampak seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost18.png)

Silakan akses kembali subdomain Anda pastikan sudah secure seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost19.png)

Berikut tampilan list web application yang sudah dibuat

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runhost20.png)

Selamat mencoba 😁
