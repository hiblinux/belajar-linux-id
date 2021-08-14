---
title: Cara Install Plex Media Server di Debian GNU/Linux
description: Mau buat bioskop sendiri? Plex Media Server bisa diandalkan
lang: id_ID
date: yyyy-mm-dd HH:MM +0700
layout: post
featured: true
author: Radhitya
image: https://s3-kita-com/gambar.png
categories:
- debian
- Plexmediaserver
---

## Apa itu Plex Media Server

## Cara Install Plex Media Server di Debian GNU/Linux
Pertama buka halaman download program plex, kemudian pilih Linux dan Ubuntu (16.04+) / Debian (8+). Jika debian yang digunakan tidak memasang gui, gunakan perintah wget, seperti ini.

```bash
$ wget https://downloads.plex.tv/plex-media-server-new/1.24.0.4930-ab6e1a058/debian/plexmediaserver_1.24.0.4930-ab6e1a058_amd64.deb
```

Setelah proses pengunduhan selesai, pasang program dengan perintah *dpkg*.
```bash
$ sudo dpkg -i plexmediaserver_1.24.0.4930-ab6e1a058_amd64.deb 
```

Saatnya kita aktifkan servis Plex Media Server dengan cara berikut.
```bash
$ sudo service plexmediaserver start
```

Nantinya akan muncul info, misal saya yang masih menggunakan *sysvinit*.
```text
Plex Media Server is running.
```

Selanjutnya, kita akan membuka web plex yang berjalan di localhost. Sebelum itu, kita harus tahu dimana port web plex berada. Maka gunakan command *netstat*, seperti berikut.
```bash
$ sudo netstat -lnpt | grep Plex
```
Ini adalah info plex milik saya dengan command diatas.
```bash
root@devuan:/home/alif# netstat -lnpt | grep Plex
tcp        0      0 0.0.0.0:1551            0.0.0.0:*               LISTEN      28744/Plex DLNA Server
tcp        0      0 0.0.0.0:32400           0.0.0.0:*               LISTEN      28683/Plex Media Server
tcp        0      0 127.0.0.1:32401         0.0.0.0:*               LISTEN      28683/Plex Media Server
tcp        0      0 0.0.0.0:32469           0.0.0.0:*               LISTEN      28744/Plex DLNA Server
tcp        0      0 127.0.0.1:32600         0.0.0.0:*               LISTEN      28742/Plex Tuner Server
tcp        0      0 127.0.0.1:35615         0.0.0.0:*               LISTEN      28697/Plex Plug-in
```
Tulis **http://localhost:32400** atau **http://ip-kamu:32400** untuk mengakses web plex. Karena pertama kali, akan muncul wizard penginstallan.

[gambar 1]
Untuk menggunakan Plex, anda diharuskan login dengan Akun Google, Facebook, Apple, atau email.

[gambar 2]
Akan ada ilustrasi bagaimana Plex bekerja, jika sudah paham, silahkan klik **GOT IT**.

[gambar 3]
Bagian ini akan menentukan nama server plex anda. Opsi **Allow me to access my media outside my home** bisa dicentang atau tidak, tergantung pilihan anda. Klik **next** untuk selanjutnya.

[gambar 4]
Anda akan memilih jenis perpustakaan, misal film, musik, foto, atau acara tv. Misal saya ingin memilih Movies dengan folder Movies juga.

[gambar 5]
Tahapan selanjutnya adalah memilih folder tempat file berisi. Jika sudah, tekan **add library**.
