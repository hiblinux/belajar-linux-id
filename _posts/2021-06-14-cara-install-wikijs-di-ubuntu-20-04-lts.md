---
title: Cara Install Woki JS di Ubuntu 20.04 LTS
description: 'Dibangun di atas Git, Node.js, dan Markdown, Wiki.js adalah aplikasi wiki open source yang andal yang memungkinkan Anda menulis dan mengelola konten dalam format Markdown (.md) yang mudah digunakan baik untuk orang awam sekalipun'
lang: id_ID
date: 2021-06-14 03:53 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/cover-wiki-js01.png
categories:
- linux
- ubuntu
---

[Belajar Linux ID](htttps://belajarlinux.id) -  Dibangun di atas Git, Node.js, dan Markdown, Wiki.js adalah aplikasi wiki open source yang andal yang memungkinkan Anda menulis dan mengelola konten dalam format Markdown (.md) yang mudah digunakan baik untuk orang awam sekalipun. 

Wiki.js menyediakan berbagai macam module yang dapat di integrasikan dengan mudah mulai dari module *Analitik, Authentikasi, Databases, Editors* dan masih banyak lagi lainnya, untuk detail dapat dilihat pada link berikut: ***[Module Wiki.js](https://js.wiki/modules)*** 

Wiki.js dirilis di bawah [GNU Affero General Public License](https://en.wikipedia.org/wiki/GNU_Affero_General_Public_License) dan sudah tersedia di market place provider cloud digital ocean dan aws artinya jika Anda menggunakan Digital Ocean dan AWS maka Anda hanya perlu sekali klik untuk dapat menggunakan Wiki.js. 

Jika Anda ingin install di instance atau hosting Anda pribadi juga dapat dilakukan.

Pada panduan kali ini kami akan memberikan Anda tahapan bagaimana cara install Wiki.js di instance/VM Ubuntu 20.04 LTS.

## Server Requirement Wiki.js

Wiki.js dapat berjalan diberbagai macam OS mulai dari *Linux, Windows dan MacOS* bahkan dapat dijalankan container seperti **Docker / Kubernetes** and **Heroku**.

Untuk detail minumum spesifikasi yang dibutuhkan dapat Anda lihat pada link berikut:  [Server Requirements](https://docs.requarks.io/install/requirements)

## Tahapan Instalasi Wiki.js

Sebelum lanjut ke tahapan instasinya ada baiknya kita mengetahui terlebih dahulu komponen atau service apa saja yang akan kita gunakan nantinya.  Berikut komponen atau service yang akan kita gunakan untuk instalasi Wiki.js di Ubuntu 20.04 LTS.

- Docker
- PostgreSQL 11 *(dockerized)*
- Wiki.js 2.x *(dockerized, accessible via port 80)*
- Wiki.js Update Companion *(dockerized)*
- OpenSSH with UFW Firewall preconfigured for SSH, HTTP and HTTPS

Dilihat dari komponen diatas kita dapat menebak bahwa aplikasi Wiki.js ini nantinya akan berjalan di docker container yang terinstall di instance/vm Anda. 

**Baca Juga:**

- [Docker: Pengenalan Terhadap Docker](https://belajarlinux.id/pengenalan-terhadap-docker/)
- [Docker: Cara Instalasi Docker Pada Linux](https://belajarlinux.id/docker-installasi-docker-pada-linux/)
- [Docker: Cara Menjalankan Project Sederhana Pada Docker](https://belajarlinux.id/menjalankan-project-sederhana-pada-docker/)

Silakan login ke instance atau Virtual Machine (VM) Anda terlebih dahulu. Kemudian lakukan update dan installl update otomatis 

```bash
ubuntu@lab-belajarlinux:~$ sudo apt -qqy update
ubuntu@lab-belajarlinux:~$ sudo DEBIAN_FRONTEND=noninteractive apt-get -qqy -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' dist-upgrade
```

Selanjutnya instalasi dependensi yang dibutuhkan

```bash
sudo apt -qqy -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' install apt-transport-https ca-certificates curl gnupg-agent software-properties-common openssl
```

Install docker paket registry

```bash
ubuntu@lab-belajarlinux:~$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
OK
ubuntu@lab-belajarlinux:~$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
Get:1 https://download.docker.com/linux/ubuntu focal InRelease [52.1 kB]
Get:2 https://download.docker.com/linux/ubuntu focal/stable amd64 Packages [9960 B]    
Hit:3 http://security.ubuntu.com/ubuntu focal-security InRelease                
Hit:4 http://az-01.clouds.archive.ubuntu.com/ubuntu focal InRelease
Hit:5 http://az-01.clouds.archive.ubuntu.com/ubuntu focal-updates InRelease
Hit:6 http://az-01.clouds.archive.ubuntu.com/ubuntu focal-backports InRelease
Fetched 62.1 kB in 1s (47.9 kB/s)
Reading package lists... Done
ubuntu@lab-belajarlinux:~$ 
```

Silakan update dan install docker menggunakan perintah berikut

```bash
buntu@lab-belajarlinux:~$ sudo apt -qqy update
All packages are up to date.
ubuntu@lab-belajarlinux:~$ sudo apt -qqy -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' install docker-ce docker-ce-cli containerd.io
```

Membuat direktori wiki.js untuk kebutuhan instalasi

```bash
ubuntu@lab-belajarlinux:~$ sudo mkdir -p /etc/wiki
```

Generate secret database wiki.js

```bash
ubuntu@lab-belajarlinux:~$ openssl rand -base64 32 > /etc/wiki/.db-secret
```

Membuat internal network docker untuk wiki.js

```bash
ubuntu@lab-belajarlinux:~$ sudo docker network create wikinet
145af1227ab1212d88efb767c6d4deb94899199f6c7f6e4bc87d8f14ff6419a0
ubuntu@lab-belajarlinux:~$ 
```

Membuat data volume untuk PostgreSQL

```bash
ubuntu@lab-belajarlinux:~$ sudo docker volume create pgdata
pgdata
ubuntu@lab-belajarlinux:~$ 
```

Selanjutnya membuat container wiki.js

```bash
ubuntu@lab-belajarlinux:~$ sudo docker create --name=db -e POSTGRES_DB=wiki -e POSTGRES_USER=wiki -e POSTGRES_PASSWORD_FILE=/etc/wiki/.db-secret -v /etc/wiki/.db-secret:/etc/wiki/.db-secret:ro -v pgdata:/var/lib/postgresql/data --restart=unless-stopped -h db --network=wikinet postgres:11
```

```bash
ubuntu@lab-belajarlinux:~$ sudo docker create --name=wiki -e DB_TYPE=postgres -e DB_HOST=db -e DB_PORT=5432 -e DB_PASS_FILE=/etc/wiki/.db-secret -v /etc/wiki/.db-secret:/etc/wiki/.db-secret:ro -e DB_USER=wiki -e DB_NAME=wiki -e UPGRADE_COMPANION=1 --restart=unless-stopped -h wiki --network=wikinet -p 80:3000 -p 443:3443 requarks/wiki:2
```

```bash
ubuntu@lab-belajarlinux:~$ sudo docker create --name=wiki-update-companion -v /var/run/docker.sock:/var/run/docker.sock:ro --restart=unless-stopped -h wiki-update-companion --network=wikinet requarks/wiki-update-companion:latest
```

Apabila container sudah berhasil dibuat silakan di start container

```bash
ubuntu@lab-belajarlinux:~$ 
ubuntu@lab-belajarlinux:~$ sudo docker start db
db
ubuntu@lab-belajarlinux:~$ sudo docker start wiki
wiki
ubuntu@lab-belajarlinux:~$ sudo docker start wiki-update-companion
wiki-update-companion
ubuntu@lab-belajarlinux:~$ 
```

Saat ini wiki.js sudah berjalan untuk memastikannya silakan akses http://ip_server melalui browser hasilnya akan nampak seperti gambar berikut

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/wikijs-01.png)

Catatan: 

- Administrator Email: Input email Anda dan email ini digunakan untuk login ke Administrator
- Password: Input password Anda
- Site URL: URL untuk Wiki.js Anda

Jika sudah silakan klik install dan tunggu beberapa saat proses instalasi Wiki.js sudah selesai dilakukan dan akan nampak seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/wikijs-02.png)

Silakan login menggunakan email dan password yang sudah dibuat sebelumnya, jika berhasil berikut default tampilan awal dari Wiki.js silakan klik pada tombol *+ Create Home Page*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/wikijs-03.png)

Tentukan menu **Home** yang ingin digunakan, disini kami menggunakan *Markdown*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/wikijs-04.png)

Berikut tampilan default dashboard dari Wiki.js

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/wikijs-05.png)

Sampai disini Anda sudah berhasil melakukan instalasi Wiki.js di Ubuntu 20.04 LTS. 

Selamat mencoba 😁