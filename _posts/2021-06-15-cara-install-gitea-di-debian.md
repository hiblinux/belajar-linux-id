---
title: Cara Install Gitea di Debian GNU/Linux
description: Sudah waktunya self-hosting git bersama Gitea
lang: id_ID
date: 2021-06-15 08:15 +0700
layout: post
featured: true
author: Radhitya
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/cover-gitea.png
categories:
- gitea
- internet independen
---

[Belajar Linux ID](https://belajarlinux.id) - Apakah anda tertarik membuat layanan git sendiri? Jika iya, gitea bisa merealisasikan keinginan anda. Mari kita bicara tentang Gitea, salah satu layanan git self host.

## Apa itu Gitea?
Ada banyak git service di dunia, seperti github, gitlab, bitbucket, gitea, dan lain - lain. Apa itu Gitea? Gitea adalah layanan git yang bisa dihosting di server pribadi. Artinya kamu dapat membangun *github*-milikmu sendiri.

Gitea mudah untuk diinstall, bisa lewat binary, docker, atau package. Kabar baiknya, gitea adalah closs platform yang artinya dapat dijalankan di Windows, macOS, Linux, ARM, dan lainnya. Selain itu, layanan git ini sangat ringan dan dapat berjalan di Raspberry Pi.

## Tutorial Install Gitea di Debian GNU/Linux
Seperti yang dikatakan sebelumnya, sangat mudah melakukan instalasi Gitea. Mari kita praktek di Debian GNU/Linux.

**Harap Diingat, proses install gitea dilakukan sebagai root (sudo, doas, atau su)**

Sebelum melakukan penginstallan, pastikan sudah menginstall git.
```
apt install git
```
Buat git user dengan langkah berikut.
```
adduser \
   --system \
   --shell /bin/bash \
   --gecos 'Git Version Control' \
   --group \
   --disabled-password \
   --home /home/git \
   git
```
Download Gitea binary menggunakan wget biar mudah.
```bash
wget -O /tmp/gitea https://dl.gitea.io/gitea/1.14.1/gitea-1.14.1-linux-amd64
```
Pindah gitea binary ke /usr/local/bin
```bash
mv /tmp/gitea /usr/local/bin
```
Buat binary agar dapat dijalankan
```bash
chmod +x /usr/local/bin/gitea
```
Kita akan membuat direktori baru dan merubah ijin dan pemilik.
```bash
mkdir -p /var/lib/gitea/{custom,data,log}
chown -R git:git /var/lib/gitea/
chmod -R 750 /var/lib/gitea/
mkdir /etc/gitea
chown root:git /etc/gitea
chmod 770 /etc/gitea
```
Membuat systemd service gitea dengan langkah berikut
```bash
wget https://raw.githubusercontent.com/go-gitea/gitea/main/contrib/systemd/gitea.service -P /etc/systemd/system/
```
Jalankan service gitea
```bash
systemctl daemon-reload
systemctl enable --now gitea
```
Pastikan gitea sudah berjalan. Tanda berjalan terdapat kata **Active**
```bash
systemctl status gitea
```
Gitea berjalan di port 3000, aktifkan port 3000 dengan cara berikut.
```bash
ufw allow 3000/tcp
```
Setelah mengaktifkan, buka **http://domain_atau_ip_kamu:3000**. Beginilah tampilan instalasi gitea.

Anda bisa mengikuti konfigurasi seperti di bawah. Harap diingat, pastikan sudah membuat database untuk gitea.
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/2021-06-14_19-29.png)

Jika sudah selesai, selamat anda sudah berhasil membuat layanan git di server sendiri. Seperti ini tampilan gitea.
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-06-15_08-15-08.jpg)
