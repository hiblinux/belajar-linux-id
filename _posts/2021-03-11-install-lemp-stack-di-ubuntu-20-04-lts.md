---
title: Install LEMP stack di Ubuntu 20.04 LTS
description: 'LEMP stack sendiri sebuah akronis atau gabungan dari (Linux, Nginx (dibaca Engine-X), MariaDB/MySQL dan PHP) dimana sistem operasi yang digunakan Linux, dan web server yang dipakai Nginx, untuk database yang digunakan MariaDB/MySQL dan bahasa pemrograman yang digunakan PHP'
lang: id_ID
date: 2021-03-11 01:46 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lemp-stack.png
categories:
 - nginx
 - php
 - database
---

[Belajar Linux ID](https://belajarlinux.id) - Pada tutorial kali ini kami akan membahas tentang LEMP stack di Ubuntu 20.04 LTS. LEMP stack sendiri sebuah akronim atau gabungan dari (Linux, Nginx (dibaca Engine-X), MariaDB/MySQL dan PHP) dimana sistem operasi yang digunakan Linux, dan web server yang dipakai Nginx, untuk database yang digunakan MariaDB/MySQL dan bahasa pemrograman yang digunakan PHP. 

Jika Anda memiliki website dinamis seperti CMS WordPress atau Framework Laravel, maka Anda membutuhkan semua service diatas.

*Baca Juga:*

- *[Cara Install CMS WordPress di Linux Container (LXD)](https://belajarlinux.id/cara-install-wordpress-di-linux-container/)*
- *[Install Laravel pada Ubuntu Server 20.04 LTS](https://belajarlinux.id/install-laravel-pada-ubuntu-20.04-LTS/)*
- *[Ubuntu: Install LAMP Stack di  Ubuntu 20.04 LTS](https://belajarlinux.id/install-lamp-stack-di-ubuntu-20-04/)*

Tutorial instalasi LEMP stack ini dapat dilakukan di *VM (virtual machine), VPS (virtual private server) atau instance* dan pastikan untuk OS yang digunakan yaitu Ubuntu 20.04 LTS. 

## Tahapan Instalasi

### Update Sistem Operasi

Tahapan pertama yang harus dilakukan sebelum memasuki tahapan instalasi service yaitu melakukan update sistem operasi Ubuntu 20.04 LTS terlebih dahulu menggunakan perintah berikut:

```bash
ubuntu@lemp-belajarlinux:~$ sudo apt update
ubuntu@lemp-belajarlinux:~$ sudo apt upgrade -y
```

### Instalasi Web Server Nginx

Apabila Anda sudah melakukan update sistem operasi, langkah selanjutnya yaitu install web server nginx. **[Nginx](https://www.nginx.com/)** adalah salah satu web server yang powerfull dan berbasis open source (bebas dan  Free), untuk melakukan instalasi web server nginx di Ubuntu 20.04 LTS dapat menggunakan perintah berikut:

```bash
ubuntu@lemp-belajarlinux:~$ sudo apt install nginx -y
```

Enable service nginx, tujuannya apabila sistem operasi Anda reboot/restart, maka service nginx otomatis `running`

```bash
ubuntu@lemp-belajarlinux:~$
ubuntu@lemp-belajarlinux:~$ sudo systemctl enable nginx
Synchronizing state of nginx.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable nginx
ubuntu@lemp-belajarlinux:~$
```

Jika sudah, start dan pastikan status nginx Anda `running`

```bash
ubuntu@lemp-belajarlinux:~$ sudo systemctl start nginx
ubuntu@lemp-belajarlinux:~$ sudo systemctl status nginx
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2021-03-02 23:12:37 UTC; 16s ago
       Docs: man:nginx(8)
   Main PID: 32758 (nginx)
      Tasks: 3 (limit: 2344)
     Memory: 4.3M
     CGroup: /system.slice/nginx.service
             ├─32758 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
             ├─32759 nginx: worker process
             └─32760 nginx: worker process

Mar 02 23:12:37 lemp-belajarlinux.id systemd[1]: Starting A high performance web server and a reverse proxy server...
Mar 02 23:12:37 lemp-belajarlinux.id systemd[1]: Started A high performance web server and a reverse proxy server.
ubuntu@lemp-belajarlinux:~$
```

Untuk melihat versi nginx yang kita gunakan jalankan perintah berikut: 

```bash
ubuntu@lemp-belajarlinux:~$ nginx -v
nginx version: nginx/1.18.0 (Ubuntu)
ubuntu@lemp-belajarlinux:~$
```

Anda juga dapat melakukan verifikasi nginx dengan cara akses IP VM, VPS atau Instance atau domain/subdomain yang telah di pointing seperti berikut

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lemp1.png)

### Instalasi Database MariaDB

Database yang akan digunakan kali ini yaitu MariaDB. MariaDB adalah sistem manajemen database relasional yang dikembangkan  dari MySQL. MariaDB dikembangkan oleh komunitas pengembang yang sebelumnya berkontribusi untuk database MySQL. Untuk melakukan instalasi database server dan client MariaDB di Ubuntu 20.04 LTS dapat menggunakan perintah berikut: 

```bash
ubuntu@lemp-belajarlinux:~$ sudo apt install mariadb-server mariadb-client -y
```

Tunggu proses instalasi sampai selesai, dan silakan enable, start mariadb dan pastikan status database MariaDB running

```bash
ubuntu@lemp-belajarlinux:~$
ubuntu@lemp-belajarlinux:~$ sudo systemctl enable mariadb
ubuntu@lemp-belajarlinux:~$ sudo systemctl start mariadb
ubuntu@lemp-belajarlinux:~$ systemctl status mariadb
● mariadb.service - MariaDB 10.3.25 database server
     Loaded: loaded (/lib/systemd/system/mariadb.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2021-03-02 23:27:57 UTC; 50s ago
       Docs: man:mysqld(8)
             https://mariadb.com/kb/en/library/systemd/
   Main PID: 33833 (mysqld)
     Status: "Taking your SQL requests now..."
      Tasks: 31 (limit: 2344)
     Memory: 64.6M
     CGroup: /system.slice/mariadb.service
             └─33833 /usr/sbin/mysqld
```

Untuk melihat versi database, gunakan perintah berikut: 

```bash
ubuntu@lemp-belajarlinux:~$ mariadb --version
mariadb  Ver 15.1 Distrib 10.3.25-MariaDB, for debian-linux-gnu (x86_64) using readline 5.2
ubuntu@lemp-belajarlinux:~$
```

Untuk konfigurasi password root mariadb gunakan perintah berikut: 

```bash
ubuntu@lemp-belajarlinux:~$ sudo mysql_secure_installation
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lemp2.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lemp3.png)

Test username root mariadb yang sudah di konfigurasi sebelumnya

```bash
ubuntu@lemp-belajarlinux:~$ sudo mysql -u root -p
Enter password: [INPUT PASSWORD ROOT MARIADB]
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 47
Server version: 10.3.25-MariaDB-0ubuntu0.20.04.1 Ubuntu 20.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
MariaDB [(none)]> exit;
Bye
ubuntu@lemp-belajarlinux:~$
```

### Instalasi PHP 7.4

Tahapan kali ini yaitu melakukan instalasi PHP. PHP adalah bahasa pemrograman script server-side yang didesain untuk pengembangan web. PHP yang akan diinstall kali ini yaitu PHP versi 7.4, berikut cara install PHP 7.4 di Ubuntu 20.04 LTS

```bash
ubuntu@lemp-belajarlinux:~$ sudo apt install php7.4 php7.4-fpm php7.4-mysql php-common php7.4-cli php7.4-common php7.4-json php7.4-opcache php7.4-readline php7.4-mbstring php7.4-xml php7.4-gd php7.4-curl -y
```

Untuk melihat versi PHP yang telah Anda install gunakan perintah `php -v`

```bash
ubuntu@lemp-belajarlinux:~$ php -v
PHP 7.4.3 (cli) (built: Oct  6 2020 15:47:56) ( NTS )
Copyright (c) The PHP Group
Zend Engine v3.4.0, Copyright (c) Zend Technologies
    with Zend OPcache v7.4.3, Copyright (c), by Zend Technologies
ubuntu@lemp-belajarlinux:~$
```

Jika Anda menggunakan PHP-FPM, silakan start dan enable PHP-FPM

```bash
ubuntu@lemp-belajarlinux:~$ sudo systemctl start php7.4-fpm
ubuntu@lemp-belajarlinux:~$ sudo systemctl enable php7.4-fpm
Synchronizing state of php7.4-fpm.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable php7.4-fpm
ubuntu@lemp-belajarlinux:~$
```

Pastikan status PHP-FPM sudah running

```bash
ubuntu@lemp-belajarlinux:~$ sudo systemctl status php7.4-fpm
● php7.4-fpm.service - The PHP 7.4 FastCGI Process Manager
     Loaded: loaded (/lib/systemd/system/php7.4-fpm.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2021-03-02 23:37:16 UTC; 34s ago
       Docs: man:php-fpm7.4(8)
   Main PID: 45234 (php-fpm7.4)
     Status: "Processes active: 0, idle: 2, Requests: 0, slow: 0, Traffic: 0req/sec"
      Tasks: 3 (limit: 2344)
     Memory: 9.5M
     CGroup: /system.slice/php7.4-fpm.service
             ├─45234 php-fpm: master process (/etc/php/7.4/fpm/php-fpm.conf)
             ├─45238 php-fpm: pool www
             └─45239 php-fpm: pool www

Mar 02 23:37:16 lemp-belajarlinux.id systemd[1]: Starting The PHP 7.4 FastCGI Process Manager...
Mar 02 23:37:16 lemp-belajarlinux.id systemd[1]: Started The PHP 7.4 FastCGI Process Manager.
ubuntu@lemp-belajarlinux:~$
```

Untuk membuat server blocks nginx dapat dilakukan melalui direktori  `/etc/nginx/conf.d/` contohnya seperti berikut

```bash
ubuntu@lemp-belajarlinux:~$ cd /etc/nginx/conf.d/
ubuntu@lemp-belajarlinux:/etc/nginx/conf.d$
ubuntu@lemp-belajarlinux:/etc/nginx/conf.d$ sudo vim lemp.belajarlinux.my.id.conf
```

Berikut contoh server blocks nginx

```bash
server {
  listen 80;
  server_name lemp.belajarlinux.my.id;
  root /usr/share/nginx/html/;
  index index.php index.html index.htm index.nginx-debian.html;

  location / {
    try_files $uri $uri/ /index.php;
  }

  location ~ \.php$ {
    fastcgi_pass unix:/run/php/php7.4-fpm.sock;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    include fastcgi_params;
    include snippets/fastcgi-php.conf;
  }

 # A long browser cache lifetime can speed up repeat visits to your page
  location ~* \.(jpg|jpeg|gif|png|webp|svg|woff|woff2|ttf|css|js|ico|xml)$ {
       access_log        off;
       log_not_found     off;
       expires           360d;
  }

  # disable access to hidden files
  location ~ /\.ht {
      access_log off;
      log_not_found off;
      deny all;
  }
}
```

Verifikasi konfigurasi server blocks nginx, menggunakan perintah `nginx -t`

```bash
ubuntu@lemp-belajarlinux:/etc/nginx/conf.d$ sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
ubuntu@lemp-belajarlinux:/etc/nginx/conf.d$
```

Jika sudah silakan reload nginx 

```bash
ubuntu@lemp-belajarlinux:/etc/nginx/conf.d$ sudo systemctl reload nginx
ubuntu@lemp-belajarlinux:/etc/nginx/conf.d$
```

Selanjutnya membuat php info untuk melihat semua module php yang sudah terinstall melalui web

```bash
ubuntu@lemp-belajarlinux:/etc/nginx/conf.d$ sudo vim /usr/share/nginx/html/info.php
```

Berikut script `info.php` 

```php
<?php 
phpinfo(); 
?>
```

Akses sub domain atau IP melalui browser dengan `/info.php`

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lemp4.png)

Sampai disini Anda sudah berhasil melakukan instalasi LEMP stack. Apabila terdapat pertanyaan mengenai instalasi LEMP stack, silakan komentar di bawah ya guys. 

Selamat mencoba 😁