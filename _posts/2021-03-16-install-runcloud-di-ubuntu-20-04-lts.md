---
title: Install RunCloud di Ubuntu 20.04 LTS
description: 'RunCloud adalah panel server web modern yang dirancang untuk membantu Anda mengelola aplikasi web dan situs web PHP (PHP Cloud Server Management Panel) dengan mudah dan cepat'
lang: id_ID
date: 2021-03-16 18:34 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/runcloudcover.png
categories:
 - runcloud
 - ubuntu
---

[Belajar Linux ID](https://belajarlinux.id) - [RunCloud](https://runcloud.io/) adalah panel server web modern yang dirancang untuk membantu Anda mengelola aplikasi web dan situs web PHP *(PHP Cloud Server Management Panel)* dengan mudah dan cepat.

RunCloud megadopsi sistem berbasis cloud SaaS *(Software as a Service)* yang dapat Anda gunakan untuk management server atau instance yang ada di beberapa penyedia provider cloud seperti  **Linode, Digital Ocean, Vultr, UpCloud, Amazon Lightsail, Google Cloud Platform, Amazon Web Service dan Azue** namun Anda juga dapat menggunakan RunCloud untuk melakukan management server/instance/VPS di luar provider tersebut dengan syarat memiliki sebuah server/instance/vps dengan sistem operasi Ubuntu 18.04 LTS atau 20.04 LTS. 

Banyak fitur dan manfaat yang didapatkan jika kita menggunakan RunCloud, karena RunCloud menawarkan berbagai macam fitur menarik dan serba praktis yang dapat Anda gunakan mulai dari

- **[Server Management](https://runcloud.io/server-management)**
- **[Backup](https://runcloud.io/backup)**
- [**Atomic Deployment**](https://runcloud.io/atomic-deployment)
- **[Team](https://runcloud.io/team)**

Selain itu RunCloud sudah menyediakan template berupa script installer jika ingin melakukan instalasi `Frameworks atau CMS` seperti **Laravel, Yii Framework, WordPress, Joomla, Drupal, Code Inginter, CakePHP** dan masih banyak lainnya. 

Dengan segudang fitur yang ditawarkan diatas RunCloud tidak sepenuhnya gratis jika Anda ingin mencoba RunCloud dapat menggunakan fitur trial selama 5 hari sebelum lanjut ke production menggunakan RunCloud. Untuk harga atau pricing dari RunCloud dapat dilihat pada link berikut: **[RunCloud Pricing](https://runcloud.io/pricing)**

Pada tutorial kali ini akan dibahas bagaimana cara melakukan instalasi RunCloud di server/instance/vps menggunakan sistem operasi Ubuntu 20.04 LTS. Sebelum itu ada baiknya kita mengetahui terlebih dahulu *system requirement* yang dibutuhkan sebagai berikut: 

**Software requirement:**

- Ubuntu 16.04/18.04/20.04 x86_64 LTS (Fresh installation)
- Tidak mendukung pada VPS OpenVZ (Kernel 2.6)

**Hardware Requirement:**

- Minimal lebih dari 1GB HDD
- Minimal 1 core processor
- Minimal 512MB RAM
- 1 public IP Address (Tidak di dukung pada VPS NAT)

**External Firewall:**

Untuk penyedia VPS seperti AWS, AZURE, NEO Cloud, penyedia tersebut sudah menyertakan firewall eksternal untuk VPS Anda. Silakan buka port 22, 80, 443, dan 34210 untuk melakukan instalasi RunCloud.

Sebelum melakukan instalasi silakan melakukan registrasi akun RunCloud terlebih dahulu pada link berikut: **[Daftar RunCloud](https://manage.runcloud.io/auth/register)**.

Perlu diketahui untuk instalasi RunCloud disini kami menggunakan VPS dari cloud provider **[NEO Cloud](https://www.biznetgio.com/en/pricelist#neo-virtual-compute)** dari **[Biznet GIO Cloud](https://www.biznetgio.com/en/)** dengan spesifikasi sebagai berikut: 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-install01.png)

Login ke akun RunCloud Anda, kemudian klik **Let's get started** 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-install1.png)

Pilih **Others**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-install2.png)

Pilih **Connect via IP Address**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-install3.png)

Isi **Server Name** sesuai keinginan Anda contoh `Production, Staging etc` dan isi **IP Address** dari server/instance/vps Anda

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-install04.png)

Pilih **Manual Installation**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-install5.png)

Selanjutnya silakan akses ssh ke server/instance/vps Anda dan lakukan update sistem operasi Ubuntu 20.04 LTS

```bash
ubuntu@blinux-rundcloud:~$ sudo apt update -y
```

Copy paste atau jalankan script instalasi yang didapatkan diatas untuk proses instalasinya

```bash
ubuntu@test-rundcloud:~$ sudo -s
root@test-rundcloud:/home/ubuntu# export DEBIAN_FRONTEND=noninteractive; echo 'Acquire::ForceIPv4 "true";' | tee /etc/apt/apt.conf.d/99force-ipv4; apt-get update; apt-get install curl netcat-openbsd -y; curl -4 --silent --location https://manage.runcloud.io/scripts/installer/9qeRuzKRr0ASY5MGnxvGIKlJanPuUhTV12I9qf8RYWVDzkf6a1PUkRW03JMBxoQ5vm2W8ls0N/PmZPDLXO7P8QipihsF0TZg4K6GgJY4ybcGUNcSfA2r45TaFBoOojOtBgB9Y9pAOXBksQsaMDclG2HqXJh40roxUegTqSk8gSuCl8uEKnJp8njfvhSVcJ1gQ2E1 | bash -; export DEBIAN_FRONTEND=newt
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-install6.jpg)

Tunggu proses instalasi sampai selesai yang membutuhkan waktu kurang lebih 15 menit

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-install7.png)

Apabila sudah selesai akan nampak seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/run-install8.png)

Sampai disini Anda sudah berhasil melakukan instalasi **RunCloud** di Ubuntu 20.04 LTS. 

Selamat mencoba 😁