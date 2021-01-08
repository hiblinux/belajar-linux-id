---
title: Cara Menggunakan Perintah touch di Linux
description: 'Perintah touch adalah perintah standar yang digunakan dalam sistem operasi UNIX/Linux  biasanya digunakan untuk membuat, mengubah, dan memodifikasi timestamps suatu file'
lang: id_ID
date: 2021-01-09 05:27 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/touch1.png'
categories:
 - linux
---

[Belajar Linux ID](https://belajarlinux.id) -  Tutorial kali ini kami akan bahas tentang bagaimana cara menggunakan perintah *touch* di Linux. 

Perintah *touch* adalah perintah standar yang digunakan dalam sistem operasi UNIX/Linux  biasanya digunakan untuk membuat, mengubah, dan memodifikasi timestamps suatu file. Pada dasarnya ada dua macam perintah untuk membuat file di sistem Linux yaitu sebagai berikut:

- [**Perintah cat**](https://belajarlinux.id/cara-menggunakan-perintah-cat-di-linux/):  Digunakan untuk membuat file dengan konten.
- **Perintah touch**: Digunakan untuk membuat file tanpa konten apa pun. Perintah ini dapat digunakan jika pengguna tidak memiliki data untuk disimpan pada saat pembuatan file.

## Sintak

Untuk membuat file baru dengan perintah *touch* Anda dapat menggunakan sintak berikut:

```bash
$ sudo touch file1
```

Untuk melihat file yang sudah dibuat diatas gunakan perintah *ls* atau *ll* seperti pada gambar dibawah ini:

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/to1.png)

Untuk membuat multi file atau banyak file menggunakan perintah *touch* seperti berikut

```bash
$ sudo touch Doc1 Doc2 Doc3
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/to2.png)

## Opsi

Sama seperti perintah-perintah linux lainnya, perintah *touch* juga mempunyai opsi yang dapat Anda gunakan diantaranya:

**touch -a**: Opsi ini digunakan untuk mengubah waktu akses saja. Untuk mengubah atau memperbarui akses terakhir atau waktu modifikasi file.

```bash
$ sudo touch -a Doc1
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/to3.png)

**touch -c**: Opsi ini digunakan untuk memeriksa apakah suatu file dibuat atau tidak. Jika tidak dibuat maka jangan membuatnya. Perintah ini menghindari pembuatan file.

```bash
$ sudo touch -c Doc2
$ sudo touch -c Redhat
```



![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/to4.png)

**touch -c-d:** Opsi ini digunakan untuk memperbarui akses dan waktu modifikasi.

```bash
$ sudo touch -c -d
```



![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/to5.png)

**touch -m:** Opsi ini digunakan untuk mengubah waktu modifikasi saja. Opsi ini hanya memperbarui waktu modifikasi terakhir pada file.

```bash
$ sudo touch -m Doc2
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/to6.png)

**touch -r:**  Opsi ini digunakan untuk menggunakan timestamp file lain. Di sini file Doc2 diperbarui dengan timestamp file1.

```bash
$ sudo touch -r file1 Doc2
```



![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/to7.png)

**touch -t:** Opsi ini digunakan untuk membuat file menggunakan waktu tertentu.

```bash
# Contoh sintak: touch -t YYMMDDHHMM fileName

$ sudo touch -t 201510290630 Date
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/to8.png)

Itulah beberapa contoh dan opsi yang dapat digunakan dalam penggunaan perintah *touch* di Linux. 

Selamat mencoba 😁
