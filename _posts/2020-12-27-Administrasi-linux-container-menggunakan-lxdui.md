---
title: Administrasi Linux Container Menggunakan LXDUI
description: 'LXDUI mempunyai fitur yang bisa dibilang lengkap dan simple dan sangat direkomendasikan untuk administrasi linux container dalam 1 host (stand-alone)'
lang: id_ID
date: 2020-12-27 06:57 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/cover2.png'
categories:
 - LXC/LCD
 - Linux Container
---

[Belajar Linux ID](https://belajarlinux.id) - Jika sebelumnya kita sudah melakukan instalasi LXDUI, maka tutorial kali ini akan kita bahas bagaimana cara melakukan administrasi linux container menggunakan LXDUI.

**LXDUI** mempunyai fitur yang bisa dibilang lengkap dan simple dan sangat direkomendasikan untuk administrasi linux container dalam 1 host (stand-alone).

Berikut ini beberapa cara melakukan manajemen linux container menggunakan LXDUI. 

Silakan login ke LXDUI dan berikut tampilan dashboard dari LXDUI

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/1.png)

LXDUI hanya memiliki menu berikut: 

- **Containers:** Digunakan manajemen linux container, mulai dari melihat spesifikasi, create, delete, start, restart, stop, create snapshot, login console dan yang lainnya. 
- **Images:** Berisi kumpulan images yang di undah dari repository images linux container, tersedia juga menu remote images linux container
- **Profiles:** Digunakan untuk melihat profile dari Host Linux container 
- **Network:** Digunakan untuk melihat informasi Network, network yang digunakan `bridge`
- **Storage Pools:** Digunakan untuk melihat informasi tentang storage yang digunakan
- **Logout:** Digunakan untuk keluar dari LXDUI

Jika ingin membuat linux container silakan klik **+ New Instance**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/2.png)

Kemudian, isi nama container, dan tentukan spesifikasi seperti CPU dan memory dan pilih profile yang digunakan lalu klik tombol **Create**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/3.png)

Tunggu proses pembuatan linux container sampai selesai, jika sudah selesai akan ada informasi seperti berikut

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/4.png)

Saat ini linux container sudah berhasil dibuat dan statusnya juga sudah running

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/5.png)

Jika Anda ingin mencoba stop lebih dari satu linux container juga dapat dilakukan dengan ceklist linux container dan klik **Stop** 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/6.png)

Tunggu beberapa saat dan ke tiga linux container diatas akan **Stop** 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/7.png)

Jika ingin di **Start** kembali caranya sama dengan diatas ceklist linux container dan klik tombol **Start**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/8.png)

Saat ini linux container sudah running kembali dan ada tombol togle dimana terdapat beberapa menu seperti berikut: 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/9.png)

**Keterangan:**

- **Terminal:** Digunakan untuk login console linux container
- **Snapshot:** Digunakan untuk snapshsot linux container
- **Clone:** Digunakan untuk cloning linux container
- **Move:** Digunakan untuk mengubah nama linux container
- **Export:** Digunakan untuk export linux container

Sebagai contoh jika ingin login ke console linux container *blinux-centos7-c1* silakan klik *Terminal* nantinya akan terbukan tab baru di browser seperti berikut

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/10.png)

Jika ingin membuat snapshot silakan klik *Snapshot* dan isikan nama *Snapshot*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/11.png)

Apabila berhasil akan ada informasi sukses seperti berikut

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/12.png)

Untuk melihat spesifikasi yang digunakan silakan klik nama container dan Anda akan melihat detail hardware yang digunakan oleh linux container mulai dari CPU, Memory,  Disk dan NIC

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/13.png)

Selanjutnya, pindah ke menu Images disini Anda dapat mengunduh images baru yang diambil dari repository images linux container, contoh disini kami akan unduh image `alpine` 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/15.png)

Setelah berhasil di unduh image `alpine` akan ada berada di menu `Local` nantinya pada saat membuat linux container baru Anda dapat memilih image `alpine` 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/16.png)

Di menu **Profiles** Anda dapat menambahkan profile baru secara default sudah ada profile gambarannya seperti berikut

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/17.png)

Di menu **Networks** Anda akan melihat network default dari linux container yaitu `lxdbr0` dengan type network-nya `bridge` disini Anda dapat menambahkan network baru jika butuhkan

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/18.png)

Di menu **Storage Pools** ini berisi informasi dari disk yang digunakan linux container

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/19.png)

Jika Anda ingin keluar dari LXDUI klik menu **Logout**

Itulah beberapa contoh penggunaan LXDUI yang bisa dibilang simple dan user friendly. Jika terdapat pertanyaan dapat di sampaikan melalui kolom komentar ya. 

Selamat mencoba 😁
