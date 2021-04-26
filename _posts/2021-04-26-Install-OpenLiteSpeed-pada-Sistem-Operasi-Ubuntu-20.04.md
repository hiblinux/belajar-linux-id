---
title: Install OpenLiteSpeed pada Ubuntu 20.04
description: 'OpenLiteSpeed merupakan salah satu Control panel dengan segudang fitur dan web interface yang friendly'
lang: id_ID
date: 2021-04-26 22:00 +0700
layout: post
featured: true
author: amar
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/Cover-Post-Install-OLS.png'
categories:
 - web-server
 - openlitespeed
---

[Belajar Linux ID](https://belajarlinux.id) - OpenLiteSpeed merupakan salah satu control panel yang dikembangkan oleh LiteSpeed Technologies Inc.  yang menyediakan banyak fitur jika dibandingan dengan Apache maupun Nginx.

Berikut beberapa fitur yang tersedia pada OpenLiteSpeed yang kami kutip dari halaman resminya adalah:

-   _Event-driven architecture with extremely low resource (CPU and RAM) overhead._
-   _Handles hundreds of thousands of concurrent connections without load spikes._
-   _WebAdmin GUI with real-time statistics._
-   _Rewrite engine uses Apache mod_rewrite syntax._
-   _Worker processes for scalability. Ability to bind certain processes to particular workers._
-   _High-performance coding using kqueue (FreeBSD and OS X), epoll (Linux), /dev/poll (Solaris), and poll._
-   _High-performance page caching._
-   _Support of third-party modules through API (LSIAPI)._

Pada kesempatan kali ini, saya akan menjelaskan cara menginstall OpenLiteSpeed pada sistem Operasi Ubuntu 20.04 LTS.

  

## Persiapan sebelum Instalasi

Sebelum instalasi dilakukan, ada beberapa hal yang perlu diperhatikan yaitu:
  

{:start="1"}

1. Pastikan VM/VPS sudah memenuhi standar spesifikasi OpenLiteSpeed berikut:

-   **Minimal RAM:**  512 MB. 
-   **Minimal Storage:** 500 MB

  

{:start="2"}

2. Pastikan VM/VPS menggunakan OS/Sistem Operasi yang telah support instalasi OpenLiteSpeed berikut:

- Linux(i386): kernel 2.4 and up, glibc-2.2 and up
- CentOS: 5 and up
- Ubuntu: 8.04 and up
- Debian: 4 and up
- Solaris(x86): SunOS 5.8 and up
- FreeBSD(i386): 4.5 and up
- MacOSX: 10.3 and up
  

Apabila VPS sekiranya sudah memenuhi kriteria yang disebutkan diatas, selanjutnya masuk ke tahap instalasi.

  
  

## Instalasi OpenLiteSpeed

  
{:start="1"}

1. Pertama-tama, Anda perlu melakukan update dan upgrade dependencies pada VPS Anda, berikut command nya:

```bash
apt-get update && apt-get upgrade
```

{:start="2"}

2. Setelah itu, silakan untuk mengecek status firewall UFW dan silakan menambahkan rule untuk mengizikan port yang dibutuhkan


```bash
sudo ufw status
sudo ufw allow OpenSSH
sudo ufw allow http
sudo ufw allow https
sudo ufw allow 7080/tcp
sudo ufw allow 8088/tcp
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/Rule-UFW-Allow-ols.png)
  
 {:start="3"}
 
3. Lalu download repo dan update repo pada VPS/VM Anda.

```
wget -qO - https://rpms.litespeedtech.com/debian/lst_repo.gpg | sudo apt-key add -
echo "deb http://rpms.litespeedtech.com/debian/ focal main" | sudo tee /etc/apt/sources.list.d/openlitespeed.list
sudo apt update
```
 
{:start="4"}

4. Setelah Anda berhasil menambahkan repo OpenLiteSpeed, silakan untuk menginstall aplikasi OpenLiteSpeed dengan menjalankan command berikut:

```
sudo apt install openlitespeed -y
```
  
{:start="5"}

5. Apabila instalasi sudah berhasil,  Anda bisa mengecek status  service OpenLiteSpeed untuk memastikan bahwa service OpenLiteSpeed sudah berjalan.

```
systemctl status lsws
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/Status-LSWS.png)
Bila OpenLiteSpeed berstatus inactive, Anda bisa menjalankan service OpenLiteSpeed dengan menjalankan command berikut:

```
systemctl start lsws
```
{:start="6"}

6. Apabila service OpenLiteSpeed sudah berjalan, Anda bisa mengakses OpenLiteSpeed melalui Web Browser. Berikut URL nya: `http://<IP VM/VPS>:8088`

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/Tampilan-OpenLiteSpeed.png)

{:start="7"}

 7.  Agar OpenLiteSpeed bisa menjalankan bahasa pemrograman PHP, Anda perlu menginstall aplikasi `lsphp` yaitu aplikasi PHP yang dirancang khusus untuk OpenLiteSpeed. Berikut caranya:

```
sudo apt install lsphp74 lsphp74-common lsphp74-mysql lsphp74-curl
```

Anda bisa mengecek versi lsphp dengan menjalankan perintah berikut:

```
/usr/local/lsws/lsphp74/bin/php7.4 
```
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/PHP-ols.png)

Atau bisa menggunakan command berikut untuk mengetahui php modul yang aktif

```
/usr/local/lsws/lsphp74/bin/php7.4 --modules
```
{:start="8"}

8. Setelah instalasi PHP selesai, selanjutnya silakan menginstall mariadb/mysql pada VPS Anda, berikut caranya

```
sudo apt install mariadb-server
systemctl enable mariadb
systemctl start mariadb
mysql_secure_installation
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/mysql-secure-ols.png)
{:start="9"}

9. Setelah instalasi dan setup mariadb berhasil, langkah terakhir silakan untuk men-setting credential untuk login ke administrator OpenLiteSpeed. Berikut caranya:

 ```
 sudo /usr/local/lsws/admin/misc/admpass.sh
 ```
 
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/setup-credential-admin-lsws.png)

- Bagian Username: Anda bisa mengisikan sesuai keinginan Anda, username tersebut yang nantinya digunakan untuk login ke Admin interface OpenLiteSpeed
-  Bagian Password: isikan password yang ingin digunakan
- Retype Password: Isikan pasword yang sebelumnya Anda isi

{:start="10"}

10. Setelah Anda berhasil men-setup admin interface OpenLiteSpeed, Anda bisa login ke dashboard admin OpenLiteSpeed dengan cara mengakses halaman `http://<IP VM/VPS>:7080`

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/URL-admin-ols.png)

Setelah Anda berhasil login, berikut adalah tampilan admin interface OpenLiteSpeed

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/amar/Dashboard-open-litespeed.png)

Sekian, dan Selamat mencoba 😁

