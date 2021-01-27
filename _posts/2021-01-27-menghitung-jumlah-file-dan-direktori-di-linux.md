---
title: Menghitung Jumlah File dan Direktori di Linux
description: 'Perintah dasar ini sangat membantu bagi Anda yang ingin dan perlu mengetahui berapa banyak file yang ada di dalam direktori dengan menggunakan perintah singkat padat ini Anda tidak perlu lagi menghitung secara manual berapa banyak file atau direktori yang ada di Linux'
lang: id_ID
date: 2021-01-27 15:58 +0700
layout: post
featured: true
author: nurhamim    
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/file-direktori.png
categories:
 - linux
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini kami akan memberikan tips dan cara bagaimana melihat jumlah file dan direktori yang ada di linux menggunakan command line.  Perintah dasar ini sangat membantu bagi Anda yang ingin dan perlu mengetahui berapa banyak file yang ada di dalam direktori dengan menggunakan perintah singkat padat ini Anda tidak perlu lagi menghitung secara manual berapa banyak file atau direktori yang ada di Linux. 

Untuk menghitung jumlah file dan direktori Anda dapat menggunakan beberapa perintah seperti `wc` dan `ls` contoh:

```bash
ubuntu@my-jumper:~/blinux$ pwd
/home/ubuntu/blinux
ubuntu@my-jumper:~/blinux$ ls -l
total 24
-rw-r--r-- 1 root root  682 Jan 27 05:53 all_file.tar.gz
drwxr-xr-x 2 root root 4096 Jan 12 02:10 folder1
drwxr-xr-x 2 root root 4096 Jan 12 01:24 folder2
drwxr-xr-x 2 root root 4096 Jan 12 01:24 folder3
drwxr-xr-x 3 root root 4096 Jan 12 02:25 folder-utama
-rw-r--r-- 1 root root  247 Jan 27 05:46 my_file.tar.gz
ubuntu@my-jumper:~/blinux$
```

Diatas Anda berada di direktori `/home/ubuntu/blinux` didalam direktori tersebut sudah ada direktori untuk melihat berapa banyak direktori yang ada gunakan perintah berikut

```bash
ubuntu@my-jumper:~/blinux$ ls . | wc -l
6
ubuntu@my-jumper:~/blinux$
```

Terlihat terdapat 6 direktori yang ada di path direktori tersebut. 

Jika Anda ingiin menghitung jumlah file yang menggunakan ekstensi **.txt** yang ada didalam direktori tersebut gunakan perintah `find`

```bash
ubuntu@my-jumper:~/blinux$ pwd
/home/ubuntu/blinux
ubuntu@my-jumper:~/blinux$
ubuntu@my-jumper:~/blinux$ ls -l
total 24
-rw-r--r-- 1 root root    0 Jan 27 08:37 1.txt
-rw-r--r-- 1 root root    0 Jan 27 08:37 2.txt
-rw-r--r-- 1 root root    0 Jan 27 08:37 3.txt
-rw-r--r-- 1 root root    0 Jan 27 08:37 4.txt
-rw-r--r-- 1 root root    0 Jan 27 08:37 5.txt
-rw-r--r-- 1 root root  682 Jan 27 05:53 all_file.tar.gz
drwxr-xr-x 2 root root 4096 Jan 12 02:10 folder1
drwxr-xr-x 2 root root 4096 Jan 12 01:24 folder2
drwxr-xr-x 2 root root 4096 Jan 12 01:24 folder3
drwxr-xr-x 3 root root 4096 Jan 12 02:25 folder-utama
-rw-r--r-- 1 root root  247 Jan 27 05:46 my_file.tar.gz
ubuntu@my-jumper:~/blinux$
ubuntu@my-jumper:~/blinux$ find . -maxdepth 1 -type f -iname '*.txt' | wc -l
5
ubuntu@my-jumper:~/blinux$
```

Atau Anda juga dapat mengkombinasikan perintah `ls` dan `wc` seperti berikut

```bash
ubuntu@my-jumper:~$ pwd
/home/ubuntu
ubuntu@my-jumper:~$
ubuntu@my-jumper:~$ ls -l /home/ubuntu/mediums/ | wc -l
20
ubuntu@my-jumper:~$
```

Penjelasan dari perintah diatas  adalah perintah `ls -l` termasuk file dan direktori yang ada di dalam lokasi (path) yang ditentukan, kemudian perintah `wc -l` menghitung jumlah file dan direktori yang ada di lokasi (path) yang telah ditentukan tersebut. 

Selamat mencoba 😁


