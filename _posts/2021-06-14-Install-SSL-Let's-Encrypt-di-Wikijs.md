---
title: Install SSL Let's Encrypt di Wikijs
description: 'Dibangun di atas Git, Node.js, dan Markdown, Wiki.js adalah aplikasi wiki open source yang andal yang memungkinkan Anda menulis dan mengelola konten dalam format Markdown (.md) yang mudah digunakan baik untuk orang awam sekalipun'
lang: id_ID
date: 2021-06-14 15:33 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/ssl-wiki-js.png
categories:
- linux
- ubuntu
- ssl
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini merupakan lanjutan dari tutorial sebelumnya mengenai [Cara Install Wiki.js di Ubuntu 20.04 LTS](https://belajarlinux.id/cara-install-wikijs-di-ubuntu-20-04-lts/)  tujuan dari tutorial kali ini supaya Wiki.js Anda dapat diakses melalui menggunakan domain dan aman dengan adanya proteksi SSL (Secure Socket Layer) dimana untuk SSL yang kami gunakan pada tutorial ini yaitu free SSL dari [Let's Encrypt](https://letsencrypt.org/).

Untuk mengikut panduan ini pastikan Anda sudah melakukan instalasi Wiki.js nya terlebih dahulu dan silakan tentukan domain yang ingin digunakan dan pastikan domain tersebut sudah diarahkan ke IP instance/vm dengan cara menambahkan A record, contoh seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/wikijs-ssl-00.png)

Disini kami menggunakan subdomain *note.belajarlinux.id*, kemudian silakan akses instance/vm Wiki.js Anda melalui ssh dan stop dan remove existing container wiki.js

```bash
ubuntu@lab-belajarlinux:~$ sudo docker stop wiki
wiki
ubuntu@lab-belajarlinux:~$ sudo docker rm wiki
wiki
ubuntu@lab-belajarlinux:~$ 
```

*Catatan: stop dan remove wiki container tidak akan menghapus data existing atau data yang sudah ada di Wiki.js*

Kemudian, jalankan satu baris perintah berikut untuk install SSL [Let's Encrypt](https://letsencrypt.org/) di Wiki.js

```bash
ubuntu@lab-belajarlinux:~$ sudo docker create --name=wiki -e LETSENCRYPT_DOMAIN=note.belajarlinux.my.id -e LETSENCRYPT_EMAIL=me@belajarlinux.id -e SSL_ACTIVE=1 -e DB_TYPE=postgres -e DB_HOST=db -e DB_PORT=5432 -e DB_PASS_FILE=/etc/wiki/.db-secret -v /etc/wiki/.db-secret:/etc/wiki/.db-secret:ro -e DB_USER=wiki -e DB_NAME=wiki -e UPGRADE_COMPANION=1 --restart=unless-stopped -h wiki --network=wikinet -p 80:3000 -p 443:3443 requarks/wiki:2
3318044a84857562d7976e0af60419eb5f1b4deb93a3ce6aa7a207af5583826a
ubuntu@lab-belajarlinux:~$
```

*Catatan: Silakan sesuaikan domain/subdomain dan email yang ingi Anda gunakan*

Jika sudah silakan start docker wiki.js nya kembali

```bash
ubuntu@lab-belajarlinux:~$ 
ubuntu@lab-belajarlinux:~$ sudo docker start wiki
wiki
ubuntu@lab-belajarlinux:~$
```

Untuk melihat log pemasagan SSL nya dapat dilakukan menggunakan perintah berikut

```bash
ubuntu@lab-belajarlinux:~$ sudo docker logs wiki
Loading configuration from /wiki/config.yml... OK
DB_PASS_FILE is defined. Will use secret from file.
2021-06-13T18:28:30.085Z [MASTER] info: =======================================
2021-06-13T18:28:30.086Z [MASTER] info: = Wiki.js 2.5.201 =====================
2021-06-13T18:28:30.087Z [MASTER] info: =======================================
2021-06-13T18:28:30.087Z [MASTER] info: Initializing...
2021-06-13T18:28:30.563Z [MASTER] info: Using database driver pg for postgres [ OK ]
2021-06-13T18:28:30.567Z [MASTER] info: Connecting to database...
2021-06-13T18:28:30.585Z [MASTER] info: Database Connection Successful [ OK ]
2021-06-13T18:28:31.080Z [MASTER] warn: Mail is not setup! Please set the configuration in the administration area!
2021-06-13T18:28:31.163Z [MASTER] info: Loading GraphQL Schema...
2021-06-13T18:28:31.732Z [MASTER] info: GraphQL Schema: [ OK ]
2021-06-13T18:28:31.937Z [MASTER] info: HTTP Server on port: [ 3000 ]
2021-06-13T18:28:31.968Z [MASTER] info: (LETSENCRYPT) Initializing Let's Encrypt client...
2021-06-13T18:28:31.991Z [MASTER] info: HTTP Server: [ RUNNING ]
2021-06-13T18:28:32.584Z [MASTER] info: Telemetry is active: [ OK ]
2021-06-13T18:28:32.787Z [MASTER] info: (LETSENCRYPT) Setting up account for the first time...
2021-06-13T18:28:34.665Z [MASTER] info: (LETSENCRYPT) Account was setup successfully [ OK ]
2021-06-13T18:28:34.665Z [MASTER] info: (LETSENCRYPT) Generating server keypairs...
2021-06-13T18:28:34.689Z [MASTER] info: (LETSENCRYPT) Server keypairs generated successfully [ OK ]
2021-06-13T18:28:34.689Z [MASTER] info: (LETSENCRYPT) Generating certificate signing request (CSR)...
2021-06-13T18:28:34.693Z [MASTER] info: (LETSENCRYPT) CSR generated successfully [ OK ]
2021-06-13T18:28:34.693Z [MASTER] info: (LETSENCRYPT) Requesting certificate from Let's Encrypt...
2021-06-13T18:28:34.696Z [MASTER] info: (LETSENCRYPT) Setting HTTP challenge for note.belajarlinux.my.id: [ READY ]
2021-06-13T18:28:34.696Z [MASTER] info: (LETSENCRYPT) Waiting for challenge to complete...
ubuntu@lab-belajarlinux:~$ 
```

Verifikasi dengan cara akses Wiki.js menggunakan domain note.belajarlinux.my.id

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/wikijs-ssl-01.png)

Secara default untuk konfiguras site URL di Wiki.js tidak menggunakan https, oleh karena itu Anda dapat set auto redirect dari HTTP ke HTTPS melalui Administrator Wiki.js dengan cara login ke Wiki.js >> Administration >> SSL. 

Berikut tampilan awalnya

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/wikijs-ssl-02.png)

Klik **Turn On** untuk set redirect dari http ke https

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/wikijs-ssl-03.png)

Saat ini redirect http ke https sudah aktif dan berikut hasil nya

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/wikijs-ssl-04.png)

Sampai disini Anda sudah berhasil melakukan instalasi SSL di Wiki.js.

Selamat mencoba 😁