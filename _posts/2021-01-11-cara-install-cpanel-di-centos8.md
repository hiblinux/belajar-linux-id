---
title: Install WHM/cPanel di CentOS 8
description: 'cPanel merupakan salah satu kontrol panel yang populer dan memudahkan user dalam mangelola server dan website'
lang: id_ID
date: 2021-01-11 03:44 +0700
layout: post
featured: true
author: amar
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/cover-post-cpanel.png'
categories:
 - kontrol-panel
 - cpanel
---

[Belajar Linux ID](https://belajarlinux.id) - cPanel adalah salah satu kontrol panel berbayar yang populer selain Plesk Panel.

cPanel menyediakan fitur dari DNS Management, Database Server, Mail Server hingga  backup server, selain itu cPanel juga mudah digunakan karena menyediakan user interface yang friendly.

Dengan teknologi LVE dari CloudLinux, server Anda akan lebih optimal karena pembagian resource lebih ter-kontrol. Sebagai contoh Anda bisa menentukan resource yang digunakan untuk semua akun cPanel Anda.
 
Pada kesempatan kali ini, saya akan menjelaskan cara menginstall cPanel pada Centos 8

## Persiapan sebelum Instalasi

  

Sebelum instalasi dilakukan, ada beberapa hal yang perlu diperhatikan yaitu:

 
1. Mengubah nama Hostname menjadi nama FQDN contoh: (server.namadomainAnda.com)

  

2. Pastikan VPS/VM dalam keadaan Fresh OS, karena apabila terdapat Web Service yang berjalan pada saat instalasi dilakukan maka proses instalasi akan gagal. Web Service yang dimaksudkan seperti aplikasi Web Server (Apache,Nginx) Mail Server (Postfix,Dovecot)

  

3. Pastikan VPS/VM yang digunakan sudah memenuhi System Requirement cPanel yaitu:

- Minimal 1GB RAM

- Minimal 10 GB free disk

4. Pastikan juga OS yang digunakan sudah disupport Oleh cPanel, berikut OS Linux yang sudah support cPanel:

- CentOS 7.x 64-bit
- CentOS 8.x 64-bit
- Red Hat Enterprise Linux 7.x 64-bit
- CloudLinux 7 and later 64-bit
- CloudLinux 6 64-bit
  

Apabila VPS sekiranya sudah memenuhi kriteria yang disebutkan diatas, selanjutnya masuk ke tahap instalasi.

  
## Instalasi cPanel

Untuk menginstall cPanel, Anda hanya perlu menjalankan 1 command berikut:

```bash
cd /home && curl -o latest -L https://securedownloads.cpanel.net/latest && sh latest
```

Setelah menjalankan command tersebut, Anda hanya perlu menunggu hingga proses instalasi selesai.

  

Pada saat instalasi selesai, maka akan ada informasi login untuk pertama kalinya ke cPanel sebagai berikut:

  
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/proses-instalasi.png)

  
 
## Setup cPanel

  
Sebelum melakukan setup pada cPanel, Anda perlu registrasi lisensi cPanel untuk mendapatkan trial. Berikut caranya:

-  Klik Agree pada SLA cPanel

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/sla-cpanel.png)

- Lalu silakan registrasi akun dan verifikasi kode-nya

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/registrasi-cpanel.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/aktivasi-lisensi-cpanel.png)
 
- Apabila lisensi cPanel telah aktif, maka akan ada notifikasi sebagai berikut:
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/otw-setup-cpanel.png) 
  

Selanjutnya, silakan klik setup, dan tentukan email yang akan digunakan oleh administrator agar pemberitahuan/notifikasi aktifitas yang ada di cPanel akan dikirim ke email tersebut. Dan silakan mengisi nameserver yang digunakan untuk domain Anda.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/setup-cpanel.png)
  

Setelah klik  `Next`  akan muncul halaman homepage WHM Anda menandakan Instalasi cPanel berhasil.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/tampilan-home-cpanel.png)

  
Sekian,  dan Selamat mencoba 😁
