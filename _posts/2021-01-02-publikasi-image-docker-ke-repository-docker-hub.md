---
title: "Docker: Publikasi Image Docker ke Repository Docker Hub"
description: Pada kali ini Belajar Linux ID ingin berbagi tutorial tentang Cara Publikasi Image Docker ke Repository Docker Hub (Ubuntu, CentOS, Debian).
lang: id_ID
date: 2021-01-02 09:28 +0700
layout: post
featured: true
author: leon
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/Publikasi-Image-Docker-ke-Repository-Docker-Hub.png
categories:
  - docker
  - ubuntu
---


Pada kali ini **Belajar Linux ID** ingin berbagi tutorial tentang **Cara Publikasi Image Docker ke Repository Docker Hub** (Ubuntu, CentOS, Debian). Apabila kalian belum mengetahui apa itu Docker, maka kalian perlu membaca kembali artikel kami sebelumnya: 

- [Docker: Pengenalan Terhadap Docker](https://belajarlinux.id/pengenalan-terhadap-docker/).
- [Docker: Cara Instalasi Docker Pada Linux](https://belajarlinux.id/docker-installasi-docker-pada-linux/)
- [Docker: Cara Menggunakan Dockerfile Secara Praktis](https://belajarlinux.id/cara-menggunakan-Dockerfile/)

Pada artikel sebelumnya kita telah belajar tentang cara membuat sebuah image untuk docker, image ini dapat kita simpan ke repository docker hub ( https://hub.docker.com ) agar apabila kita akan menggunakan image yang kita buat pada server atau device yang berbeda, yang perlu dilakukan hanyalah melakukan download atau pull image yang berada pada repository docker tanpa perlu membuat sebuah image dari awal kembali.

Hal ini tentunya akan membantu para pengembang untuk melakukan pengujian dan peluncuran aplikasi secara cepat dan mendukung pada perangkat yang berbeda.

Hal yang perlu dipersiapkan pertama adalah, membuat akun pada repository docker hub, berikut adalah halamannya: [Daftar Disini.](https://hub.docker.com/signup)

**1. Login ke repository Docker Hub**

Apabila sudah mendaftarkan akun pada repository docker hub, silakan membuka terminal server dan jalankan perintah berikut ini:

```bash
leon@dockerfile:~$ sudo docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: blinuxid
Password:
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

**2. Menampilkan image yang tersedia**

Langkah selanjutnya silakan untuk menjalankan perintah berikut untuk menampilkan image yang tersedia:

```bash
leon@dockerfile:~$ sudo docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
belajar-nginx       latest              729c3c59ba60        5 days ago          133MB
```

**3. Berikan tag pada image**

Langkah selanjutnya adalah memberikan tag pada image dengan format `[USER]/nama-image:tag` berikut adalah perintahnya:

```bash
leon@dockerfile:~$ sudo docker tag belajar-nginx blinuxid/belajar-nginx:1.0
leon@dockerfile:~$ sudo docker image ls
REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
blinuxid/belajar-nginx   1.0                 729c3c59ba60        5 days ago          133MB
belajar-nginx            latest              729c3c59ba60        5 days ago          133MB
```

**4. Dorong image ke repository docker**

Langkah selanjutnya adalah mendorong image yang sudah diberikan tag ke repository docker, berikut adalah perintahnya:

```bash
leon@dockerfile:~$ sudo docker push blinuxid/belajar-nginx:1.0
The push refers to repository [docker.io/blinuxid/belajar-nginx]
610f0f5e55db: Pushed
4eaf0ea085df: Mounted from library/nginx
2c7498eef94a: Mounted from library/nginx
7d2b207c2679: Mounted from library/nginx
5c4e5adc71a8: Mounted from library/nginx
87c8a1d8f54f: Mounted from library/nginx
1.0: digest: sha256:01e520a3cd1a5b343c45fbf84374149bb4a7c19f7946316b661eb22f38d2484a size: 1569
```

**5. Verifikasi image pada repositori docker hub.**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/push-docker1.png)
**6. Selesai !**

Sekian dulu artikel **Cara Publikasi Image Docker ke Repository Docker Hub** kali ini, selanjutnya kita akan belajar tentang cara melakukan pembuatan volume docker.
