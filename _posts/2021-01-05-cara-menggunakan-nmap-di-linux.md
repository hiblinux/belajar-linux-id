---
title: Cara Menggunakan Perintah Nmap di Linux
description: 'Nmap adalah sebuah tools scanning network yang dapat digunakan untuk kebutuhan *audit security* dan *penetration testing*, nmap biasanya digunakan oleh seorang administrator network apabila terdapa kendala pada koneksi network'
lang: id_ID
date: 2021-01-05 22:24 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/nmap.png'
categories:
 - linux
---

[Belajar Linux ID](https://belajarlinux.id)  - Nmap adalah sebuah tools scanning network yang dapat digunakan untuk kebutuhan *audit security* dan *penetration testing*, nmap biasanya digunakan oleh seorang administrator network apabila terdapa kendala pada koneksi network, nmap juga bisanya digunakan oleh administrator server untuk melihat port service apa saja yang lister, filtered atau closed, selain itu nmap juga biasanya digunakan oleh seseorang yang ingin melakukan penetration testing terhadap server atau website untuk mencari celah keamaan, detail nmap untuk hacking dapat merujuk pada link berikut: [Null Byte](https://null-byte.wonderhowto.com/how-to/tactical-nmap-for-beginner-network-reconnaissance-0189856/)

Pada tutorial kali ini yang akan kami bahas yaitu bagaimana cara melihat service port atau melakukan port scanning menggunakan nmap. 

## Instalasi Nmap

Nmap bisa dibilang sebagai tools yang multi-platform karena nmap dapat di install diberbagai platform atau sistem operasi, awalnya nmap hanya dirilis untuk sistem operasi Linux dan kemudian merambah ke sisitem operasi lain seperti *BSD, Windows dan macOS*. 

Paket binary nmap dapat Anda unduh pada link berikut: [Download page](https://nmap.org/download.html). Berikut tahapan instalasi nmap dibeberapa sistem operasi

### Install Nmap di Ubuntu dan Debian

Nmap tersedia dari repository default Ubuntu dan Debian, untuk instalasinya jalankan perintah berikut:

```bash
$ sudo apt update
$ sudo apt install nmap
```

### Install Nmap di CentOS dan Fedora

Untuk instalasi Nmap di CentOS dan turunan Red Hat gunakan perintah berikut

```bash
# CentOS 8 dan Fedora
$ sudo dnf install nmap

# CentOS 7
$ sudo yum install nmap
```

### Install Nmap di macOS

Pengguna macOS dapat melakukan instalasi Nmap dengan mengunduh paket instalasi **".dmg"** dari situs Nmap atau melalui Homebrew:

```bash
$ brew install nmap
```

### Install Nmap di Windows

Versi Windows dari Nmap memiliki beberapa batasan, dan umumnya sedikit lebih lambat dari pada versi UNIX. Opsi termudah untuk install Nmap di Windows adalah mengunduh dan menjalankan file exe.

Anda dapat menjalankan Nmap di Windows baik dari baris perintah atau dengan menggunakan program Zenmap. Untuk informasi lebih lanjut tentang cara menggunakan Nmap di Windows dapat merujuk pada link berikut: [Menjalankan Nmap di Windows](https://nmap.org/book/inst-windows.html#inst-win-exec).

## Menggunakan Nmap

Seperti yang kami sampaikan diatas Nmap biasanya digunakan untuk audit *network security, network mapping, identify open ports dan mencari perangkat online (public)*. 

Jika Anda ingin melihat semua port apa saja yang tersedia dan dapat dilakukan scanning menggunakan Nmap dapat menggunakan perintah berikut

```bash
$ less /usr/share/nmap/nmap-services
```

Anda akan melihat output seperti berikut:

```bash
...
# Fields in this file are: Service name, portnum/protocol, open-frequency, optional comments
#
tcpmux  1/tcp   0.001995        # TCP Port Service Multiplexer [rfc-1078]
tcpmux  1/udp   0.001236        # TCP Port Service Multiplexer
compressnet     2/tcp   0.000013        # Management Utility
compressnet     2/udp   0.001845        # Management Utility
compressnet     3/tcp   0.001242        # Compression Process
compressnet     3/udp   0.001532        # Compression Process
unknown 4/tcp   0.000477
rje     5/udp   0.000593        # Remote Job Entry
unknown 6/tcp   0.000502
echo    7/sctp  0.000000
echo    7/tcp   0.004855
echo    7/udp   0.024679
unknown 8/tcp   0.000013
discard 9/sctp  0.000000        # sink null
```

### Scanning Port Menggunakan Nmap

Untuk melakukan scanning port dapat menggunakan Nmap, cara yang paling mudah yaitu tanpa mengunakan opsi apapun bisa dibilang cara ini merupakan cara yang paling basic contoh

```bash
$ nmap scanme.nmap.org
```

Jika Anda ingin melakukan scanning terhadap host misalnya host dari subdomain `scanme.nmap.org` dapat menggunakan opsi **-O** contoh

```bash
$ sudo nmap -O scanme.nmap.org
```

Untuk melakukan scanning port tanpa mengetahui detail informasi host dapat menggunakan opsi **-PN**

```bash
$ sudo nmap -PN scanme.nmap.org
```

Untuk scanning rDNS (reverse DNS) gunakan opsi **-n**

```bash
$ sudo nmap -n scanme.nmap.org
```

Untuk scanning dengan spesifik port misalnya port 80 dapat dilakukan dengan menambahkan opsi **-p**

```bash
$ sudo nmap -p 80 scanme.nmap.org
```

Untuk scanning koneksi TCP, nmap dapat melakukan 3-way handshake, dengan port yang ditargetkan menggunakan opsi **-sT**

```bash
$ sudo nmap -sT scanme.nmap.org
```

Untuk scanning koneksi UDP gunakan opsi **-sU**

```bash
$ sudo nmap -sU scanme.nmap.org
```

Untuk scanning all port TCP dan UDP gunakan perintah berikut

```bash
$ sudo nmap -n -PN -sT -sU -p- scanme.nmap.org
```

Untuk melakukan scanning [SYN](https://en.wikipedia.org/wiki/SYN_flood) gunakan perintah berikut

```bash
$ sudo nmap -sS scanme.nmap.org
```

Pendekatan yang lebih tersembunyi adalah mengirimkan header TCP yang tidak valid, yang jika host sesuai dengan spesifikasi TCP, akan mengirimkan paket kembali jika porta tersebut ditutup. Biasanya scanning ini bekerja pada server selain Windows (non-Windows).

Anda dapat menggunakan flag **"-sF", "-sX", atau "-sN"**.

```bash
$ sudo nmap -PN -p 80 -sN scanme.nmap.org
```

Untuk melihat versi server apa yang berjalan di host, Anda dapat mencoba menggunakan perintah berikut: 

```bash
$ sudo nmap -PN -p 80 -sV scanme.nmap.org
```

Jika Anda ingin scanning spesifik atau all prefix IP Address dari host (target) juga dapat dilakukan dengan cara menggunakan perintah berikut: 

```bash
$ sudo nmap -PN xxx.xxx.xxx.xxx-yyy

atau 

$ sudo nmap -sP xxx.xxx.xxx.xxx-yyy
```

Ada banyak kombinasi perintah lain yang dapat Anda gunakan, akan tetapi perintah-perintah diatas dapat dimanfaat bagi Anda yang ingin melihat dan audit kerentanan network Anda. 

Jika Anda membutuhkan *Cheat Sheat Nmap* silakan merujuk pada link berikut: *[Nmap Cheet Sheet](https://stationx-public-download.s3.us-west-2.amazonaws.com/nmap_cheet_sheet_v7.pdf)*.

Apabila terdapat kendala atau pertanyaan silakan diajukan melalui kolom komentar ya !. 

Selamat mencoba 😁
