---
title: Cara Install Web Server Apache dan PHP di Linux Container (LXD)
description: ' Apache merupakan web server yang dapat dijalankan di berbagai macam  sistem operasi yang berbeda seperti Unix, BSD, Linux, Windows dan Novell Netware yang bertugas untuk melayani fasilitas web dengan menggunakan  protokol http ataupun https'
lang: id_ID
date: 2020-12-28 15:59 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/apache/cover/1.png'
categories:
 - LXC/LCD
 - Linux Container
 - apache
---

[Belajar Linux ID](https://belajarlinux.id)  - Apache merupakan web server yang dapat dijalankan di berbagai macam  sistem operasi yang berbeda seperti Unix, BSD, Linux, Windows dan Novell Netware yang bertugas untuk melayani fasilitas web dengan menggunakan  protokol http ataupun https. Apache bersifat open source yang artinya  dapat digunakan secara bebas oleh semua pengguna atau kalangan.

Web server Apache akan bekerja jika pengguna atau user meminta atau  request melalui protokol http atau https untuk membuka suatu halaman.  Apache akan menjawab request yang diminta oleh pengguna kemudian akan  diproses oleh Apache sampai menampilkan sebuah halaman yang diminta atau yang diminta.

Pada tutorial kali ini apache web server akan kami install di linux container (LXD) dengan sistem operasi Ubuntu 20.04 LTS.

Untuk mengikuti tutorial ini pastikan Anda sudah mempunyai linux container (LXD) jika belum Anda dapat merujuk pada tutorial berikut, untuk mengetahui tentang apa itu linux container:

- [Mengenal Tentang LXC/LXD](https://belajarlinux.id/pengenalan-lxc-atau-lxd/)
- [Cara Install LXDUI di Ubuntu 20.04 LTS](https://belajarlinux.id/cara-install-lxdui-di-ubuntu-20-04-lts/)
- [Perintah Dasar Linux Container (LXD)](https://belajarlinux.id/perintah-dasar-lxd/)

Langkah pertama yang dilakukan yaitu membuat linux container-nya, disini kami akan menggunakan images **Ubuntu 20.04 LTS** 

```bash
ubuntu@lxd-belajarlinux:~$
ubuntu@lxd-belajarlinux:~$ lxc launch ubuntu:20.04 web
Creating web
Starting web
ubuntu@lxd-belajarlinux:~$
```

Lihat  dan pastikan linux container yang sudah dibuat diatas running

```bash
ubuntu@lxd-belajarlinux:~$ lxc list
+------+---------+-----------------------+-----------------------------------------------+-----------+-----------+
| NAME |  STATE  |         IPV4          |                     IPV6                      |   TYPE    | SNAPSHOTS |
+------+---------+-----------------------+-----------------------------------------------+-----------+-----------+
| web  | RUNNING | 10.171.248.115 (eth0) | fd42:c106:7321:e7f9:216:3eff:fe44:c031 (eth0) | CONTAINER | 0         |
+------+---------+-----------------------+-----------------------------------------------+-----------+-----------+
ubuntu@lxd-belajarlinux:~$
```

Terdapat 2 cara untuk eksekusi perintah ke dalam linux container bisa melalui host langsung atau login ke linux container. 

Linux container yang digunakan disini **Ubuntu 20.04 LTS** silakan update menggunakan perintah berikut (tanpa login ke linux container)

```bash
ubuntu@lxd-belajarlinux:~$ lxc exec web -- apt update -y
```

Jika sudah untuk install apache web server jalankan perintah berikut

```bash
ubuntu@lxd-belajarlinux:~$
ubuntu@lxd-belajarlinux:~$ lxc exec web -- apt install apache2
```

Untuk login ke linux container bisa as root dengan menggunakan `bash` atau as user host (ubuntu) contoh

```bash
ubuntu@lxd-belajarlinux:~$ lxc exec web -- sudo --user ubuntu --login
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@web:~$
```

Saat ini kita sudah masuk ke linux container silakan edit file apache default pada direktori berikut: 

```bash
ubuntu@web:~$
ubuntu@web:~$ sudo vim /var/www/html/index.html
```

Pada line 224 ubah dari `It works!` menjadi `It works inside a LXD container! #Belajar Linux ID` contoh

```bash
# Before 
222         <div class="section_header section_header_red">
223           <div id="about"></div>
224           It works!
225         </div>

# After
222         <div class="section_header section_header_red">
223           <div id="about"></div>
224           It works inside a LXD container! #Belajar Linux ID
225         </div>
226         <div class="content_section_text">
```

Jika sudah silakan keluar dari linux container menggunakan command `exit`

```bash
ubuntu@web:~$ exit
logout
ubuntu@lxd-belajarlinux:~$
```

Untuk dapat di akses dari public apache web server yang ada di dalam linux container diperlukan proxy untuk mapping  atau expose ip default (localhost) linux container ke `0.0.0.0:port_service`  contoh

```bash
ubuntu@lxd-belajarlinux:~$ lxc config device add web myport80 proxy listen=tcp:0.0.0.0:80 connect=tcp:127.0.0.1:80
Device myport80 added to web
ubuntu@lxd-belajarlinux:~$
```

Perintah diatas artinya Anda menambahkan proxy untuk webserver port 80 yang dapat diakses public ke linux container **(web)**. 

Verifikasi dengan cara akses IP (host) atau domain/subdomain yang sudah di pointing ke IP Host melalui browser

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/apache/1.png)

Saat ini apache web server sudah dapat diakses dengan normal. Selanjutnya kita install PHP. 

**Apa itu PHP?**

PHP singkatan dari Hypertext Preprocessor. PHP sebuah bahasa  pemrograman server-side biasanya digunakan bersama dengan CSS dan HTML. PHP adalah salah satu bahasa pemrograman yang paling banyak  digunakan. Banyak CMS dan Frameworks seperti WordPress, Magento, dan  lavarel dibangun menggunakan PHP.

Untuk melakukan instalasi PHP di linux container ubuntu hampir sama dengan instalasi apache sebelumnya, dimana Anda perlu login ke linux container-nya terlebih dahulu contoh login ke linux container as root. 

```bash
ubuntu@lxd-belajarlinux:~$ lxc exec web bash
root@web:~#
```

Pastikan service web server apache running

```bash
root@web:~#
root@web:~# systemctl restart apache2
root@web:~# systemctl status apache2
● apache2.service - The Apache HTTP Server
     Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2020-12-28 04:54:08 UTC; 6s ago
       Docs: https://httpd.apache.org/docs/2.4/
    Process: 9057 ExecStart=/usr/sbin/apachectl start (code=exited, status=0/SUCCESS)
   Main PID: 9061 (apache2)
      Tasks: 6 (limit: 2344)
     Memory: 10.0M
     CGroup: /system.slice/apache2.service
             ├─9061 /usr/sbin/apache2 -k start
             ├─9062 /usr/sbin/apache2 -k start
             ├─9063 /usr/sbin/apache2 -k start
             ├─9064 /usr/sbin/apache2 -k start
             ├─9065 /usr/sbin/apache2 -k start
             └─9066 /usr/sbin/apache2 -k start

Dec 28 04:54:08 web systemd[1]: Starting The Apache HTTP Server...
Dec 28 04:54:08 web systemd[1]: Started The Apache HTTP Server.
root@web:~#
```

PHP yang akan diinstall yaitu PHP versi 7.4, silakan install library yang dibutuhkan

```bash
root@web:~#
root@web:~# sudo apt install php libapache2-mod-php
```

Selanjutnya install extension PHP yang dibutuhkan

```bash
root@web:~#
root@web:~# apt install php-mysql php-gd
```

Cek versi PHP

```bash
root@web:~# php -v
PHP 7.4.3 (cli) (built: Oct  6 2020 15:47:56) ( NTS )
Copyright (c) The PHP Group
Zend Engine v3.4.0, Copyright (c) Zend Technologies
    with Zend OPcache v7.4.3, Copyright (c), by Zend Technologies
root@web:~#
```

Buat file `info.php` untuk melihat detail informasi dari PHP 7.4

```bash
root@web:~#
root@web:~# vim /var/www/html/info.php
```

Contoh file `info.php`

```bash
<?php
phpinfo();
```

Jika sudah silakan akses URL web server ditambah `/info.php` hasilnya seperti berikut

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/apache/2.png)

Selamat mencoba 😁
