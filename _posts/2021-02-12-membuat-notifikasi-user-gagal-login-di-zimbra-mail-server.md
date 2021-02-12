---
title: Membuat Notifikasi User Gagal Login di Zimbra Mail Server
description: 'Zimbra adalah perangkat lunak open source (terbuka) untuk kolaborasi email yang sering digunakan untuk membangun sebuah mail server dan sangat terkemuka didunia.'
lang: id_ID
date: 2021-02-12 22:37 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/login1-gagal-zimbra.png
categories:
 - Zimbra
 - mail-server
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini kami akan memberikan tips untuk mengetahui user email zimbra yang gagal login selama 5 kali berturut-turut. Untuk treshold-nya sendiri dapat diatur sesuai keinginan. Tips ini sangat cocok bagi Anda seorang Administrator Zimbra tujuannya untuk mengetahui kalau user Anda mengalami gagal login dan Anda dapat menyampaikannya dan memberikan bantuan misalnya reset password kepada user tersebut. 

*Baca juga:*

- **[Pengenalan Zimbra](https://belajarlinux.id/pengenalan-zimbra/)**
- **[Install Zimbra Mail Server di Ubuntu 18.04 LTS](https://belajarlinux.id/install-zimbra-di-ubuntu-18.04/)**
- **[Menambahkan DNS Record Zimbra Mail Server](https://belajarlinux.id/menambahkan-dns-record-zimbra-mail-server/)**
- **[Install SSL Letsencrypt di Zimbra Mail Server](https://belajarlinux.id/install-ssl-letsencrypt-di-zimbra-mail-server/)**
- **[Mengatasi Error Upstream di Zimbra Mail Server](https://belajarlinux.id/mengatasi-error-upstream-di-zimbra-mail-server/)**
- **[Membuat User Email di Zimbra Mail Server](https://belajarlinux.id/membuat-user-email-di-zimbra-mail-server/)**
- **[Membuat Multi Akun Email di Zimbra Mail Server](https://belajarlinux.id/membuat-multi-akun-email-di-zimbra-mail-server/)**
- **[Membuat User Administrator Read Only di Zimbra Mail Server](https://belajarlinux.id/membuat-user-administrator-readonly-di-zimbra-mail-server/)**

Service yang akan digunakan untuk notifikasi ini  yaitu `Zmauditswatch ` dimana dengan service ini Anda dapat membuat notifikasi sesuai yang Anda inginkan. 

Untuk mengikuti tutorial ini silakan login ke root Zimbra dan jalankan perintah berikut: 

```bash
root@mail:~#
root@mail:~# wget https://wiki.zimbra.com/images/9/9a/Zmauditswatch.patch.tar.gz -O /tmp/zmauditswatch.patch.tar.gz
root@mail:~# tar xvf /tmp/zmauditswatch.patch.tar.gz -C /tmp/
root@mail:~# cd /tmp/zmauditswatch.patch/
root@mail:/tmp/zmauditswatch.patch# cp zmauditswatch.service /etc/systemd/system/zmauditswatch.service
root@mail:/tmp/zmauditswatch.patch# cp auditswatch /opt/zimbra/libexec/auditswatch
root@mail:/tmp/zmauditswatch.patch# chown root:root /etc/systemd/system/zmauditswatch.service /opt/zimbra/libexec/auditswatch
root@mail:/tmp/zmauditswatch.patch# chmod 644 /etc/systemd/system/zmauditswatch.service
root@mail:/tmp/zmauditswatch.patch# chmod 755 /opt/zimbra/libexec/auditswatch
root@mail:/tmp/zmauditswatch.patch#
```

Selanjutnya melakukan konfigurasi penerima email notifikasi. Disini kami set administrator yang akan menerima email notifikasi. Silakan disesuaikan dengan keinginan Anda

```bash
root@mail:/tmp/zmauditswatch.patch# su - zimbra
zimbra@mail:~$ zmlocalconfig -e zimbra_swatch_notice_user="admin@nurhamim.my.id"
```

Konfigurasi treshold atau aturan yang ingin Anda tentukan. 

```bash
zimbra@mail:~$ zmlocalconfig -e zimbra_swatch_ipacct_threshold=5
zimbra@mail:~$ zmlocalconfig -e zimbra_swatch_acct_threshold=5
zimbra@mail:~$ zmlocalconfig -e zimbra_swatch_ip_threshold=20
zimbra@mail:~$ zmlocalconfig -e zimbra_swatch_total_threshold=60
zimbra@mail:~$ zmlocalconfig -e zimbra_swatch_threshold_seconds=3600
zimbra@mail:~$
```

Melakukan inisialisasi file `zmauditswatch` dan `auditswatchrc` 

```bash
zimbra@mail:~$ touch /opt/zimbra/conf/auditswatchrc
zimbra@mail:~$ touch /opt/zimbra/log/zmauditswatch.out
zimbra@mail:~$
```

Jika sudah silakan enable dan start service `zmauditswatch` dan pastikan statusnya running. 

```bash
zimbra@mail:~$ exit
logout
root@mail:/tmp/zmauditswatch.patch#
root@mail:/tmp/zmauditswatch.patch# systemctl enable zmauditswatch
Created symlink /etc/systemd/system/multi-user.target.wants/zmauditswatch.service → /etc/systemd/system/zmauditswatch.service.
root@mail:/tmp/zmauditswatch.patch# systemctl start zmauditswatch
root@mail:/tmp/zmauditswatch.patch# systemctl restart zmauditswatch
root@mail:/tmp/zmauditswatch.patch# systemctl status zmauditswatch
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/nt1.png)

Uji coba gagal login selama 5 kali

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/nt2.png)

Cek di user `admin@nurhamim.my.id` yang sudah diatur sebagai penerima email notife atau administrator-nya. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/nt3.png)

Yeay, saat ini Anda sudah mendapatkan notifikasi gagal login selama 5 kali dan itu dianggap sebagai abuse. 

Selamat mencoba 😁

Referensi: **[Zmauditswatch](https://wiki.zimbra.com/wiki/Zmauditswatch)**