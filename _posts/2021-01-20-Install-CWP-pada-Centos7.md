---
title: Install CWP pada Centos7
description: 'CWP atau centOS Web Panel merupakan salah satu kontrol panel populer yang bersifat Open Source dan dikhususkan untuk pengguna OS Centos'
lang: id_ID
date: 2021-01-20 03:49 +0700
layout: post
featured: true
author: amar
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/cover-post-cwp.png'
categories:
 - kontrol-panel
 - centos-web-panel
---

[Belajar Linux ID](https://belajarlinux.id) - CWP atau centOS Web Panel merupakan salah satu kontrol panel populer yang bersifat Open Source dan dikhususkan untuk pengguna OS Centos.

  
Pada dasarnya fungsi CWP sama dengan kontrol panel Plesk Panel,cPanel dan Webuzo. Namun yang membedakan adalah tampilan Panel Admin nya dan fitur-fitur yang disediakan. Karena CWP bersifat OpenSource fitur yang tesedia kurang lebih sama dengan Webuzo.

Pada kesempatan kali ini, saya akan menjelaskan cara menginstall CWP pada Centos 7

## Persiapan sebelum Instalasi

  

Sebelum instalasi dilakukan, ada beberapa hal yang perlu diperhatikan yaitu:

{:start="1"}

  

1. Mengubah nama Hostname menjadi nama FQDN contoh: (server.namadomainAnda.com)

 
{:start="2"}

 
2. Pastikan VPS/VM dalam keadaan Fresh OS, karena apabila terdapat Web Service yang berjalan pada saat instalasi dilakukan maka proses instalasi akan gagal. Web Service yang dimaksudkan seperti aplikasi Web Server (Apache,Nginx) Mail Server (Postfix,Dovecot)

  
{:start="3"}


3. Pastikan VPS/VM yang digunakan sudah memenuhi System Requirement CWP yaitu:

- Minimal 1GB RAM untuk sistem operasi 64 bit
- Minimal 512 RAM untuk sistem operasi 32 bit
- Minimal 5 GB free disk

{:start="4"}

4. Pastikan juga OS yang digunakan sudah disupport Oleh CWP, berikut OS Linux yang sudah support CWP:


- CentOS 7
- CentOS 8

{:start="5"}

5. Pastikan Anda sudah menginstall aplikasi wget untuk men-download installer CWP. Apabila Anda belum menginstall wget, Anda bisa menginstall nya dengan menjalankan command berikut:

```
yum install wget
```

Apabila VPS sekiranya sudah memenuhi kriteria yang disebutkan diatas, selanjutnya masuk ke tahap instalasi.

  

  

## Instalasi CWP
Untuk menginstall CWP, Anda dapat menjalankan command sebagai berikut:

  

```bash
cd /usr/local/src
wget http://centos-webpanel.com/cwp-el7-latest
sh cwp-el7-latest
```

  

Setelah menjalankan command tersebut, Anda hanya perlu menunggu hingga proses instalasi selesai.

Pada saat instalasi selesai, maka akan ada informasi port yang digunakan admin panel CWP sebagai berikut:

  

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/Instalasi-komplit-cwp.png)

Setelah itu, silakan me-restart server menggunakan command `reboot`

Instalasi selesai dilakukan dan Anda bisa mengakses URL http://IP-Server-VPS:2031/ dan masukan username dan password admin (kredensial root). Dan berikut saya lampirkan tampilan admin panel pada CWP.
  

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/tampilan-login-cwp.png)

  ![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/tampilan-dashboard-admin-cwp.png)

  

Sekian, dan Selamat mencoba 😁

