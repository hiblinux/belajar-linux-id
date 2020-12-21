---
author: nurhamim
layout: post
title: Struktur Konfigurasi dan Perintah Dasar Nginx di CentOS 8
description: 'Memahami struktur konfigurasi sebuah service sangat dibutuhkan dengan kita paham struktur nya, maka akan mempermudah kita dalam penggunaannya'
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/a9.png'
featured: true
date: '2020-08-21 14:18:41'
categories:
- centos
- nginx
---

Memahami struktur konfigurasi sebuah service sangat dibutuhkan dengan kita paham struktur nya, maka akan mempermudah kita dalam penggunaannya. Selain itu kita perlu mengetahui juga dasar – dasar perintah dari service tersebut dengan kita tahu dasar nya, akan mempermudah kita dalam pengelolaannya.

Pada tutorial ini akan kami berikan sedikit informasi terkait struktur konfigurasi dan perintah dasar yang sering digunakan di Nginx.

## # Struktur Konfigurasi

Berikut ini merupakan beberapa struktur konfigurasi yang sering digunakan dan yang perlu Anda ketahui di web server Nginx pada CentOS 8.

- Semua file konfigurasi Nginx berada di direktori _/etc/nginx_
- File konfigurasi utama Nginx adalah _/etc/nginx/nginx.conf_
- Semua file konfigurasi Nginx diakhiri dengan _ **.conf** _ yang berada di direktori _/etc/nginx/conf.d_ termasuk dalam file konfigurasi default atau utama nginx
- Untuk mempermudah dalam pengelolaan domain di web server nginx, nginx sangat menyarankan untuk membuat server block domain sendiri – sendiri (sesuaikan dengan domain Anda masing – masing)
- Untuk konfigurasi server block domain dapat dilakukan di direktori _/etc/nginx/conf.d/namadomainanda.conf_ .
- File log Nginx (access\_log dan error\_log) berada di direktori _/var/log/nginx/_. Disarankan setiap server block domain memiliki file log masing – masing untuk mempermudah dalam pengelolaan dan troubleshooting.
- Anda dapat mengatur direktori root direktori domain Anda ke lokasi yang Anda inginkan. Lokasi yang paling umum digunakan untuk webroot yaitu :

    # /home/<user_name>/<site_name>
    # /usr/share/nginx/html
    # /var/www/html/<site_name>
    # /opt/<site_name>

_Noted: struktur konfigurasi diatas tidak diperuntukan untuk instalasi nginx dengan metode compile, karena untuk nginx yang di compile akan berbeda dengan yang diatas._

## # Perintah Dasar Nginx

Berikut ini beberapa perintah – perintah dasar yang sering digunakan di web server Nginx

Untuk menghentikan (stop) nginx dapat menjalankan perintah

    [root@tutorial ~]# systemctl stop nginx

Untuk menjalankan kembali nginx gunakan perintah

    [root@tutorial ~]# systemctl start nginx

Sedangkan untuk melakukan restart nginx gunakan perintah

    [root@tutorial ~]# systemctl restart nginx

Jika Anda telah melakukan sebuah perubahan konfigurasi pada nginx, maka Anda perlu melakukan opsi reload silakan jalankan perintah berikut

    [root@tutorial ~]# systemctl reload nginx
    atau
    [root@tutorial ~]# nginx -s reload

Untuk menonaktifkan nginx secara otomatis running di kala VM atau VPS Anda reboot atau restart jalankan perintah berikut

    [root@tutorial ~]# systemctl disable nginx
    Removed /etc/systemd/system/multi-user.target.wants/nginx.service.
    [root@tutorial ~]#

Sebaliknya jika Anda ingin set service nginx otomatis running dikala server melakukan reboot atau restart silakan jalankan perintah berikut

    [root@tutorial ~]# systemctl enable nginx
    Created symlink /etc/systemd/system/multi-user.target.wants/nginx.service → /usr/lib/systemd/system/nginx.service.
    [root@tutorial ~]#

Selamat mencoba 😁