---
title: Cara Install Plesk Panel pada Ubuntu 20.04 LTS
description: 'Plesk Panel merupakan salah satu kontrol panel yang populer dan memudahkan user dalam mangelola server dan website'
lang: id_ID
date: 2021-01-06 23:11 +0700
layout: post
featured: true
author: amar
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/Cover-Plesk.jpg'
categories:
 - kontrol-panel
 - plesk
---


[Belajar Linux ID](https://belajarlinux.id) - Plesk Panel adalah salah satu kontrol panel yang dalamnya tersimpan tools untuk memudahkan Anda mengatur dan me-management server yang ditampilkan melalui GUI.

Dengan adanya Plesk Panel,  Anda bisa mudah mengelola database, email dan seluruh kebutuhan Website melalui interface yang disediakan oleh Plesk.

Plesk juga merupakan salah satu kontrol panel berbayar yang sering digunakan karena tampilan user interface nya yang menarik dan mudah digunakan. Dengan banyaknya user yang menggunakan Plesk Panel Anda bisa dengan mudah mencari tahu solusi apabila pada Plesk Panel Anda terdapat error/masalah. Dan juga Anda akan mendapatkan dukungan Technical Support Plesk apabila Anda membutuhkan bantuan untuk mengatasi kendala yang Anda alami.

Pada tutorial kali ini saya akan membahas cara menginstall Plesk Panel pada Ubuntu 20 dengan mudah.

## Persiapan sebelum Instalasi

Sebelum instalasi dilakukan,  ada beberapa hal yang perlu diperhatikan yaitu: 

1. Mengubah nama Hostname menjadi nama FQDN contoh: (server.namadomainAnda.com)

2. Pastikan VPS/VM dalam keadaan Fresh OS, karena apabila terdapat Web Service yang berjalan pada saat instalasi dilakukan maka proses instalasi akan gagal.  Web Service yang dimaksudkan seperti aplikasi Web Server (Apache,Nginx) Mail Server (Postfix,Dovecot)

3. Pastikan VPS/VM yang digunakan sudah memenuhi System Requirement Plesk Panel yaitu:
 - Minimal  512MB Ram + 1GB Swap
 - Minimal 10 GB free disk
 
 4. Pastikan juga OS yang digunakan sudah disupport Oleh Plesk, berikut OS Linux yang sudah support Plesk Panel:

- Debian 9 64-bit
- Debian 10 64-bit
- Ubuntu 16.04 64-bit (Tidak disarankan karena akan EOL pada April 2021)
- Ubuntu 18.04 64-bit
- Ubuntu 20.04 64-bit
- CentOS 7.x 64-bit
- CentOS 8.x 64-bit
- Red Hat Enterprise Linux 6.x 64-bit
- Red Hat Enterprise Linux 7.x 64-bit
- Red Hat Enterprise Linux 8.x 64-bit
- CloudLinux 7.1 and later 64-bit
- Virtuozzo Linux 7 64-bit

Apabila VPS sekiranya sudah memenuhi kriteria yang disebutkan diatas, selanjutnya masuk ke tahap instalasi.

## Instalasi Plesk Panel

Untuk menginstall Plesk Panel, Anda hanya perlu menjalankan 1 command berikut:

```bash
sh <(curl https://autoinstall.plesk.com/one-click-installer || wget -O - https://autoinstall.plesk.com/one-click-installer)
```

Setelah menjalankan command tersebut, Anda hanya perlu menunggu hingga proses instalasi selesai.

Pada saat instalasi selesai, maka akan ada informasi login untuk pertama kalinya ke Plesk Panel sebagai berikut:

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/Command-Instalasi.png)


## Setup Plesk Panel

Setelah instalasi dilakukan, Anda perlu mengakses salah satu URL yang ditampilkan agar Anda bisa melakukan setup Plesk Panel

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/Setup-Plesk.png)

Anda bisa mengisi field Contact Name dan Email sesuai dengan profil Anda, pada bagian Password silakan mengisi password yang akan digunakan kedepannya untuk login sebagai Administrator.

Pada bagian License, silakan memasukkan lisensi untuk Plesk Panel Anda apabila mempunyai lisensi tersebut.

Namun apabila Anda belum mempunyai lisensi Plesk Panel, Anda bisa memilih opsi `Proceed with a full-featured trial license` untuk mendapatkan trial selama 15 hari menggunakan Plesk Panel.

Lalu centang Service Agreement Plesk dan klik Confirm. Dan Plesk Panel akan melakukan inisiasi pada setup yang dilakukan sebelumnya.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/Inisiasi Plesk.png)


Setelah inisiasi dilakukan maka Anda akan ter-redirect ke halaman utama Plesk Panel Anda.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/Tampilan-Plesk.png)

Instalasi Plesk Panel telah berhasil dilakukan!  Selamat mencoba 😁
 
