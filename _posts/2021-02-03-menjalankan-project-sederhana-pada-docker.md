---
title: "Docker: Cara Menjalankan Project Sederhana Pada Docker"
description: Pada kali ini **Belajar Linux ID** ingin berbagi tutorial tentang **Cara Menjalankan Project Sederhana Pada Docker** (Ubuntu, CentOS, Debian). Apabila kalian belum mengetahui apa itu Docker, maka kalian perlu membaca kembali artikel kami sebelumnya
lang: id_ID
date: 2021-02-03 13:21 +0700
layout: post
featured: true
author: leon
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/docker-project.png
categories:
  - docker
  - ubuntu
---

Pada kali ini **Belajar Linux ID** ingin berbagi tutorial tentang **Cara Menjalankan Project Sederhana Pada Docker** (Ubuntu, CentOS, Debian). Apabila kalian belum mengetahui apa itu Docker, maka kalian perlu membaca kembali artikel kami sebelumnya:

-   [Docker: Pengenalan Terhadap Docker](https://belajarlinux.id/pengenalan-terhadap-docker/).
-   [Docker: Cara Instalasi Docker Pada Linux](https://belajarlinux.id/docker-installasi-docker-pada-linux/)
-   [Docker: Cara Menggunakan Dockerfile Secara Praktis](https://belajarlinux.id/cara-menggunakan-Dockerfile/)
-   [Docker: Publikasi Image Docker ke Repository Docker Hub](https://belajarlinux.id/publikasi-image-docker-ke-repository-docker-hub/)
- [Docker: Mengenal Volume Pada Docker](https://belajarlinux.id/mengenal-volume-pada-docker/)

Dari pembahasan sebelumnya kita telah belajar tentang basic basic penggunaan Docker, kurang lengkap rasanya jika tidak ada praktek untuk menjalankan projek sederhana menggunakan Docker.

Projek yang akan kita coba jalankan adalah aplikasi web sederhana yang dapat diunduh pada repository : [https://github.com/gabrielecirulli/2048](https://github.com/gabrielecirulli/2048)

Langsung saja:

**1. Clone repo ke server Docker**

```bash
~# git clone https://github.com/gabrielecirulli/2048.git

Cloning into '2048'...
remote: Enumerating objects: 1315, done.
remote: Total 1315 (delta 0), reused 0 (delta 0), pack-reused 1315
Receiving objects: 100% (1315/1315), 612.22 KiB | 603.00 KiB/s, done.
Resolving deltas: 100% (775/775), done.
```

**2. Buat Dockerfile**

Image dasar yang akan kita gunakan untuk menjalankan aplikasi 2048 tersebut adalah nginx, dan untuk membuat Dockerfilenya bisa mengikuti contoh berikut:

```bash
~# vi Dockerfile

FROM nginx
ADD 2048 /usr/share/nginx/html
```

***) Keterangan:**

- FROM: Definisikan image dasar agar menggunakan image nginx
- ADD: Tambahkan file repo aplikasi 2048 ke direktori nginx /usr/share/nginx/html

**3. Buat image berdasarkan Dockerfile**

```
~# docker build -t belajarlinux:2048 .

Sending build context to Docker daemon  1.381MB
Step 1/2 : FROM nginx
 ---> ae2feff98a0c
Step 2/2 : ADD 2048 /usr/share/nginx/html
 ---> 4da867181df6
Successfully built 4da867181df6
Successfully tagged belajarlinux:2048
```

Jika proses build sudah selesai, saatnya mencoba jalankan containernya.

**4. Jalankan container berdasarkan image belajarlinux:2048**

```
~# docker run -d -p 1111:80 belajarlinux:2048

33c646db68bfae58e26af3a8c86f1b0d0d55ee540f8f1e8207c2014751ca90ea

# docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                  NAMES
33c646db68bf        belajarlinux:2048   "/docker-entrypoint.…"   25 seconds ago      Up 24 seconds       0.0.0.0:1111->80/tcp   elegant_gates
```

**5. Uji akses dari browser**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/2048.png)


