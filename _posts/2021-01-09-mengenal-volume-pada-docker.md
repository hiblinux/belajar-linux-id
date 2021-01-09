---
title: "Docker: Mengenal Volume Pada Docker"
description: Volume adalah mekanisme untuk menyimpan data yang dihasilkan dan digunakan oleh container Docker. Jika mount dan bind bergantung pada struktur direktori dan OS dari host, maka volume sepenuhnya dikelola oleh Docker. Volume memiliki beberapa keunggulan dibandingkan mount dan bind.
lang: id_ID
date: 2021-01-09 17:55 +0700
layout: post
featured: true
author: leon
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/Docker-Mengenal-Volume-Pada-Docker.png
categories:
  - docker
  - ubuntu
---


Pada kali ini **Belajar Linux ID** ingin berbagi tutorial tentang **Mengenal Volume Pada Docker** (Ubuntu, CentOS, Debian). Apabila kalian belum mengetahui apa itu Docker, maka kalian perlu membaca kembali artikel kami sebelumnya:

- [Docker: Pengenalan Terhadap Docker](https://belajarlinux.id/pengenalan-terhadap-docker/).
- [Docker: Cara Instalasi Docker Pada Linux](https://belajarlinux.id/docker-installasi-docker-pada-linux/)
- [Docker: Cara Menggunakan Dockerfile Secara Praktis](https://belajarlinux.id/cara-menggunakan-Dockerfile/)
- [Docker: Publikasi Image Docker ke Repository Docker Hub](https://belajarlinux.id/publikasi-image-docker-ke-repository-docker-hub/)

**Docker Volume**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/types-of-mounts-volume.png)

Volume adalah mekanisme untuk menyimpan data yang dihasilkan dan digunakan oleh container Docker. Jika mount dan bind bergantung pada struktur direktori dan OS dari host, maka volume sepenuhnya dikelola oleh Docker. Volume memiliki beberapa keunggulan dibandingkan mount dan bind:

- Volume lebih mudah untuk dibackup atau dimigrasi daripada bind mount.
- Anda dapat mengelola volume menggunakan perintah Docker CLI atau API Docker.
- Volume berfungsi pada container Linux dan Windows.
- Volume dapat dibagikan dengan lebih aman di antara banyak kontainer.
- Driver volume memungkinkan Anda menyimpan volume di remote host atau penyedia cloud, untuk mengenkripsi konten volume, atau menambahkan fungsionalitas lainnya.
- Volume baru dapat memiliki kontennya yang telah diisi sebelumnya oleh sebuah wadah.
- Volume di Docker Desktop memiliki kinerja yang jauh lebih tinggi daripada bind mount dari host Mac dan Windows.

**Membuat Volume Docker**

Untuk membuat volume pada docker, kalian dapat menggunakan perintah berikut:

```bash
$ sudo docker volume create blid-vol
blid-vol
```

**Menampilkan List Volume**

Untuk menampilkan daftar docker volume yang berada pada host, silakan untuk menjalankan perintah ini.

```bash
$ sudo docker volume list
DRIVER    VOLUME NAME
local     blid-vol
```

**Menampilkan Informasi Volume**

Untuk menampilkan informasi docker volume yang berada pada host, silakan untuk menjalankan perintah ini.

```bash
$ sudo docker volume inspect blid-vol
[
    {
        "CreatedAt": "2021-01-09T10:17:00Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/blid-vol/_data",
        "Name": "blid-vol",
        "Options": {},
        "Scope": "local"
    }
]
```

**Menjalankan Sebuah Volume Pada Container**

Untuk menjalankan docker volume pada sebuah container, silakan untuk menjalankan perintah ini.

```bash
$ sudo docker run -d --name=nginxtest -v blid-vol:/usr/share/nginx/html nginx:latest

Unable to find image 'nginx:latest' locally
latest: Pulling from library/nginx
6ec7b7d162b2: Pull complete
cb420a90068e: Pull complete
2766c0bf2b07: Pull complete
e05167b6a99d: Pull complete
70ac9d795e79: Pull complete
Digest: sha256:4cf620a5c81390ee209398ecc18e5fb9dd0f5155cd82adcbae532fec94006fb9
Status: Downloaded newer image for nginx:latest
0f07d2638e5fcb481f788d39a70ed033647846a787ffd12042f00b384cf23b60
```

Untuk menguji konten pada volume yang telah ditambahkan ke container, silakan untuk dibuat 1 buah file index.html dengan contoh isi berikut ini:

```bash
$ sudo echo "This is from blid-vol source directory." > index.html
$ sudo mv index.html /var/lib/docker/volumes/blid-vol/_data
```

Apabila sudah, untuk mengetahui IP Address yang digunakan oleh container silakan menjalankan perintah berikut ini:

```bash
$ sudo docker inspect nginxtest |grep -i ipaddress
            "SecondaryIPAddresses": null,
            "IPAddress": "172.17.0.2",
                    "IPAddress": "172.17.0.2",
```

Uji curl ke ip address container dan pastikan konten sesuai dengan yang ada pada volume:

```bash
$ curl 172.17.0.2
This is from blid-vol source directory.
```

**Selesai**

Sekian dulu artikel **Mengenal Volume Pada Docker** kali ini, selanjutnya kita akan belajar tentang cara mendeploy project aplikasi sederhana pada docker.
