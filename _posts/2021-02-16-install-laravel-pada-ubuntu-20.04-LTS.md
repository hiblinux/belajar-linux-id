---
title: Install Laravel pada Ubuntu Server 20.04 LTS
description: Laravel merupakan salah satu framework yang sering digunakan, laravel berbasis framework Symfony yang mengikuti pola arsitektur Model-View-Controller (MVC). 
lang: id_ID
date: 2021-02-16 01:39 +0700
layout: post
featured: true
author: Imron
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20Laravell/install-laravel.png
categories: [ Laravel, Framework, Ubuntu ]
---

Laravel merupakan salah satu framework yang sering digunakan, laravel berbasis framework Symfony yang mengikuti pola arsitektur Model-View-Controller (MVC). 
Laravel menyediakan manajemen kontrol menggunakan Command Line Interface (CLI) yakni artisan, dimana tool tersebut sangat membantu mengelola dan mengoperasikan aplikasi Anda.

Pada tutorial kali ini, laravel akan diinstall pada Ubuntu Server 20.04 LTS. Untuk selengkapnya silakan dilihat pada panduan berikut ini: 

{:start="1"}
1. Install Lamp Stack 

Pertama kali Anda harus menginstall Lamp Stack terlebih dahulu pada Ubuntu Server Anda, disini saya menggunakan versi PHP 7.4, dengan web server Apache2 dan Mysql sebagai database servernya. Untuk selengkapnya mengenai instalasi Lamp Stack bisa melihat pada post kami sebelumnya [**disini**](https://belajarlinux.id/install-lamp-stack-di-ubuntu-20-04/). 

a. Install PHP 

```
sudo apt install zip unzip software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt install -y php7.4 php7.4-gd php7.4-mbstring php7.4-xml php-zip
```

b. Install Apache2

```
sudo apt install apache2 libapache2-mod-php7.4
```

c. Install MySQL 

```
sudo apt install mysql-server php7.4-mysql
```

{:start="2"}
2. Install Composer 

PHP Composer digunakan untuk menginstal dependensi yang diperlukan untuk aplikasi PHP. Jalankan perintah berikut untuk menginstal dan mengkonfigurasi Composer di sistem Anda.

```
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer
```

{:start="3"}
3. Download dan Install Laravel 

Versi laravel terbaru tersedia pada Github repositorinya, clone reponya terlebih dahulu. 

```
cd /var/www
sudo git clone https://github.com/laravel/laravel.git
```

Masuk ke direktori laravel dan gunakan composer untuk menginstall semua dependensi yang dibutuhkan oleh framework laravel. 

```
chown -R www-data.www-data /var/www/laravel
chmod -R 755 /var/www/laravel
```

{:start="4"}
4. Membuat Pengaturan Environment 

Selanjutnya buat environment untuk mengelola projek laravel yang akan kita gunakan, Anda bisa rename nama environment yang sudah disediakan sebelumnya (.env.example) menjadi nama file (.env). 

```
mv .env.example .env
```

Kemudian, generate base64 untuk enkripsi kuncinya: 

```
sudo php artisan key:generate

Application key set successfully.
```

Edit file `.env` dan sesuaikan dengan kebutuhan Anda, dan pastikan APP_KEY sudah diatur dengan benar sesuai dengan perintah generate sebelumnya seperti pada gambar berikut. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20Laravell/2.%20APP_Key.png)

{:start="5"}
5. Membuat Database dan User MySQL

Login ke database dan buat database beserta usernya untuk menghubungkan dengan aplikasi laravel. 

```
CREATE DATABASE laravel;
CREATE USER 'laravel'@'localhost' IDENTIFIED BY 'password';
GRANT ALL ON laravel.* to 'laravel'@'localhost';
FLUSH PRIVILEGES;
quit
```

Selanjutnya edit file `.env` dan update pengaturan database: 

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=password
```

{:start="6"}
6. Konfigurasi Apache 

Setelah membuat database dan usernya, kemudian lakukan konfigurasi virtualhost pada Apache. Anda bisa menggunakan file virtualhost yang existing (`000-default.conf`) atau membuat file baru. 

```
vim /etc/apache2/sites-enabled/000-default.conf
```

Update dan sesuaikan dengan kebutuhan Anda: 

```
<VirtualHost *:80>

        ServerAdmin <Domain/Subdomain>
        DocumentRoot /var/www/laravel/public

        <Directory />
                Options FollowSymLinks
                AllowOverride None
        </Directory>
        <Directory /var/www/laravel>
                AllowOverride All
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
```

Restart perubahan konfigurasi Apache dengan menjalankan perintah sebagai berikut: 

```
sudo systemctl restart apache2
```

{:start="7"}
7. Akses Aplikasi Laravel 

Nah, sampai disini kita sudah berhasil melakukan setup dan konfigurasi untuk install framework PHP yaitu Laravel. Selanjutnya akses domain/subdomain yang digunakan seperti pada gambar berikut ini.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20Laravell/3.%20Akses%20Laravel.png)

# Kesimpulan
Panduan diatas merupakan panduan pertama kali untuk install framework Laravel pada Ubuntu Server 20.04 LTS, selanjutnya Anda bisa membuat aplikasinya menggunakan Laravel. 

Jika terdapat kritik dan saran maupun yang lainnya, silakan isikan komentar Anda pada kolom komentar dibawah ini. 

Sekian dan terima kasih. 

Semoga bermanfaat dan barokah, aamiin :) 
