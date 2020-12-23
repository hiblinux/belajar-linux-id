---
title: Cara Install HAProxy di Linux
description: High Availability Proxy adalah kepanjangan dari HAProxy sebuah perangkat lunak open source dibawah GPLv2 license
lang: id_ID
layout: post
date: 2020-12-24 00:32 +0700
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/haproxy.png
categories:
  - haproxy
  - ubuntu
  - centos
  - linux
---

### Pengenalan HAProxy

**High Availability Proxy** adalah kepanjangan dari HAProxy sebuah perangkat lunak open source dibawah GPLv2 license. HAProxy digunakan untuk membagi beban request atau load balancer TCP/HTTP dan solusi proxy yang dapat dijalankan di sistem operasi Linux, Solaris, dan FreeBSD.

Pembagian bebannya pun beragam sesuai dengan algoritma yang ada. HAProxy sudah umum digunakan untuk meningkatkan kinerja dan kehandalan sebuah server dengan mendistribusikan beban kerja dari beberapa server lain seperti web server, database server, smtp server dan yang lainnya.

### Fitur HAProxy

HAProxy mempunyai banyak fitur yang dapat digunakan sesuai dengan kebutuhan Anda diantaranya sebagai berikut:

- [Layer 4 (TCP)](https://en.wikipedia.org/wiki/Transport_layer) and [Layer 7 (HTTP)](https://en.wikipedia.org/wiki/OSI_model#Layer_7:_Application_Layer) load balancing
- [URL rewriting](https://en.wikipedia.org/wiki/Rewrite_engine)
- Rate limiting
- SSL/TLS termination
- [Gzip compression](https://en.wikipedia.org/wiki/Gzip)
- Proxy Protocol support
- Health checking
- Connection and HTTP message logging
- [HTTP/2](https://en.wikipedia.org/wiki/HTTP/2)
- [Multithreading](https://en.wikipedia.org/wiki/Multithreading_(computer_architecture))
- Hitless Reloads
- gRPC Support
- Lua and SPOE Support
- API Support
- Layer 4 Retries
- Simplified circuit breaking

### Cara Kerja HAProxy

Load Balancer menggunakan HAProxy bekerja sesuai dengan algoritma yang ditentukan. Terdapat 3 algoritma yang dapat digunakan diantaranya:

1. Roundrobin
 Algoritma Roundrobin salah satu algoritma default yang umum digunakan, cara kerjanya yaitu memilih secara bergantian antara host 1 dengan bost 2 dan seterusnya apabila terdapat request dari client.

2. Leastconn
 Jika Anda menggunakan algoritma Lestconn maka Anda dapat menentukan host mana yang akan menjadi beban atau tumpuan bila terdapat request dari client. Namun di sisi Backend Anda masih dapat menggunakan algoritma roundrobin.

3. Source
Algoritma Source adalah salah satu metode yang dapat digunakan untuk memastikan bahwa pengguna akan terhubung ke server yang sama. Anda dapat memilih berdasarkan hash dari IP sumber yaitu alamat IP pengguna (Client).

### Cara Install HAProxy

Untuk melakukan instalasi HAProxy di sistem operasi Linux sangat mudah. Berikut ini merupakan tahapan cara install HAProxy di **Ubuntu**, **Debian** dan **CentOS**:

#### Install HAProxy di Debian

Debian yang kami gunakan yaitu Debian 9 dan Debian 10, sebagai berikut: 

```console
# Debian 9

$ sudo apt-get update && sudo apt-get upgrade
$ sudo apt-get install haproxy -y

# Debian 10

$ sudo apt update && sudo apt -y upgrade
$ sudo apt -y install haproxy

# Ubuntu 18.04 & 16.04

$ sudo add-apt-repository ppa:vbernat/haproxy-1.8
$ sudo apt-get update
$ sudo apt-get install haproxy

# Ubuntu 20.04 

$ sudo apt install haproxy

# CentOS 7

$ sudo yum update -y
$ sudo yum install haproxy -y

CentOS 8

$ sudo dnf update -y
$ sudo dnf install haproxy -y
```

Konfigurasi default HAProxy berada di `/etc/haproxy/haproxy.cfg`.

Bagi Anda yang mendapatkan kendala pada saat instalasi, silahkan komentar dibawah ya.

Selamat mencoba 😁



