---
title: Cara Konfigurasi Load Balancing Proxmox Mail Gateway Menggunakan HAProxy
description: 'Proxmox Mail Gateway merupakan solusi keamanan email sumber terbuka (open source) terkemuka yang dapat membantu Anda melindungi server email Anda dari semua ancaman email.'
lang: id_ID
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/pmg-lb-cover.png'
categories:
  - haproxy
  - proxmox-mail-gateway
---

[Belajar Linux ID](https://belajarlinux.id) - Proxmox Mail Gateway merupakan solusi keamanan email sumber terbuka (open source) terkemuka yang dapat membantu Anda melindungi server email Anda dari semua ancaman email. Proxmox mail gateway dapat digunakan sebagai relay, filtering, firewall email dan masih banyak lagi lainnya. 

Jika di tutorial sebelum-sebelumnya kita sudah membahas mengenai relay email dan cluster proxmox mail gateway, maka ditutorial kali ini kita akan bahas bagaimana menerapkan Load Balancing Proxmox Mail Gateway menggunakan HAProxy. 

Tujuan dari tutorial ini yaitu dimana setiap incoming dan outgoing email yang menggunakan proxmox mail gateway harus melewati proxmox mail gateway terlebih dahulu sebelum di sending/receive emailnya. 

Topologi yang digunakan kurang lebih seperti berikut: 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/Topologi-PMG-LB.png)

**Keterangan:** Dari topologi diatas terlihat apabila client atau user melakukan sending/receive atau incoming/outgoing email harus melewati haproxy/server load balancing terlebih dahulu, nantinya server haproxy akan menentukan server proxmox mail gateway mana yang akan handel request dari client/user tersebut, sebagai catatan server proxmox mail gateway disini sudah di setup cluster (data antara server proxmox mail gateway 1 dan 2 sama), selanjutnya server haproxy akan mengirimkan ke destination email atau email tujuan misalnya @gmail.com @yahoo.com dan sebaliknya. 

Untuk mengikuti tutorial kali ini pastikan Anda sudah setup beberapa kebutuhan berikut: 

1. Setup Cluster Proxmox Mail Gateway (minimal 2 server/instance/vps), berikut referensinya: 
   - [PMG: Konfigurasi Cluster Proxmox Mail Gateway](https://belajarlinux.id/konfigurasi-cluster-proxmox-mail-gateway/)

2. Setup SMTP HAProxy, berikut referensinya:
   - [Cara Install HAProxy di Linux](https://belajarlinux.id/cara-install-haproxy-di-linux/)
   - [Load Balancing SMTP Menggunakan HAProxy](https://belajarlinux.id/cara-konfigurasi-smtp-di-haproxy/)

Apabila kebutuhan diatas sudah dipenuhi selanajutnya Anda dapat melakukan konfigurasi disisi Proxmox Mail gateway node **Master**, silakan login ke proxmox mail gateway-nya terlebih dahulu

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/pmglb-1.png)

Selanjutnya masuk ke menu **Configuration >> Mail Proxy >> Relay Domain >> Add domain**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/pmglb-2.png)

Pindah ke menu **Transports** Input domain dan alamat IP Mail Server domain

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/pmglb-3.png)

Pindah ke menu **Networks** tambahkan network prefix dari IP Mail server domain

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/pmglb-4.png)

Sampai disini untuk konfigurasi disisi proxmox mail gateway sudah selesai. 

Selanjutnya, setup record MX dari domain yang Anda gunakan karena menggunakan Load Balancing dan incoming serta outgoing email melewati server LB pastikan domain menggunakan 2 MX sesuai di topologi detailnya: 

- PMG Master: pmg.nurhamim.my.id >> Priority 10
- PMG Node: pmg1.nurhamim.my.id >> Priority 20

Contohnya sebagai berikut:

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/pmglb-5.png)

Jika sudah silakan setup relay disisi mail server domain, jika Anda menggunakan Plesk Panel dapat merujuk pada link berikut: [PMG: Relay Email Plesk Panel Menggunakan Proxmox Mail Gateway](https://belajarlinux.id/relay-email-plesk-menggunakan-proxmox-mail-ga/)

Tahapan terakhir yaitu melakukan uji coba send/receive email, domain yang kami gunakan untuk uji coba kali ini yaitu task.my.id. Terdapat 2 uji coba yang akan dilakukan sebagai berikut:

1. Send/Receive dari pmg@task.my.id ke @gmail.com dan sebaliknya @gmail.com ke pmg@task.my.id
- Send email dari pmg@task.my.id ke @gmail.com

- Informasi Header email

- Send email dari @gmail.com ke pmg@task.my.id

- Informasi Header email

2. Send/Receive dari pmg@task.my.id ke @yahoo.com dan sebaliknya @yahoo.com ke pmg@task.my.id
- Send email dari pmg@task.my.id ke @yahoo.com

- Informasi Header email

- Send email dari @yahoo.com ke pmg@task.my.id

- Informasi Header email

Bagi kalian yang mengalami kendala atau kesulitan dalam menerapkan tutorial ini silakan komentar dibawah yah.

Selamat mencoba 😁