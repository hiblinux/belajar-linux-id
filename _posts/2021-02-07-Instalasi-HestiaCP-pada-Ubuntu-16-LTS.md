---
title: Install HestiaCP Ubuntu 16 LTS
description: 'HestiaCP adalah salah satu control panel yang masih tergolong baru dan HestiaCP dibuat dengan base/core VestaCP.  Dan 
mempunyai beberapa fitur major yang ditingkatkan dari versi VestaCP'
date: 2021-02-07 16:40 +0700
date: 2021-02-07 16:38 +0700
layout: post
featured: true
author: amar
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/cover-post-hestiacp.png'
categories:
 - kontrol-panel
 - hestiacp
---

[Belajar Linux ID](https://belajarlinux.id) - HestiaCP adalah salah satu control panel yang masih tergolong baru dan HestiaCP dibuat dengan base/core VestaCP.  Dan mempunyai beberapa fitur major yang ditingkatkan dari versi VestaCP. 

Untuk melihat informasi fitur utama yang disediakan oleh HestiaCP, Anda bisa membuka tautan berikut [Fitur HestiaCP](https://docs.hestiacp.com/release_notes.html#)

Pada kesempatan kali ini, saya akan menjelaskan cara menginstall HestiaCP pada sistem Operasi Ubuntu 16 LTS.

## Persiapan sebelum Instalasi
Sebelum instalasi dilakukan, ada beberapa hal yang perlu diperhatikan yaitu:

  

{:start="1"}
1. Mengubah nama Hostname menjadi nama FQDN contoh: (server.namadomainAnda.com)

{:start="2"}
2. Pastikan VPS/VM dalam keadaan Fresh OS, karena apabila terdapat Web Service yang berjalan pada saat instalasi dilakukan maka proses instalasi akan gagal. Web Service yang dimaksudkan seperti aplikasi Web Server (Apache,Nginx) Mail Server (Postfix,Dovecot)
 
{:start="3"}
3. Pastikan VPS/VM yang digunakan sudah memenuhi System Requirement HestiaCP yaitu:

- Minimal 1GB RAM
- Minimal 10 GB free disk

{:start="4"}
4. Pastikan juga OS yang digunakan sudah disupport Oleh HestiaCP , berikut OS Linux yang sudah support HestiaCP:

-   Debian 9
-   Debian 10
-   Ubuntu 16.04 LTS
-   Ubuntu 18.04 LTS
-   Ubuntu 20.04 LTS

Apabila VPS sekiranya sudah memenuhi kriteria yang disebutkan diatas, selanjutnya masuk ke tahap instalasi.


## Instalasi HestiaCP

Pertama-tama, Anda perlu melakukan update dan upgrade dependencies pada VPS Anda, berikut command nya:

```bash
apt-get update && apt-get upgrade
```

Setelah itu, silakan untuk mendownload installer HestiaCP melalui Wget:

```bash
`wget https://raw.githubusercontent.com/hestiacp/hestiacp/release/install/hst-install.sh`
```

Lalu jalankan installer HestiaCP menggunakan command berikut:

```
bash hst-install.sh`
```
## Setup HestiaCP

  Sesaat Anda menjalankan Installer HestiaCP, Nantinya akan terdapat bash yang perlu Anda isi berupa informasi alamat email untuk administrator dan persetujuan untuk menginstall service-service yang dibutuhkan.
  
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/Package-yang-akan-diinstall.png)

Setelah itu, proses instalasi HestiaCP akan berjalan dan berlangsung dari 10 - 15 menit. 

Apabila proses instalasi telah selesai, maka Anda akan mendapatkan informasi port serta credential untuk login ke admin panel HestiaCP. Seperti screenshot berikut:

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/Install-selesai-hestia.png)

Lalu klik `y` untuk me-restart server. Dan silakan login ke admin HestiaCP menggunakan alamat IP VPS atau domain Anda. Berikut kami lampirkan screenshot tampilan panel HestiaCP.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/tampilan-hestiacp.png)

Sekian, dan Selamat mencoba 😁

