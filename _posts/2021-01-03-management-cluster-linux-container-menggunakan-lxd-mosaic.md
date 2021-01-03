---
title: Management Cluster Linux Container (LXD) Menggunakan LXDMosaic
description: 'LXDMosaic merupakan management linux container berbasis web dimana Anda dapat mengelola linux container melalui web browser'
lang: id_ID
date: 2021-01-03 16:35 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/clustering(1).png'
categories:
 - LXC/LCD
 - Linux Container
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini kita akan mencoba melakukan instalasi LXDMosaic. LXDMosaic merupakan management linux container berbasis web dimana Anda dapat mengelola linux container melalui web browser. 

LXDMosaic sendiri open source artinya dapat Anda gunakan secara bebas. LXDMosaic kaya akan fitur dibanding [LXD UI](https://belajarlinux.id/Administrasi-linux-container-menggunakan-lxdui/) dimana LXDMosaic dapat melakukan management multi node linux container atau clustering LXD atau mudahnya Anda dapat mengelola semua server LXD didalam satu dashboard LXD Mosaic. Tidak hanya itu saja LXDMosaic juga dapat mengelola layanan Cloud seperti AWS, Azue dan GCP. 

Perhatikan gambar topologi yang kami gunakan berikut:

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/cluster-Page-2(1).png)

Keterangan: Topologi diatas terdapat 3 node (clustering LXD) dan 1 node (LXDMosaic) dimana dalam kasus ini masih dalam 1 network antara node LXDMosaic dengan node  lxd cluster. 

Untuk mengikuti tutorial ini pastikan Anda sudah setup Cluster LXD pada tutorial berikut: [Clustering Linux Container (LXD)](https://belajarlinux.id/clustering-linux-container/)

Namun jika Anda ingin menggunakan LXDMosaic hanya untuk satu server saja (stand-alone) juga dapat dilakukan.

*Baca Juga:*

- *[Cara Install Linux Container (LXD)](https://belajarlinux.id/install-lxd-di-linux/)*
- *[Perintah Dasar Linux Container (LXD)](https://belajarlinux.id/perintah-dasar-lxd)*
- *[Cara Membuat, Restore dan Delete Snapshot Linux Container (LXD)](https://belajarlinux.id/cara-membuat-restore-delete-snapshot-lxd/)*
- *[Clustering Linux Container (LXD)](https://belajarlinux.id/clustering-linux-container/)*

LXD Mosaic kali ini akan di install di sistem operasi Ubuntu 20.04 LTS silakan akses instance/server/vps Ubuntu 20.04 LTS Anda kemudian update sistem operasinya terlebih dahulu menggunakan perintah berikut:

```bash
ubuntu@node-managelxd-blinux:~$ sudo apt update -y
```

Jika sudah selanjutnya install LXD di Ubuntu 20.04 LTS

```bash
ubuntu@node-managelxd-blinux:~$
ubuntu@node-managelxd-blinux:~$ sudo snap install lxd
```

Konfigurasi LXD

```bash
ubuntu@node-managelxd-blinux:~$ lxd init
Would you like to use LXD clustering? (yes/no) [default=no]:
Do you want to configure a new storage pool? (yes/no) [default=yes]:
Name of the new storage pool [default=default]:
Name of the storage backend to use (dir, lvm, ceph, btrfs) [default=btrfs]:
Create a new BTRFS pool? (yes/no) [default=yes]:
Would you like to use an existing block device? (yes/no) [default=no]:
Size in GB of the new loop device (1GB minimum) [default=15GB]: 40GB
Would you like to connect to a MAAS server? (yes/no) [default=no]:
Would you like to create a new local network bridge? (yes/no) [default=yes]:
What should the new bridge be called? [default=lxdbr0]:
What IPv4 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]:
What IPv6 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]:
Would you like LXD to be available over the network? (yes/no) [default=no]:
Would you like stale cached images to be updated automatically? (yes/no) [default=yes]
Would you like a YAML "lxd init" preseed to be printed? (yes/no) [default=no]:
ubuntu@node-managelxd-blinux:~$
```

Konfigurasi dan set password Node LXDMosaic

```bash
ubuntu@node-managelxd-blinux:~$
ubuntu@node-managelxd-blinux:~$ lxc config set core.https_address [::]
ubuntu@node-managelxd-blinux:~$ lxc config set core.trust_password admin
```

*Noted: Password yang kami gunakan disini yaitu **admin** harap dicatat untuk password ini karena akan digunakan pada saat add server/device nantinya*

Membuat linux container untuk LXDMosaic

```bash
ubuntu@node-managelxd-blinux:~$ lxc launch ubuntu: lxdMosaic
Creating lxdMosaic
Starting lxdMosaic
ubuntu@node-managelxd-blinux:~$
```

Login ke linux container LXDMosaic

```bash
ubuntu@node-managelxd-blinux:~$ lxc exec lxdMosaic bash
root@lxdMosaic:~#
```

Unduh project LXDMosaic menggunakan `curl`

```bash
root@lxdMosaic:~# curl https://raw.githubusercontent.com/turtle0x1/LxdMosaic/master/examples/install_with_clone.sh >> installLxdMosaic.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  4368  100  4368    0     0   9882      0 --:--:-- --:--:-- --:--:--  9882
root@lxdMosaic:~#
```

Memberikan hak akses dan install LXDMosaic, untuk instalasinya sendiri membutuhkan waktu kurang lebih 10 menit.

```bash
root@lxdMosaic:~#
root@lxdMosaic:~# chmod +x installLxdMosaic.sh
root@lxdMosaic:~# ./installLxdMosaic.sh
Reading package lists... Done
Building dependency tree
Reading state information... Done
curl is already the newest version (7.68.0-1ubuntu2.4).
curl set to manually installed.
The following package was automatically installed and is no longer required:
  libfreetype6
Use 'apt autoremove' to remove it.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

## Installing the NodeSource Node.js 10.x repo...

## Populating apt-get cache...

+ apt-get update
Hit:1 http://archive.ubuntu.com/ubuntu focal InRelease
Get:2 http://archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
Get:3 http://security.ubuntu.com/ubuntu focal-security InRelease [109 kB]
Get:4 http://archive.ubuntu.com/ubuntu focal-backports InRelease [101 kB]


....

Installation successfull

You now need to point your browser at https://10.247.197.205 and accept the self signed certificate

ServerName for LxdManager can be changed in /etc/apache2/sites-available/lxd_manager.conf, followed by an apache restart (systemctl restart apache2)
root@lxdMosaic:~#
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/1.png)

Apabila sudah selesai proses instalasinya Anda dapat keluar dari linux container LXDMosaic menggunakan perintah `exit`

```bash
root@lxdMosaic:~#
root@lxdMosaic:~# exit
exit
ubuntu@node-managelxd-blinux:~$
```

Selanjutnya membuat rule proxy untuk expose port `443` linux container LXDMosaic menggunakan perintah berikut

```bash
ubuntu@node-managelxd-blinux:~$
ubuntu@node-managelxd-blinux:~$ lxc config device add lxdMosaic lxdport443 proxy listen=tcp:0.0.0.0:443 connect=tcp:127.0.0.1:443
Device lxdport443 added to lxdMosaic
ubuntu@node-managelxd-blinux:~$
```

*Noted: Silakan sesuaikan nama linux container dan untuk penamanaan rulenya bebas sesuai keinginan*

Jika sudah silakan akses IP atau domain yang sudah diarahkan ke server LXDMosaic seperti berikut ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/m2.png)

*Keterangan: Untuk login pertama kali menggunakan username **admin** dan password **test123***

Berikut tampilan awal dari LXDMosaic

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/m3.png)

Silakan Add Host disini kami input IP cluster dari LXD clustering yang telah kami buat sebelumnya, jika ingin digunakan stand-alone silakan isikan IP Host LXDMosaic Anda lalu klik menu *Manage Hosts*, apabila berhasil akan nampak seperti berikut ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/m4.png)

Terlihat pada gambar diatas saat ini Anda sudah dapat melakukan management Cluster menggunakan LXDMosaic, jika dilihat semua linux container yang ada di masing-masing node dapat Anda lihat dan manage juga contoh 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/m5.png) 

Selanjutnya untuk membuat linux container baru dapat dilakukan dengan mudah silakan klik menu **+ Container** lalu isi detail informasi pada *Name, Profiles, Images dan Hosts* disini kami akan membuat linux container dengan nama linux container `container-01` berada di host `node-03` dan menggunakan OS `Ubuntu 20.04 LTS` klik **Crate Container**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/m6.png)

Tunggu proses pembuatan linux container yang membutuhkan waktu beberapa saat, jika sudah silakan klik start pada linux container yang baru saja dibuat seperti pada gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/m7.png)

Sampai disini Anda sudah berhasil melakukan instalasi LXDMosaic dan add cluster ke LXDMosaic serta membuat container menggunakan LXDMosaic. 

Selamat mencoba 😁
