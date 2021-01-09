---
title: Cara Menggunakan Perintah tcpdump di Linux
description: 'Tcpdump adalah sebuah alat atau *tool packet sniffing dan packet analyzing* untuk Sistem Administrator tujuannya memecahkan masalah konektivitas di Linux'
lang: id_ID
date: 2021-01-09 07:44 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/cover-tcpdump.png'
categories:
 - linux
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini kami akan bahas tentang **tcpdump**. **Tcpdump** adalah sebuah alat atau *tool packet sniffing dan packet analyzing* untuk Sistem Administrator tujuannya memecahkan masalah konektivitas di Linux. **Tcpdump** digunakan untuk *menangkap (capture), memfilter (filter), dan menganalisis lalu lintas jaringan (analyze network traffic)* seperti paket TCP/IP yang melalui sistem Anda.  **Tcpdump** sering digunakan sebagai alat keamanan karena **tcpdump** menyimpan informasi yang ditangkap *(captured)* dalam file *pcap*, file *pcap* ini kemudian dapat dibuka melalui **[Wireshark](https://www.wireshark.org/)**.

## Instalasi

Saat ini sudah banyak sistem operasi yang secara default paket **tcpdump** sudah terinstall, jika belum terinstall Anda dapat menginstalnya menggunakan perintah berikut: 

```bash
# CentOS/Redhat
$ sudo yum install tcpdump

# Debian/Ubuntu
$ sudo apt install tcpdump
```

## Penggunaan Tcpdump

Berikut ini beberapa contoh penggunaan tcpdump yang sering digunakan:

- Menangkap paket antarmuka jaringan (network interface) saat ini

Perintah berikut akan menangkap paket-paket dari antarmuka jaringan saat ini di mana sistem terhubung ke internet.

```bash
$ sudo tcpdump
$ sudo tcpdump |grep IP
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/tc1.png)

- Menangkap paket dari antarmuka jaringan (network interface) tertentu

Perintah berikut digunakan untuk menangkap paket untuk network interface **ens3**

```bash
$ ip a |grep state
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8950 qdisc fq_codel state UP group default qlen 1000
$
$ sudo tcpdump -i ens3
```

- Menangkap jumlah paket tertentu di interface tertentu

Perintah berikut hanya akan menangkap 4 paket dari interface **ens3**

```bash
$ sudo tcpdump -c 4 -i ens3
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/tc2.png)

- Mencetak paket *(print captured)* yang diambil dalam format **[ASCII](https://en.wikipedia.org/wiki/ASCII)** 

Perintah berikut ini akan mencetak paket yang diambil dari nilai interface **ens3** ke **[ASCII](https://en.wikipedia.org/wiki/ASCII)**.

```bash
# All
$ sudo tcpdump -A -i ens3

# Captured spesific number
$ sudo tcpdump -c 4 -A -i ens3
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/tc3.png)

- Menampilkan semua interface yang tersedia atau ada

Perintah berikut ini akan menampilkan semua interface yang tersedia di sistem.

```bash
$ sudo tcpdump -D
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/tc4.png)

- Menampilkan paket dalam nilai HEX dan ASCII

Perintah berikut akan mencetak paket yang diambil dari interface **ens3** dalam bentuk nilai HEX dan ASCII.

```bash
# All
$ sudo tcpdump -XX -i ens3

# Captured spesific number
$ sudo tcpdump -c 4 -XX -i ens3
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/tc5.png)

- Menyimpan paket yang diambil ke dalam file

Perintah berikut ini akan menampilkan semua paket tangkapan dalam sebuah file bernama *capture_packets.pcap*.

```bash
$ sudo tcpdump -w captured_packets.pcap -i ens3
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/tc6.png)

- Membaca paket yang diambil dari file

Perintah berikut ini akan membaca paket yang diambil dari *file capture_packets.pcap* sebelumnya.

```bash
$ sudo tcpdump -r captured_packets.pcap
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/tc7.png)

- Menangkap paket dengan alamat ip

Perintah berikut ini akan menangkap paket dengan alamat IP.

```bash
# All Paket
$ sudo tcpdump -n -i ens3

# 30 Paket
$ sudo tcpdump -c 30 -n -i ens3
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/tc8.png)

- Menangkap hanya paket TCP

Perintah berikut ini hanya akan menangkap paket TCP dari interface **ens3** saja

```bash
# All paket TCP
$ sudo tcpdump -i ens3 tcp

# 30 paket TCP
$ sudo tcpdump -c 30 -i ens3 tcp
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/tc9.png)

Itulah beberapa perintah dan contoh penggunaan **tcpdump**.

Selamat mencoba 😁