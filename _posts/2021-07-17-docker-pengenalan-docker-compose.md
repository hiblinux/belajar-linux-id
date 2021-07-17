---
title: "Docker: Pengenalan Docker Compose"
description: Pada kali ini **Belajar Linux ID** ingin berbagi tutorial tentang **Pengenalan Docker Compose** (Ubuntu, CentOS, Debian). Apabila kalian belum mengetahui apa itu **Docker**, maka kalian perlu membaca kembali artikel kami sebelumnya:
lang: id_ID
date: 2021-07-17 21:45 +0700
layout: post
featured: true
author: leon
image: http://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/cover-docker-compose.png
categories:
  - docker
  - linux
  - docker-compose
---


Pada kali ini **Belajar Linux ID** ingin berbagi tutorial tentang **Pengenalan Docker Compose** (Ubuntu, CentOS, Debian). Apabila kalian belum mengetahui apa itu **Docker**, maka kalian perlu membaca kembali artikel kami sebelumnya:

- [Docker: Pengenalan Terhadap Docker](https://belajarlinux.id/pengenalan-terhadap-docker/).
- [Docker: Cara Instalasi Docker Pada Linux](https://belajarlinux.id/docker-installasi-docker-pada-linux/)
- [Docker: Cara Menggunakan Dockerfile Secara Praktis](https://belajarlinux.id/cara-menggunakan-Dockerfile/)
- [Docker: Publikasi Image Docker ke Repository Docker Hub](https://belajarlinux.id/publikasi-image-docker-ke-repository-docker-hub/)
- [Docker: Mengenal Volume Pada Docker](https://belajarlinux.id/mengenal-volume-pada-docker/)
- [Docker: Cara Menjalankan Project Sederhana Pada Docker](https://belajarlinux.id/menjalankan-project-sederhana-pada-docker/)

Pada pembahasan sebelumnya kita sudah belajar tentang **Cara Menjalankan Project Sederhana Pada Docker**, agar diskusi tentang docker tetap berlanjut kali ini kita akan mengenal tentang apa itu **Docker Compose**.

## Docker Compose

Sambil mengigat materi sebelumnya, kita sudah belajar tentang **Dockerfile**, yaitu sebuah text sederhana yang digunakan untuk membangun sebuah **Docker Image**.

Lalu apa perbedaannya dengan **Docker Compose** ?

Docker compose digunakan oleh user untuk mendefinisikan sebuah atau beberapa services yang nantinya akan digunakan untuk membentuk sebuah aplikasi dalam kesatuan.

Services yang dimaksud ini bisa berupa service **website** (webserver) atau **database** ataupun keduanya tergantung dengan kebutuhan dari user.

**Docker Compose** ini menggunakan struktur bahasa [**YAML**](https://yaml.org/). 

## Kegunaan Docker Compose

Setelah mengetahui perbedaan **Dockerfile** dengan **Docker Compose** sekarang kita perlu tahu apa sih kegunaannya ?

**Docker Compose** digunakan user untuk mempercepat dan mempermudah pembuatan service atau aplikasi pada sebuah container.

Berbeda dengan cara tradisional, yang biasanya user akan membuat satu persatu services container dengan menggunakan [**Docker CLI**](https://belajarlinux.id/pengenalan-terhadap-docker/), pada **Docker Compose** kebutuhan pembuatan aplikasi akan dijadikan pada sebuat wadah text bernama **docker-compose.yml**, pada file ini user bisa mendefinisikan service - service yang nantinya akan digunakan oleh aplikasi dan ketika struktur service sudah selesai dibuat user bisa menjalankan servicenya hanya dengan 1 baris perintah : `docker-compose up`

Sampai disini apakah ada hal yang ingin ditanyakan ? silakan komentar dibawah ya sebelum kita lanjut ke pembahasan selanjutnya.

## Selesai
Selamat mencoba dan semoga berhasil, apabila terdapat pertanyaan dapat langsung di email ke [Kami](mailto:tech@belajarlinux.id).

Jangan lupa untuk membaca artikel kami yang lainnya.
