---
title: Listing Service Linux dengan Systemctl 
description: Dalam linux sebuah services program berjalan di background, service program tersebut bisa dijalankan sesuai permintaan (manual) atau saat waktu booting sistem operasi (otomatis)
lang: id_ID
date: 2021-02-10 10:07 +0700
layout: post
featured: true
author: Imron
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Listing%20Service%20Linux%20dengan%20Systemctl/cover.png
categories: [ service, linux ]
---

Dalam linux sebuah services program berjalan di background, service program tersebut bisa dijalankan sesuai permintaan (manual) atau saat waktu booting sistem operasi (otomatis). 

Jika linux merupakan sistem operasi primary yang Anda gunakan untuk development, Anda akan sering menemukan service layaknya web server, dns, ssh, cronjob, dll. Anda bisa melihat dari status service tersebut berjalan dengan normal atau tidak serta Anda bisa cek jika terdapat isue melalui status dari service tersebut. 

Paling banyak distribusi linux menggunakan systemd secara default sebagai init system dan service manager. 
Systemd merupakan rangkaian tool yang digunakan untuk mangelola sistem linux. Selain itu, systemd digunakan untuk boot up mesin, automount filesystem, mencari log, dan lain-lain. 

{:start="1"}
1. Listing Service Linux 
Systemd menggunakan konsep unit yang bisa dijadikan service, socket, mount point, perangkat, dll. Unit ditentukan 
menggunakan file teks dengan format ***ini***. File-file tesebut termasuk informasi dari unit, pengaturan unit dan perintah 
untuk eksekusi. Ekstensi nama file menentukan jenis file unit, misalnya file unit service sistem memiliki ekstensi .service. 

Systemctl merupakan utilitas perintah yang digunakan untuk kontrol system dan mengelola service. Selain itu merupakan 
bagian dari ekosistem systemd dan secara default tersedia untuk semua system. 

Untuk melihat daftar service unit yang berhasil dimuat bisa menggunakan perintah: 

```
sudo systemctl list-units --type service
```

Output: 
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Listing%20Service%20Linux%20dengan%20Systemctl/1.%20output.png)

**Keterangan**: 

a. Unit: Nama service unit

b. Load: Informasi tentang sistem apakah dimuat pada memori atau tidak 

c. Active: Status aktifasi service tingkat tinggi, bisa berstatus active, reloading, inactive, failed, activating, deactivating. Hal tersebut merupakan generalisasi dari kolom Sub. 

d. Sub: Status aktifasi service tingkat rendah. Isi dari kolom Sub ini bergantung pada tipe unit itu sendiri. Sebagai contoh, tipe service bisa menjadi seperti dead, exited, failed, inactive, atau running. 

e. Description: Deskripsi file unit 

Selanjutnya, jika ingin menampikan daftar unit yang berhasil dimuat dan tidaknya bisa menggunakan opsi ``--all``. 

```
sudo systemctl list-units --type service --all
```

Jika Anda ingin menampikan daftar file unit yang berhasil diinstall dan tidak hanya yang berhasil dimuat bisa menjalankan perintah sebagai berikut: 

```
sudo systemctl list-unit-files
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Listing%20Service%20Linux%20dengan%20Systemctl/2.%20Output.png)

{:start="2"}
2. Menampilkan status service 
Untuk menampilkan status service bisa menggunakan perintah `systemctl status` seperti contoh berikut ini: 

```
sudo systemctl status <service_name>.service
```
Dimana *service_name* merupakan nama servis yang ingin digunakan, misalnya apache2.service. 

Output: 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Listing%20Service%20Linux%20dengan%20Systemctl/3.%20Status.png)

**Keterangan**: 
a. Loaded: Unit servis yang berhasil dimuat dan berisi full path dari service tersebut, beserta menunjukkan apakah unit service diaktifkan pada saat boot atau tidak.

b. Active: Status dari unit servis apakah Active dan Running atau tidak. Selain itu bisa menunjukkan lama waktu unit servis telah berjalan. 

c. Docs: Dokumentasi servis

d. Process: Informasi proses servis

e. Main PID: Servis PID

f. Tasks: Jumlah task yang dijalankan dan menunjukkan batas task

g. Memory: Informasi memori yang digunakan oleh unit servis

h. CGroup: Informasi kontrol grup yang berkaitan

Jika hanya ingin menampilkan baris status active saja pada service bisa menjalakan perintah sebagai berikut: 

```
sudo systemctl is-active apache2.service
```

Output: 

```
active
```

**Kesimpulan**: 

Systemctl merupakan tool yang digunakan untuk menampilkan daftar service linux dan check statusnya. 

Jika Anda memiliki kritik dan saran pada post kali ini atau terdapat hal lain bisa komen pada form dibawah ini ya. 

Sekian dan terima kasih. 

Semoga bermanfaat dan barokah, aamiin :) 
