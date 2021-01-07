---
title: Cara Menggunakan Perintah time di Linux
description: 'time di Linux biasanya digunakan untuk menampilkan ringkasan waktu secara real-time dan waktu user CPU, system CPU'
lang: id_ID
date: 2021-01-07 21:36 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/Time.png'
categories:
 - linux
---

[Belajar Linux ID](https://belajarlinux.id) - Kali ini kami akan bahas tentang perintah dasar yang ada di Linux. Perintah dasar yang akan kami bahas kali ini yaitu *time*.

Perintah *time* di Linux biasanya digunakan untuk menampilkan ringkasan waktu secara real-time dan waktu user CPU, system CPU. *real* merupakan waktu yang diambil oleh perintah untuk dieksekusi, sedangkan *user* dan *sys* merupakan waktu jumlah detik CPU yang digunakan perintah masing-masing dala mode pengguna dan kernel.

## Sintak

Sintak yang digunakan jika ingin menggunakan perintah ***time***:

```bash
$ time [option] [COMMAND]
```

Contoh:

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/t1.png)

Dalam contoh di atas, `sleep 3` digunakan untuk membuat job dummy yang berlangsung selama 3 detik.

## Opsi

Berikut opsi yang dapat digunakan:

**time -p:** Opsi ini digunakan untuk menampilkan waktu dalam format POSIX.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/t2.png)

**help time**: Opsi ini digunakan untuk melihat bantuan informasi *(help information)*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/t3.png)

Itulah contoh dasar penggunaan perintah *time* di Linux yang sangat mudah dan simple. 

Selamat mencoba 😁