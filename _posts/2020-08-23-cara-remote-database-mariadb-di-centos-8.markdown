---
author: nurhamim
layout: post
title: Cara Remote Database MariaDB di CentOS 8
description: 'Untuk melakukan remote akses database MariaDB di CentOS 8 itu sangat mudah' 
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/a18.png'
featured: true
date: '2020-08-23 10:52:29'
categories:
- centos
- database
---

Melakukan remote atau akses database server dari public dari public tentu bukanlah hal yang asing bagi Anda yang bergelut di dunia SysAdmin ataupun Programmer baik untuk kebutuhan website dan yang lainnya.

Dengan mengakses database dari public menggunakan aplikasi database client akan mempermudah kita dalam pengelolaan database dan lebih fleksibel serta simple tentunya karena kita tidak perlu login langsung ke sisi server database hanya untuk akses database saja.

Namun ada hal yang perlu diperhatikan dari segi security, jika kita meng-ekspost port database default 3306 ke public, resiko yang akan kita dapatkan yaitu adanya serangan atau hacking dari luar biasanya brutforce, SQL Injection, dan yang lainnya.

Dengan demikian untuk mengikuti tutorial ini harap dipikirkan terlebih dahulu dari segi security dan yang lainnya.

Selanjutnya untuk mengikuti tutorial ini kiranya dari sisi Anda sudah melakukan instalasi database, jika belum silakan mengikuti tutorial berikut: **_[Cara Instalasi Database MariaDB di CentOS 8](/cara-instalasi-database-mariadb-di-centos-8/)_**

Pertama yang harus kita lakukan yaitu allow _bind-address_ di konfigurasi mariadb / mysql server.

    [root@tutorial ~]#
    [root@tutorial ~]# vim /etc/my.cnf.d/mariadb-server.cnf

Cari _bind-address_ dan hilangkan tanga _#_ nya

    # Allow server to accept connections on all interfaces.
    #
    #
    bind-address=0.0.0.0

Jika sudah sekarang kita coba membuat user dan database untuk di uji coba

    [root@tutorial ~]# mysql -u root -p
    Enter password:
    Welcome to the MariaDB monitor. Commands end with ; or \g.
    Your MariaDB connection id is 9
    
    # instructions in http://fedoraproject.org/wiki/Systemd
    Server version: 10.3.17-MariaDB MariaDB Server
    
    Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.
    
    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
    
    MariaDB [(none)]> CREATE DATABASE belajarlinuxdb;
    Query OK, 1 row affected (0.000 sec)
    
    MariaDB [(none)]> create user 'belajarlinux'@'%' IDENTIFIED BY 'secret';
    Query OK, 0 rows affected (0.000 sec)
    
    MariaDB [(none)]> grant all privileges on belajarlinuxdb.* TO 'belajarlinux'@'%';
    Query OK, 0 rows affected (0.000 sec)
    
    MariaDB [(none)]> flush privileges;
    Query OK, 0 rows affected (0.000 sec)
    
    MariaDB [(none)]> quit
    Bye
    [root@tutorial ~]#

_Keterangan:_

- Nama database nya yaitu _belajarlinuxdb_
- User database nya _belajarlinux_
- Perintah _grant all privileges_ mengartikan _database belajarlinux db_ dapat diakses dari IP manapun menggunakan user _belajarlinux._
- Perintah _Identified By_ digunakan untuk set password user database. 

Jika sudah silakan restart service database dan pastikan port database 3306 sudah listen public _0.0.0.0_ sebagai berikut

    [root@tutorial ~]# systemctl restart mariadb
    [root@tutorial ~]# netstat -ant | grep 3306
    tcp 0 0 0.0.0.0:3306 0.0.0.0:* LISTEN
    [root@tutorial ~]#

Untuk mencoba nya jika Anda menggunakan Linux misalnya Ubuntu DE Anda dapat install mysql client dan coba akses dari terminal Ubuntu Anda berikut perintahnya

    mysql -u belajarlinux -h IP_VM -p

_Keterangan:_

- _-u : user database_
- _-h: IP VM / VPS database_
- _-p: password database_

Jika berhasil akan seperti berikut hasilnya.

    ubuntu@my-jumper:~$
    ubuntu@my-jumper:~$ mysql -u belajarlinux -h 103.89.7.26 -p
    Enter password:
    Welcome to the MySQL monitor. Commands end with ; or \g.
    Your MySQL connection id is 8
    Server version: 5.5.5-10.3.17-MariaDB MariaDB Server
    
    Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.
    
    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.
    
    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
    
    mysql> show databases;
    +--------------------+
    | Database |
    +--------------------+
    | belajarlinuxdb |
    | information_schema |
    +--------------------+
    2 rows in set (0.01 sec)
    
    mysql>

Selain itu untuk akses database ini Anda dapat menggunakan aplikasi misalnya _MySQL Workbench, HeidiSQL_ dan masih banyak lainnya.

Kali ini kami akan mencontohkan akses database menggunakann _Heidi SQL_ dimana aplikasi open source dan dapat berjalan di multi platform bisa di _linux, Windows, MacOS_ dan yang lainnya untuk mengunduhnya dapat dilakukan pada link berikut: https://www.heidisql.com/download.php

Silakan buka aplikasi _HeidiSQL_ Anda masing ??? masing lalu isikan _IP, Port, dan Username Password Database Server_ Anda.

<figure class="wp-block-image size-large"><img loading="lazy" width="865" height="411" src="/content/images/wordpress/2020/08/image-47.png" alt="" class="wp-image-172" srcset="/content/images/wordpress/2020/08/image-47.png 865w, /content/images/wordpress/2020/08/image-47-300x143.png 300w, /content/images/wordpress/2020/08/image-47-768x365.png 768w" sizes="(max-width: 865px) 100vw, 865px"></figure>

Jika berhasil akan seperti berikut

<figure class="wp-block-image size-large"><img loading="lazy" width="934" height="593" src="/content/images/wordpress/2020/08/image-48.png" alt="" class="wp-image-173" srcset="/content/images/wordpress/2020/08/image-48.png 934w, /content/images/wordpress/2020/08/image-48-300x190.png 300w, /content/images/wordpress/2020/08/image-48-768x488.png 768w" sizes="(max-width: 934px) 100vw, 934px"></figure>

Saat ini database server Anda sudah bisa di remote atau akses dari public.

Selamat mencoba ????