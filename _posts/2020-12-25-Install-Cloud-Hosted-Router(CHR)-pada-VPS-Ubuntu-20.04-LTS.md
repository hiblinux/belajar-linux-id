---
title: Install Cloud Hosted Router (CHR) pada VPS Ubuntu 20.04 LTS. 
description: Mikrotik Cloud Hosted Router (CHR) merupakan jenis mikrotik yang diinstall di VPS. Biasanya mikrotik CHR digunakan untuk pembuatan IP Public , Server VPN (Tunnel), Proxy Server, DNS dan sebagainya. 
lang: id_ID
date: 2020-12-25 22:29 +0700
layout: post
featured: true
author: Imron
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/install-chr-pada-vps-ubuntu-20-04.png
categories: [ Mikrotik, VPS, Ubuntu ]
---

Mikrotik merupakan salah satu perangkat jaringan yang paling banyak diminati, dikarenakan konfigurasinya lebih sederhana daripada juniper maupun cisco. 
Mikrotik sudah disediakan dari kalangan home based maupun enterprise (skala besar), hal ini dikarenakan mikrotik menyediakan RouterOS. 

RouterOs merupakan sistem operasi berbasis kernel linux yang bisa mengubah komputer menjadi perangkat jaringan. Adapun fitur-fitur yang disediakan oleh RouterOs adalah sebagai berikut:

1. Firewall
2. VPN
3. Bandwidth shaping.
4. Kualitas Layanan (QoS)
5. Kemampuan untuk bertindak sebagai Akses Point Wireless
6. Bridging
7. Hotspot berbasis portal, dan lain-lain. 

## Prasyarat

 Sebelum melakukan instalasi Cloud Hosted Router (CHR), pastikan Anda sudah memiliki VPS yang siap untuk digunakan. VPS tersebut bisa menggunakan sistem operasi CentOs 7/8, Ubuntu 16/18, dll. 
 Perlu diketahui instalasi CHR ini membutuhkan lisensi mikrotik untuk menggunakan fitur yang disediakan secara lebih sempurna, namun Anda tidak perlu kuatir dikarenakan secara default sudah disediakan lisensi free. Namun, kecepatan trafik setiap interface dibatasi sebesar 1 Mb. 

## Instalasi CHR pada VPS 

1. Login ke VPS terlebih dahulu sebagai root, disini saya menggunakan VPS dengan sistem operasi Ubuntu 20.04 LTS. 
Lakukan update paket terlebih dahulu dan tunggu proses update hingga selesai. 

```
apt update
```

{:start="2"}
2. Install CHR pada VPS dengan menjalankan perintah sebagai berikut: 

```
wget https://download2.mikrotik.com/routeros/6.38.3/chr-6.38.3.img.zip -O chr.img.zip && \
gunzip -c chr.img.zip > chr.img && \
mount -o loop,offset=33554944 chr.img /mnt && \
ADDRESS=`ip addr show eth0 | grep global | cut -d' ' -f 6 | head -n 1` && \
GATEWAY=`ip route list | grep default | cut -d' ' -f 3` && \
echo "/ip address add address=$ADDRESS interface=[/interface ethernet find where name=ether1]
/ip route add gateway=$GATEWAY
" > /mnt/rw/autorun.scr && \
umount /mnt && \
echo u > /proc/sysrq-trigger && \
dd if=chr.img bs=1024 of=/dev/vda
```

{:start="3"}
3. Apabila instalasi berjalan dengan normal dan tidak terdapat pesan error, silakan restart VPS tersebut. 

{:start="4"}
4. Langkah selanjutnya adalah login ke VPS melalui WinBox. Jika Anda belum memilikinya, silakan download terlebih dahulu pada link [berikut](https://mikrotik.com/download).

{:start="5"}
5. Buka WinBox dan masukkan IP Address VPS, Login dengan user admin dan password dikosongi (default), klik Connect. 

{:start="6"}
6. Apabila berhasil login, akan muncul tampilan seperti berikut. 

## Kesimpulan 

Itulah cara install CHR pada VPS, perlu diketahui bahwa untuk lisensi free mikrotik tersebut membatasi kecepatan trafik jaringan pada interface sebesar 1 Mbps saja. 

Sekian dan terima kasih. 

Semoga bermanfaat dan barokah :) . 

