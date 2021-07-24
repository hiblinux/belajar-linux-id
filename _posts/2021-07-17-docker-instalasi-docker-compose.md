---
title: "Docker: Instalasi Docker Compose"
description: Pada kali ini **Belajar Linux ID** ingin berbagi tutorial tentang **Instalasi Docker Compose** (Ubuntu, CentOS, Debian). Apabila kalian belum mengetahui apa itu **Docker**, maka kalian perlu membaca kembali artikel kami sebelumnya
lang: id_ID
date: 2021-07-17 22:15 +0700
layout: post
featured: true
author: leon
image: http://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/cover-install-docker-compose.png
categories:
  - docker
  - docker-compose
  - linux
---


Pada kali ini **Belajar Linux ID** ingin berbagi tutorial tentang **Instalasi Docker Compose** (Ubuntu, CentOS, Debian). Apabila kalian belum mengetahui apa itu **Docker**, maka kalian perlu membaca kembali artikel kami sebelumnya:

- [Docker: Pengenalan Terhadap Docker](https://belajarlinux.id/pengenalan-terhadap-docker/).
- [Docker: Cara Instalasi Docker Pada Linux](https://belajarlinux.id/docker-installasi-docker-pada-linux/)
- [Docker: Cara Menggunakan Dockerfile Secara Praktis](https://belajarlinux.id/cara-menggunakan-Dockerfile/)
- [Docker: Publikasi Image Docker ke Repository Docker Hub](https://belajarlinux.id/publikasi-image-docker-ke-repository-docker-hub/)
- [Docker: Mengenal Volume Pada Docker](https://belajarlinux.id/mengenal-volume-pada-docker/)
- [Docker: Cara Menjalankan Project Sederhana Pada Docker](https://belajarlinux.id/menjalankan-project-sederhana-pada-docker/)
- [Docker: Pengenalan Docker Compose](https://belajarlinux.id/docker-pengenalan-docker-compose/)

Pada pembahasan sebelumnya kita sudah belajar tentang **Pengenalan Docker Compose**, agar diskusi tentang docker tetap berlanjut kali ini kita akan belajar cara instalasi **Docker Compose**.

## Sebelum Install

1. Pastikan pada mesin sudah terinstall Docker. ( Baca: [Docker: Cara Instalasi Docker Pada Linux](https://belajarlinux.id/docker-installasi-docker-pada-linux/) )

{:start="2"}

2. Koneksi internet stabil untuk menyelesaikan artikel ini.

## Install Docker Compose 

Cara ini berlaku pada OS Ubuntu, CentOS, dan Debian. 

**1. Download binary docker compose**

Pertama - tama download binary **Docker Compose** terlebih dahulu:

```bash
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
**2. Beri permission execute pada file binary**

Agar binary yang telah didownload dapat digunakan, kita perlu menambahkan permission execute terlebih dahulu:

```
chmod +x /usr/local/bin/docker-compose
```

**3. Verifikasi instalasi**

Jalankan command berikut untuk memverifikasi instalasi **Docker Compose**.

```
docker-compose --version
docker-compose version 1.29.2, build 5becea4c
```

![](http://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/docker-compose1.png)

## Selesai
Selamat mencoba dan semoga berhasil, apabila terdapat pertanyaan dapat langsung di email ke [Kami](mailto:tech@belajarlinux.id).

Jangan lupa untuk membaca artikel kami yang lainnya. 
