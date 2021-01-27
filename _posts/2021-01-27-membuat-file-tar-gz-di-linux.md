---
title: Membuat File tar.gz di Linux
description: 'Jika Anda mempunyai banyak file dapat disatukan menjadi 1 file dalam bentuk `tar`  Anda juga menggabungkan file tersebut dengan kompresi gunzip (`gz`) atau di kompress'
lang: id_ID
date: 2021-01-27 13:04 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/tar-gz.png
categories:
 - linux
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini kita akan membahas bagaimana cara membuat file *tar gz* di Linux. Jika sebelumnya kita sudah membahas bagaimana menggunakan perintah *tar* pada link berikut: **[Cara Menggunakan Perintah tar di Linux](https://belajarlinux.id/cara-menggunakan-perintah-tar-di-linux/)**. 

Jika Anda mempunyai banyak file dapat disatukan menjadi 1 file dalam bentuk `tar`  Anda juga menggabungkan file tersebut dengan kompresi gunzip (`gz`) atau di kompress. 

Cukup banyak manfaat yang didapatkan dalam pembuatan file tar.gz mulai dari banyak-nya file besar di kompress sampai size nya kecil dan `tar.gz` bisa kita gunakan jika terdapat migrasian data dari server A ke server B misalnya. 

Berikut contoh penggunaan atau cara membuat file `tar.gz` di Linux:

```bash
ubuntu@my-jumper:~/blinux$ ls
folder1  folder2  folder3  folder-utama
ubuntu@my-jumper:~/blinux$
ubuntu@my-jumper:~/blinux$ pwd
/home/ubuntu/blinux
ubuntu@my-jumper:~/blinux$
```

Terlihat didalam direktori `/home/ubuntu/blinux` terdapat beberapa file jika Anda ingin membuat file `tar gz` pada salah satu file yang ada diatas misalnya direktori `folder-utama` ingin dijadikan satu dan dikompress menjadi `tar.gz` Anda hanya perlu menjalankan perintah berikut: 

```bash
ubuntu@my-jumper:~/blinux$ sudo tar -czvf my_file.tar.gz /home/ubuntu/blinux/folder-utama/
/home/ubuntu/blinux/folder-utama/
/home/ubuntu/blinux/folder-utama/folder1/
/home/ubuntu/blinux/folder-utama/folder1/hello.txt
ubuntu@my-jumper:~/blinux$
ubuntu@my-jumper:~/blinux$ ls
folder1  folder2  folder3  folder-utama  my_file.tar.gz
ubuntu@my-jumper:~/blinux$
```

*Noted: Untuk penamaan file my_file.tar.gz sesuaikan dengan keinginan Anda.*

Jika Anda ingin menjadikan satu dan dikompres semua file yang ada di direktori `/home/ubuntu/blinux` perintahnya masih sama yang perlu diperhatikan penentuan direktorinya seperti berikut ini

```bash
ubuntu@my-jumper:~/blinux$ pwd
/home/ubuntu/blinux
ubuntu@my-jumper:~/blinux$
ubuntu@my-jumper:~/blinux$ ls
folder1  folder2  folder3  folder-utama  my_file.tar.gz
ubuntu@my-jumper:~/blinux$
ubuntu@my-jumper:~/blinux$ sudo tar -czvf all_file.tar.gz /home/ubuntu/blinux/
tar: Removing leading `/' from member names
/home/ubuntu/blinux/
/home/ubuntu/blinux/folder2/
/home/ubuntu/blinux/folder2/hello.txt
/home/ubuntu/blinux/folder1/
/home/ubuntu/blinux/folder1/hello.txt
/home/ubuntu/blinux/folder-utama/
/home/ubuntu/blinux/folder-utama/folder1/
/home/ubuntu/blinux/folder-utama/folder1/hello.txt
/home/ubuntu/blinux/folder3/
/home/ubuntu/blinux/folder3/hello.txt
/home/ubuntu/blinux/my_file.tar.gz
ubuntu@my-jumper:~/blinux$ ls
all_file.tar.gz  folder1  folder2  folder3  folder-utama  my_file.tar.gz
ubuntu@my-jumper:~/blinux$
```

Jika Anda ingin ekstrak kembali file `my_file.tar.gz` atau `all_file.tar.gz` dapat dilakukan menggunakan perintah berikut

```bash
ubuntu@my-jumper:~/blinux$
ubuntu@my-jumper:~/blinux$ tar -xvf all_file.tar.gz
ubuntu@my-jumper:~/blinux$
ubuntu@my-jumper:~/blinux$ tar -xvf my_file.tar.gz
```

*Noted: Sesuaikan direktori jika ingin ekstrak file pastikan tidak di ekstrak ke satu file yang sama dengan file yang di tar gan kompress*

Cukup mudah bukan membuat file `tar.gz` di Linux. 

Selamat mencoba 😁