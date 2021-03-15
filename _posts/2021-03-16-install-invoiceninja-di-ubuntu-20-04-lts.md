---
title: Install InvoiceNinja Di Ubuntu 20.04 LTS
description: 'InvoiceNinja merupakan software open source (terbuka) yang dapat digunakan secara gratis  dimana InvoiceNinja sebagai salah satu pilihan untuk kebutuhan platform invoice (faktur)'
lang: id_ID
date: 2021-03-16 00:23 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/invoicenin-cove.png
categories:
 - cms
 - ubuntu
 - nginx
---

[Belajar Linux ID](https://belajarlinux.id) - [InvoiceNinja](https://www.invoiceninja.com/) merupakan software open source (terbuka) yang dapat digunakan secara gratis  dimana InvoiceNinja sebagai salah satu pilihan untuk kebutuhan platform invoice (faktur). 

## Fitur InvoiceNinja

- Dengan InvoiceNinja, Anda dapat mengirim invoice ke klien Anda dengan menggunakan nama domain dan merek Anda sendiri.
- Mengelola invoice untuk beberapa bisnis, semuanya dalam satu akun.
- Hemat waktu karena secara otomatis dapat dilakukan set tagihan ke klien untuk jangka panjang secara berulang.
- Membuat dan mengirim proposal menarik ke pelanggan Anda dengan mudah.
- Melampirkan file pihak ketiga (3rd Party) ke Invoice.    
- Membuat Project Tasks & Track Time
- Mengatur dan merencarankan pekerjaan klien Anda dengan alat manajemen proyek visual.    
- Mengizinkan klien Anda untuk melihat semua transaksi dengan Anda dalam satu pandangan.    
- Otomatisasi Zapier memungkinkan Anda mentransfer data antara akun invoice dan aplikasi populer termasuk Gmail, Google Sheets, QuickBooks Online, Slack, Pipeline, MailChimp, dan ratusan lainnya. 
- Meminta setoran & pembayaran sebagian menggunakan invoice yang sama berulang kali.    
- Notifikasi tentang invoice.   
- Dan masih banyak lagi 

Untuk mengikuti tutorial ini pastikan Anda sudah memiliki VM/VPS/Instance Ubuntu 20.04 LTS dan sudah melakukan instalasi **[LEMP stack](https://belajarlinux.id/install-lemp-stack-di-ubuntu-20-04-lts/)**, jika belum melakukan instalasi silakan merujuk pada tautan berikut: **[Install LEMP stack di Ubuntu 20.04 LTS](https://belajarlinux.id/install-lemp-stack-di-ubuntu-20-04-lts/)**.

Apabila Anda sudah melakukan instalasi LEMP stack, silakan unduh file InvoiceNinja menggunakan command `wget` seperti berikut:

```bash
ubuntu@lemp-belajarlinux:~$ wget -O invoice-ninja.zip https://download.invoiceninja.com/
```

Kemudian, install `unzip` dan silakan ekstrak file `InvoiceNinja` ke root direktori yang diinginkan, disini kami menggunkan nginx, untuk root direktori yang kami gunakan yaitu `/usr/share/nginx/`

```bash
ubuntu@lemp-belajarlinux:~$ sudo apt install unzip
ubuntu@lemp-belajarlinux:~$ sudo unzip invoice-ninja.zip -d /usr/share/nginx/
```

Selanjutnya langkah opsional yaitu mengubah nama direktori, jika Anda tidak ingin mengubahnya silakan di skip

```bash
ubuntu@lemp-belajarlinux:~$ sudo mv /usr/share/nginx/ninja/ /usr/share/nginx/invoice-ninja
ubuntu@lemp-belajarlinux:~$
```

Memberi hak akses dan owner ke root direktori `InvoiceNinja`

```bash
ubuntu@lemp-belajarlinux:~$ sudo chown www-data:www-data /usr/share/nginx/invoice-ninja/ -R
ubuntu@lemp-belajarlinux:~$ sudo chmod 755 /usr/share/nginx/invoice-ninja/storage/ -R
ubuntu@lemp-belajarlinux:~$
```

Selanjutnya membuat database yang akan digunakan oleh `InvoiceNinja`

```bash
ubuntu@lemp-belajarlinux:~$ sudo mysql -u root -p
Enter password:[INPUT PASSWORD ROOT DATABASE]
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 58309
Server version: 10.3.25-MariaDB-0ubuntu0.20.04.1 Ubuntu 20.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> create database invoiceninja;
Query OK, 1 row affected (0.073 sec)

MariaDB [(none)]> create user ninja@localhost identified by 'pwinvoiceninja';
Query OK, 0 rows affected (0.031 sec)

MariaDB [(none)]> grant all privileges on invoiceninja.* to ninja@localhost;
Query OK, 0 rows affected (0.003 sec)

MariaDB [(none)]> flush privileges;
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> exit;
Bye
ubuntu@lemp-belajarlinux:~$
```

Install module PHP yang diperlukan disini kami menggunakan PHP 7.4

```bash
ubuntu@lemp-belajarlinux:~$ sudo apt install php-imagick php7.4-fpm php7.4-mysql php7.4-common php7.4-gd php7.4-json php7.4-curl php7.4-zip php7.4-xml php7.4-mbstring php7.4-bz2 php7.4-intl php7.4-gmp
```

Membuat server block nginx untuk `InvoiceNinja`

```bash
ubuntu@lemp-belajarlinux:~$ sudo vim /etc/nginx/conf.d/invoice-ninja.conf
```

Berikut isi dari server block nginx `InvoiceNinja`

```bash
server {
    listen 80;
    server_name invoice.belajarlinux.my.id;

    root /usr/share/nginx/invoice-ninja/public/;
    index index.php index.html index.htm;
    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    access_log  /var/log/nginx/invoiceninja.access.log;
    error_log   /var/log/nginx/invoiceninja.error.log;

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/run/php/php7.4-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_intercept_errors off;
        fastcgi_buffer_size 16k;
        fastcgi_buffers 4 16k;
    }

    location ~ /\.ht {
        deny all;
    }
}
```

*Catatan: Pada bagian server_name silakan sesuaikan domain atau subdomain yang ingin Anda gunakan*

Simpan dan pastikan tidak ada konfigurasi miss konfigurasi server block nginx

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

Install ssl pada `InvoiceNinja` disini kami menggunakan ssl gratis dari letsencrypt, untuk menggunakan letsencrypt pastikan Anda sudah install `certbort` dan berikut satu baris perintah untuk install ssl gratis dari letsencrypt

```bash
ubuntu@lemp-belajarlinux:~$ sudo certbot --nginx --agree-tos --redirect --hsts --staple-ocsp --email me@belajarlinux.id -d invoice.belajarlinux.my.id
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator nginx, Installer nginx
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for invoice.belajarlinux.my.id
Waiting for verification...
Cleaning up challenges
Deploying Certificate to VirtualHost /etc/nginx/conf.d/invoice-ninja.conf
Redirecting all traffic on port 80 to ssl in /etc/nginx/conf.d/invoice-ninja.conf

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Congratulations! You have successfully enabled
https://invoice.belajarlinux.my.id

You should test your configuration at:
https://www.ssllabs.com/ssltest/analyze.html?d=invoice.belajarlinux.my.id
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/invoice.belajarlinux.my.id/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/invoice.belajarlinux.my.id/privkey.pem
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

Jika sudah silakan akses domain atau sub domain yang sudah ditentukan sebelumnya di server block nginx melalui web browser, silakan isi database mulai dari username, password dan nama database yang sudah dibuat sebelumnya seperti pada gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/invoic01.png)

Konfigurasi email, jika Anda belum mempunya email yang bisa digunakan bisa di skip

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/invoic02.png)

Selanjutnya membuat administrator `InvoiceNinja` silakan isi sesuai keinginan Anda lalu klik **Submit**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/invoic03.png)

Test login ke Administrator `InvoiceNinja` menggunakan email dan password yang sudah ditentukan sebelumnya

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/invoic04.png)

Apabila berhasil Anda akan melihat tampilan dashboard dari `InvoiceNinja`

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/invoic05.png)

Sampai disini Anda sudah berhasil melakukan instalasi `InvoiceNinja` di Ubuntu 20.04 LTS menggunakan webserver Nginx. 

Selamat mencoba 😁