---
title: Cara Menggunakan Perintah last di Linux
description: 'Perintah last di Linux digunakan untuk menampilkan daftar semua pengguna atau user yang sudah masuk dan keluar sejak file `/var/log/wtmp` dibuat'
lang: id_ID
date: 2021-01-09 06:27 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/last1.png'
categories:
 - linux
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini akan kami bahas perintah *last* di Linux. Perintah *last* di Linux digunakan untuk menampilkan daftar semua pengguna atau user yang sudah masuk dan keluar sejak file `/var/log/wtmp` dibuat. Satu atau lebih nama pengguna dapat diberikan sebagai argumen untuk menampilkan waktu masuk (dan keluar) dan nama host.

## Sintak

Sintak perintah *last* di Linux seperti berikut:

```bash
last [options] [username...] [tty...]
```

Contoh: 

```bash
$ last
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/la1.png)

## Opsi

Terdapat beberapa opsi dalam penggunaan perintah *last* yang dapat Anda gunakan, berikut opsi yang sering digunakan: 

**- [number]:** Opsi ini digunakan untuk menentukan jumlah baris yang akan ditampilkan.

```bash
$ last -5
$ last -3
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/la2.png)

**-R:** Opsi ini digunakan untuk menyembunyikan nama host.

```bash
$ last -R root
$ last -R blinux
$ last -R root
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/la3.png)

**-F:** Opsi ini digunakan untuk menampilkan waktu login dan logout termasuk tanggal.

```bash
$ last -F
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/la4.png)

**-a:** Opsi  ini digunakan untuk menampilkan host-name di kolom terakhir.

```bash
$ last -a
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/la5.png)

**-s, -t:** Opsi ini digunakan untuk menampilkan dalam periode waktu tertentu. **(-s)** sejak dan **(-t)** hingga, perintah ini digunakan untuk dalam periode waktu.

Contoh: 

```bash
$ last -s yesterday -t today
```

Format yang valid untuk perintah di atas adalah:

```bash
YYYYMMDDhhmmss
YYYY-MM-DD hh:mm:ss
YYYY-MM-DD hh:mm      (seconds will be set to 00)
YYYY-MM-DD            (time will be set to 00:00:00)
hh:mm:ss              (date will be set to today)
hh:mm                 (date will be set to today, seconds to 00)
now
yesterday             (time is set to 00:00:00)
today                 (time is set to 00:00:00)
tomorrow              (time is set to 00:00:00)
+5min
-5days
```

**-d:** Opsi ini digunakan untuk menerjemahkan kembali alamat IP ke nama host-nya

```bash
$ last -d
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/la6.png)

**-x:** Opsi ini digunakan untuk menampilkan informasi seperti *system down entries* dan *run level changes*.

```bash
$ last -x
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/la7.png)

**-w:** Opsi ini digunakan untuk menampilkan pengguna atau user lengkap dan nama domain.

```bash
$ last -w
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/la8.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/la8.0.png)

**–help:** Opsi ini digunakan untuk menampilkan bantuan mengenai semua opsi yang termasuk dalam perintah *last*.

```bash
$ last --help
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/la9.png)

Itulah beberapa opsi dan contoh penggunaan perintah *last* yang dapat Anda gunakan.

Selamat mencoba 😁