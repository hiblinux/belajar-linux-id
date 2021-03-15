---
title: Install Akaunting Di Ubuntu 20.04 LTS
description: 'instalasi software accounting menggunakan Akaunting dimana software ini berbasis open source sangat cocok digunakan untuk tracking personal finance atau usaha sekala kecil dan menengah'
lang: id_ID
date: 2021-03-15 16:40 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/akaunting-cove.png
categories:
 - cms
 - ubuntu
 - nginx
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini kami akan melakukan instalasi software accounting menggunakan **Akaunting** dimana software ini berbasis open source sangat cocok digunakan untuk tracking personal finance atau usaha sekala kecil dan menengah. 

## Fitur Akaunting

Akaunting memiliki banyak fitur yang dapat Anda manfaatkan untuk kebutuhan finance diantaranya: 

- Sepenuhnya gratis dan open source.
- Berbasis web base interface dan dapat dilihat secara online dimana saja di Mac, PC, tablet atau ponsel Anda.
- Panel Admin & Klien Multi bahasa
- Didesain Untuk Bisnis Kecil - Menengah
- 100% Kepemilikan Data Keuangan (private)
- Pembaruan GRATIS Seumur Hidup
- Anda dapat membuat klien dan mengirim faktur pajak ke klien langsung.
-  Anda juga dapat mengatur kata sandi sehingga mereka dapat mengakses portal klien.
- Kirim faktur pajak secara profesional ke klien dan mulai menerima pembayaran online, tanpa komisi/biaya transaksi.
- Tambahkan setoran ke dan transfer antar rekening dan jaga agar saldo rekening bank Anda tetap aktif.
- Buat vendor sehingga Anda dapat menetapkan tagihan dan pembayaran kepada mereka dan kemudian memfilter transaksi mereka dengan mudah.
- Buat dan kelola tagihan agar keuangan Anda selalu akurat dan sehat. Ketahui apa dan kapan harus membayar.
- Tambahkan biaya yang tidak dapat ditagih sebagai pembayaran untuk menjaga saldo rekening bank/kas Anda tetap mutakhir.
- Aktifkan pelacakan atau tracking inventaris dan kelola barang saat masuk dan keluar. Item juga mempercepat pembuatan faktur pajak.
- Buat rekening bank dan kas tak terbatas dan lacak saldo pembukaan dan saat ini.
- Kirim faktur dan tambahkan pengeluaran dalam mata uang apa pun dan biarkan sistem mengonversinya ke dalam mata uang utama Anda.
- Kelola keuangan beberapa perusahaan dari satu panel admin akaunting. Tetapkan pengguna ke perusahaan yang berbeda.
- Dapatkan laporan keuangan terperinci untuk membantu Anda memvisualisasikan dengan lebih baik semua informasi yang Anda butuhkan untuk meningkatkan bisnis Anda.

## Instalasi Akaunting

Sebelum melakukan instalasi akaunting pastikan Anda sudah melakukan instalasi LEMP stack karena disini kami akan menggunakan nginx sebagai web server. 

Untuk melakukan instalasi LEMP stack dapat melalui tautan berikut: **[Install LEMP stack di Ubuntu 20.04 LTS](https://belajarlinux.id/install-lemp-stack-di-ubuntu-20-04-lts/)**

Apabila Anda sudah melakukan intalasi LEMP stack silakan unduh file **Akaunting** menggunakan command `wget` di Linux seperti berikut

```bash
ubuntu@lemp-belajarlinux:~$ wget -O Akaunting.zip https://akaunting.com/download.php?version=latest
```

Selanjutnya membuat direktori **Akaunting** di root direktori nginx nantinya direktori ini digunakan sebagai root direktori dari **Akaunting** 

```bash
ubuntu@lemp-belajarlinux:~$ sudo mkdir -p /usr/share/nginx/akaunting
```

Install `unzip` dan unzip file **Akaunting** yang sudah di unduh ke direktori root `akaunting`

```bash
ubuntu@lemp-belajarlinux:~$ sudo apt install unzip
ubuntu@lemp-belajarlinux:~$ sudo unzip Akaunting.zip -d /usr/share/nginx/akaunting/
```

Memberikan hak owner ke direktori root **Akauting**

```bash
ubuntu@lemp-belajarlinux:~$ sudo chown www-data:www-data /usr/share/nginx/akaunting/ -R
```

Jika sudah selanjutnya membuat database untuk **Akaunting**

```bash
ubuntu@lemp-belajarlinux:~$ sudo mysql -u root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 58209
Server version: 10.3.25-MariaDB-0ubuntu0.20.04.1 Ubuntu 20.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> create database akaunting;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> create user 'accountant'@'localhost' identified by 'pwakaunting';
Query OK, 0 rows affected (0.015 sec)

MariaDB [(none)]> grant all privileges on akaunting.* to 'accountant'@'localhost';
Query OK, 0 rows affected (0.001 sec) 

MariaDB [(none)]> flush privileges;
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> exit;
Bye
ubuntu@lemp-belajarlinux:~$
```

Install beberapa module PHP yang dibutuhkan, disini kami menggunakan PHP versi 7.4

```bash
ubuntu@lemp-belajarlinux:~$ sudo apt install php-imagick php7.4-common php7.4-mysql php7.4-gd php7.4-bcmath php7.4-json php7.4-curl php7.4-zip php7.4-xml php7.4-mbstring php7.4-bz2 php7.4-intl -y
```

Selanjutnya membuat server block nginx untuk **Akaunting**

```bash
ubuntu@lemp-belajarlinux:~$ sudo vim /etc/nginx/conf.d/akaunting.conf
```

Isi dari server block nginx nya sebagai berikut: 

```bash
server {
    listen      80;
    server_name accounting.belajarlinux.my.id;

    root /usr/share/nginx/akaunting/;
    index index.php index.html index.htm;
    charset utf-8;
    error_log /var/log/nginx/akaunting.error;
    access_log /var/log/nginx/akaunting.access;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-XSS-Protection "1; mode=block";
    add_header X-Content-Type-Options "nosniff";

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    # Prevent Direct Access To Protected Files
    location ~ \.(env|log) {
        deny all;
    }

    # Prevent Direct Access To Protected Folders
    location ~ ^/(^app$|bootstrap|config|database|resources|routes|storage|tests|artisan) {
        deny all;
    }

    # Prevent Direct Access To modules/vendor Folders Except Assets
    location ~ ^/(modules|vendor)\/(.*)\.((?!ico|gif|jpg|jpeg|png|js|css|less|sass|font|woff|woff2|eot|ttf|svg).)*$ {
        deny all;
    }

    error_page 404 /index.php;

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/run/php/php7.4-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }

}
```

*Catatan: Sesuaikan server_name dengan nama sub domain atau domain yang ingin Anda gunakan*

Jika sudah silakan simpan dan verisikasi konfigurasi nginx

```bash
ubuntu@lemp-belajarlinux:~$ sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
ubuntu@lemp-belajarlinux:~$
```

Reload web server nginx

```bash
ubuntu@lemp-belajarlinux:~$ sudo systemctl reload nginx
ubuntu@lemp-belajarlinux:~$
```

Disini kami langsung menggunakan ssl gratis dari letsencrypt, untuk install ssl letsencrypt dapat menggunakan cerbot, silakan install certbot terlebih dahulu dan jalankan satu baris perintah berikut untuk instalasi ssl gratis dari letsencrypt.

```bash
ubuntu@lemp-belajarlinux:~$ sudo certbot --nginx --agree-tos --redirect --hsts --staple-ocsp --email me@belajarlinux.id -d accounting.belajarlinux.my.id
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator nginx, Installer nginx
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for accounting.belajarlinux.my.id
Waiting for verification...
Cleaning up challenges
Deploying Certificate to VirtualHost /etc/nginx/conf.d/akaunting.conf
Redirecting all traffic on port 80 to ssl in /etc/nginx/conf.d/akaunting.conf

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Congratulations! You have successfully enabled
https://accounting.belajarlinux.my.id

You should test your configuration at:
https://www.ssllabs.com/ssltest/analyze.html?d=accounting.belajarlinux.my.id
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/accounting.belajarlinux.my.id/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/accounting.belajarlinux.my.id/privkey.pem
   Your cert will expire on 2021-06-12. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot again
   with the "certonly" option. To non-interactively renew *all* of
   your certificates, run "certbot renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le

ubuntu@lemp-belajarlinux:~$
```

Keterangan:

- **–nginx**: Gunakan authentikan nginx untuk instalasi SSL
- **–agree-tos**: Menyetujui  terms of service dari Let’s Encrypt
- **–redirect**: Enforce HTTPS by adding 301 redirect.
- **–hsts**: Mengaktifkan HTTP Strict Transport Security untuk melindungi dari serangan stripping SSL/TLS.
- **–staple-ocsp**: Enable OCSP Stapling.
- **–email**: Email yang digunakan untuk pendaftaran dan pemulihan kontak.
- **-d** flag diikuti dengan daftar nama domain atau subdomain, dipisahkan dengan koma. Anda dapat menambahkan hingga 100 nama domain.

Jika sudah silakan akses sub domain atau domain yang sudah Anda tentukan di server block nginx dan akses melalui web browser lalu pilih Bahasa yang ingin digunakan, silakan pilih *English >> Next*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/akau01.png)

Kemudian, input username, password dan nama database yang telah dibuat sebelumnya lalu *Next*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/akau02.png)

Selanjutnya mengatur Administartor Akaunting silakan input nama Perusahan Anda atau nama usaha Anda dan input email Administrator beserta password lalu klik *Next*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/akau03.png)

Silakan login ke Administrator Akaunting menggunakan email admin dan password yang sudah ditentukan sebelumnya

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/akau04.png)

Selanjutnya setup basic instalasi poin pertama disini Anda dapat menentukan Tax number, Alamat dll. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/akau05.png)

Poin kedua Anda dapat memilih mata uang yang ingin Anda gunakan

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/akau06.png)

Anda dapat menambahkan Tax

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/akau07.png)

Sampai disini Anda sudah berhasil melakukan setup basic instalasi Akaunting dan silakan menuju ke dashboard Akaunting

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/akau08.png)

Berikut dashboard Akaunting

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/akau09.png)

Sampai disini Anda sudah berhasil melakukan instalasi **Akaunting** selanjutnya Anda dapat melakukan ekplorasi cara penggunaan **Akaunting** secara mandiri, berikut link dokumentasi **Akaunting**: **[Documentation Akaunting](https://akaunting.com/docs)**.

Selamat mencoba 😁