---
title: Install Webuzo di Ubuntu 20 LTS
description: 'Webuzo merupakan salah satu kontrol panel populer yang bersifat Open Source,  dengan beragam fitur yang tidak kalah dengan kontrol panel berbayar seperti Plesk Panel dan cPanel'
lang: id_ID
date: 2021-01-13 21:20 +0700
layout: post
featured: true
author: amar
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/cover-post-cpanel.png'
categories:
 - kontrol-panel
 - cpanel
---

[Belajar Linux ID](https://belajarlinux.id) - Webuzo merupakan salah satu kontrol panel populer yang bersifat Open Source,  dengan beragam fitur yang tidak kalah dengan kontrol panel berbayar seperti Plesk Panel dan cPanel.

Pada dasarnya fungsi Webuzo sama dengan kontrol panel Plesk Panel dan cPanel. Namun yang membedakan adalah tampilan untuk admin panel dan webuzo sering digunakan karena bersifat Open Source atau secara gratis.

Namun walaupun Webuzo merupakan kontrol panel gratis, Anda bisa mendeploy aplikasi seperti CMS atau FrameWork dalam satu klik. Karena Webuzo memiliki fitur Softaculous yaitu salah satu aplikasi autoinstaller yang paling banyak digunakan.

Pada kesempatan kali ini, saya akan menjelaskan cara menginstall Webuzo pada Ubuntu 20 LTS.

## Persiapan sebelum Instalasi

Sebelum instalasi dilakukan, ada beberapa hal yang perlu diperhatikan yaitu:

  

{:start="1"}

1. Mengubah nama Hostname menjadi nama FQDN contoh: (server.namadomainAnda.com)

  

{:start="2"}

2. Pastikan VPS/VM dalam keadaan Fresh OS, karena apabila terdapat Web Service yang berjalan pada saat instalasi dilakukan maka proses instalasi akan gagal. Web Service yang dimaksudkan seperti aplikasi Web Server (Apache,Nginx) Mail Server (Postfix,Dovecot)

  

{:start="3"}

3. Pastikan VPS/VM yang digunakan sudah memenuhi System Requirement Webuzo yaitu:

  

- Minimal 1GB RAM
- Minimal 5 GB free disk

  

{:start="4"}

4. Pastikan juga OS yang digunakan sudah disupport Oleh Webuzo, berikut OS Linux yang sudah support Webuzo:

  

- CentOS 7.x 64-bit
- CentOS 8.x 64-bit
- Red Hat Enterprise Linux 6.x 64-bit
- Red Hat Enterprise Linux 7.x 64-bit
- Scientific Linux 6.x 64-bit
- Scientific Linux 7.x 64-bit
- Ubuntu LTS
 
 {:start="5"}
 
 5. Pastikan Anda sudah menginstall aplikasi wget untuk men-download installer Webuzo. Apabila Anda belum menginstall wget, Anda bisa menginstall nya dengan menjalankan command berikut:
 
```
apt install wget
```


Apabila VPS sekiranya sudah memenuhi kriteria yang disebutkan diatas, selanjutnya masuk ke tahap instalasi.

  

## Instalasi Webuzo

  

Untuk menginstall Webuzo,  Anda dapat menjalankan command sebagai berikut:
  

```bash

wget -N http://files.webuzo.com/install.sh // Mendownload installer Webuzo

chmod 0755 install.sh  // Merubah permission file installer agar dapat dieksekusi

./install.sh           // Meng-eksekusi installer Webuzo
```
  

Setelah menjalankan command tersebut, Anda hanya perlu menunggu hingga proses instalasi selesai.
Pada saat instalasi selesai, maka akan ada informasi login untuk pertama kalinya ke Webuzo sebagai berikut:

  

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/proses-instalasi-webuzo.png)

  

## Setup Webuzo

  

Sebelum melakukan setup pada Webuzo, Anda perlu registrasi lisensi Webuzo untuk mendapatkan trial. Berikut caranya:

  

- Akses URL https://webuzo.com/free dan silakan men-centang pada re-captcha pada bagian `Security Confirmation` dan klik `Issue license`

 
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/issue-license-webuzo.png)

  

- Setelah Anda mendapatkan lisensi Webuzo, silakan mengakses URL berikut http://IP-Server-VM:2004
 
- Setelah itu, silakan untuk melakukan setup dengan mengisi field yang ada.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/setup-webuzo.png)
  
- Lalu klik Install
 

Setelah setup Webuzo selesai, maka akan ada tampilan sebagai berikut  dan untuk mengakses admin panel, Anda bisa mengakses URL http://IP-Server-VPS:2002/ dan masukan username dan password admin.


![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/Instalasi-komplit-webuzo.png)


![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/enduser-panel-webuzo.png)

  
  Dan berikut saya lampirkan tampilan admin panel pada Webuzo.
  

Sekian, dan Selamat mencoba 😁
