---
title: 'Docker: Cara Menggunakan Dockerfile Secara Praktis'
description: 'Dockerfile adalah dokumen teks yang berisi sebuah perintah untuk membangun sebuah image. Dengan menggunakan perintah docker build pengguna dapat mengeksekusi beberapa instruksi baris perintah secara berurutan.'
lang: id_ID
date: 2020-12-27 16:32 +0700
layout: post
featured: true
author: leon
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/Dockerfile.png
categories: [ Docker, Ubuntu ]
---

Pada kali ini Belajar Linux ID ingin berbagi tutorial tentang **Cara Menggunakan Dockerfile Secara Praktis** (Ubuntu, CentOS, Debian). Apabila kalian belum mengetahui apa itu Docker, maka kalian perlu membaca kembali artikel kami sebelumnya:

- [Docker: Pengenalan Terhadap Docker](https://belajarlinux.id/pengenalan-terhadap-docker/).
- [Docker: Cara Instalasi Docker Pada Linux](https://belajarlinux.id/docker-installasi-docker-pada-linux/)

**Penjelasan Dockerfile**

**Docker** dapat membuat image secara otomatis dengan membaca instruksi yang ada pada Dockerfile. **Dockerfile** adalah dokumen teks yang berisi sebuah perintah untuk membangun sebuah image. Dengan menggunakan perintah **docker build** pengguna dapat mengeksekusi beberapa instruksi baris perintah secara berurutan.

Variabel yang dapat dijalankan pada Dockerfile dapat dilihat pada tabel berikut:

| Variabel | Keterangan |
|--|--|
| FROM | Instruksi FROM menginisialisasi tahap pembuatan baru dan menetapkan image dasar untuk instruksi selanjutnya. dengan demikian, Dockerfile yang valid harus dimulai dengan instruksi FROM . |
| RUN | Instruksi RUN akan menjalankan perintah pada layer baru di atas image saat ini. |
| CMD | Tujuan utama CMD adalah untuk mendefinisikan perintah bawaan untuk container |
| MAINTAINER | Digunakan untuk menetapkan pemilik dari image yang dibuat. |
| EXPOSE | Digunakan untuk memberitahu docker bahwa container tersebut membuka port yang ditentukan saat dijalankan. Default adalah TCP. |
| ENV | Instruksi ENV mengatur variabel environment <key> ke nilai <value>. Nilai ini akan berada di environment untuk semua instruksi selanjutnya dalam tahap pembuatan dan dapat diganti inline di banyak juga. |
| ADD | Instruksi ADD menyalin berkas baru, direktori atau URL berkas jarak jauh dari <src> dan menambahkannya ke sistem berkas pada image di path <dest>. |
| COPY | Instruksi COPY menyalin file atau direktori baru dari <src> dan menambahkannya ke sistem file wadah di path <dest>. |
| VOLUME | Instruksi VOLUME membuat titik mount dengan nama yang ditentukan dan menandainya sebagai memegang volume yang dipasang secara eksternal dari host asli atau wadah lainnya. |
| WORKDIR | Instruksi WORKDIR menetapkan direktori kerja untuk instruksi RUN, CMD, ENTRYPOINT, COPY dan ADD yang mengikutinya di Dockerfile. Jika WORKDIR tidak ada, itu akan dibuat bahkan jika itu tidak digunakan dalam instruksi Dockerfile berikutnya. |
{:class="table table-bordered"}

**Latihan Membuat Dockerfile**

**1. Buat direktori latihan.**

Pertama-tama silakan membuat 1 buah direktori baru dengan nama latihan, pada direktori ini nantinya kita akan melakukan pembuatan Dockerfile.

```bash
root@dockerfile:~# mkdir latihan
root@dockerfile:~# cd latihan/
```

**2. Buat Dockerfile menggunakan teks editor.**

Pada kali ini contoh teks editor yang saya gunakan adalah Vim, silakan disesuaikan dengan teks editor yang kalian sukai.

```bash
root@dockerfile:~/latihan# vim Dockerfile
```

Isikan Dockerfile dengan variabel variabel yang sudah dijelaskan sebelumnya.

```bash
FROM nginx:latest
MAINTAINER leon <leon@belajarlinux.id>
ADD index.html /usr/share/nginx/html
```

![Dockerfile](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/dockerfile1.png)

**Penjelasan:**

- FROM: Menggunakan image nginx sebagai default image yang akan dibuat.
- MAINTAINER: Mendefinisikan jika image yang dibuat milik leon.
- ADD: Tambahkan file index.html pada lokal device ke folder /usr/share/nginx/html pada container

**3. Buat file index.html**

Pada kali ini contoh teks editor yang saya gunakan adalah Vim, silakan disesuaikan dengan teks editor yang kalian sukai.

```bash
root@dockerfile:~/latihan# vi index.html
```

Isikan file index.html dengan kode berikut:

```html
<h1> ini merupakan halaman index yang berjalan pada container <h1>
```

![index.html](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/dockerfile2.png)

**4. Bangun sebuah docker image.**

Untuk membangun sebuah image berdasarkan Dockerfile yang sudah dibuat, berikut adalah perintah yang dijalankan.

```bash
root@dockerfile:~/latihan# docker build -t belajar-nginx .
```

**Penjelasan:**

- docker build: Perintah yang digunakan untuk membangun sebuah docker image.
- -t : Flag yang digunakan untuk mendefinisikan nama image yang akan dibuat.
- belajar-nginx: Nama yang akan digunakan pada image yang akan dibuat.
- `.` : Lokasi dimana Dockerfile berada.

![enter link description here](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/dockerfile3.png)

**5. Verifikasi image yang telah dibuat.**

Untuk melakukan verifikasi pada image yang telah dibuat, silakan menjalankan baris perintah berikut ini:

```bash
root@dockerfile:~/latihan# docker image ls
```

![enter image description here](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/dockerfile4.png)

**6. Buat sebuah container berdasarkan image yang telah dibuat.**

Untuk membuat sebuah container berdasarkan image yang telah dibuat, silakan menjalankan baris perintah berikut ini:

```bash
root@dockerfile:~/latihan# docker run -d -p80:80 --name container-belajar belajar-nginx
d521e5da0dcffe2ab58992ca4e7e4e4696284ee8a3fe2381d696056a7425dfe2
```

Lalu verifikasi bahwa container telah berjalan:

```bash
root@dockerfile:~/latihan# docker container ls -a
```

![enter image description here](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/dockerfile5.png)

**7. Akses nginx dengan cURL**

```
root@dockerfile:~/latihan# curl localhost
<h1> ini merupakan halaman index yang berjalan pada container <h1>
```

![enter image description here](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/dockerfile6.png)

**Selesai !**

Sekian dulu artikel **Cara Menggunakan Dockerfile Secara Praktis** kali ini, selanjutnya kita akan belajar tentang cara melakukan publikasi image ke repository docker.

