---
title: Cara Menggunakan Perintah tar di Linux
description: 'Linux "tar" singkatan dari ***tape archive***, digunakan untuk membuat Archive dan mengekstrak file Archive'
lang: id_ID
date: 2021-01-12 13:33 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/tar.png'
categories:
 - linux
---

[Belajar Linux ID](https://belajarlinux.id)  - Tutorial kali ini akan dibahas bagaimana cara menggunakan perintah *tar* di Linux. Linux *"tar"* singkatan dari ***tape archive***, digunakan untuk membuat Archive dan mengekstrak file Archive. Perintah *tar* di Linux adalah salah satu perintah penting yang menyediakan fungsionalitas pengarsipan di Linux. 

## Sintak

Berikut sintak penggunaan perintah *tar*:

```bash
tar [options] [archive-file] [file or directory to be archived]
```

## Opsi

Berikut beberapa opsi yang dapat digunakan:

- **-c:** Membuat arsip
- **-x:** Ekstrak arsip
- **-f:** Membuat arsip dengan nama file yang diberikan
- **-t:** Menampilkan atau mencantumkan file dalam file yang diarsipkan
- **-u:** Mengarsipkan dan menambah file arsip yang ada
- **-v:** Menampilkan Informasi Verbose
- **-A:** Menggabungkan file arsip
- **-z:** Zip, memberi tahu perintah tar yang membuat file tar menggunakan *gzip*
- **-j:** Filter arsip file tar menggunakan *tbzip*
- **-W:** Memverifikasi file arsip
- **-r:** Perbarui atau tambahkan file atau direktori di file *.tar* yang sudah ada

### Membuat File Tar

Sebelum membuat file *tar* disini kami sudah menyiapkan direktori dan file yang ingin dijadikan *.tar*. Untuk membuat file *tar* dari satu direktori gunakan perintah berikut:

```bash
$ ls
folder1  folder2  folder3
$
$ sudo tar -cvf hasil.tar folder1
folder1/
folder1/hello.txt
$
```

Jika Anda ingin membuat file *tar* dari berbagai macam folder juga dapat dilakukan, gunakan perintah berikut:

```bash
$ sudo tar -cvf hasil1.tar folder1 folder2 folder3
folder1/
folder1/hello.txt
folder2/
folder2/hello.txt
folder3/
folder3/hello.txt
$
```

Atau jika Anda ingin buat file *tar* spesifik file yang ada didalam folder juga dapat dilakukan, gunakan perintah berikut

```bash
$ sudo tar -cvf backup.tar folder1/hello.txt
folder1/hello.txt
$ ls
backup.tar  folder1  folder2  folder3  hasil1.tar  hasil.tar
$ ll
total 56
drwxr-xr-x  5 root   root    4096 Jan 12 01:38 ./
drwxr-xr-x 16 ubuntu ubuntu  4096 Jan 12 01:23 ../
-rw-r--r--  1 root   root   10240 Jan 12 01:38 backup.tar
drwxr-xr-x  2 root   root    4096 Jan 12 01:23 folder1/
drwxr-xr-x  2 root   root    4096 Jan 12 01:24 folder2/
drwxr-xr-x  2 root   root    4096 Jan 12 01:24 folder3/
-rw-r--r--  1 root   root   10240 Jan 12 01:38 hasil1.tar
-rw-r--r--  1 root   root   10240 Jan 12 01:38 hasil.tar
$
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/tr1.png)

###  Melihat Isi File Tar

Jika kita sebelumnya sudah belajar membuat file *tar* lalu apakah bisa kita melihat isi file tar tersebut?.

Tentu saja **sabi**, Anda dapat menggunakan perintah berikut, dan sesuaikan dengan direktori file *tar* Anda

```bash
$ pwd
/home/ubuntu/blinux
$
$ ls |grep tar
backup.tar
hasil1.tar
hasil.tar
$
$ sudo tar -tvf /home/ubuntu/blinux/backup.tar
-rw-r--r-- root/root        59 2021-01-12 01:23 folder1/hello.txt
$
$ sudo tar -tvf /home/ubuntu/blinux/hasil1.tar
drwxr-xr-x root/root         0 2021-01-12 01:23 folder1/
-rw-r--r-- root/root        59 2021-01-12 01:23 folder1/hello.txt
drwxr-xr-x root/root         0 2021-01-12 01:24 folder2/
-rw-r--r-- root/root        59 2021-01-12 01:24 folder2/hello.txt
drwxr-xr-x root/root         0 2021-01-12 01:24 folder3/
-rw-r--r-- root/root        59 2021-01-12 01:24 folder3/hello.txt
$
$ sudo tar -tvf /home/ubuntu/blinux/hasil.tar
drwxr-xr-x root/root         0 2021-01-12 01:23 folder1/
-rw-r--r-- root/root        59 2021-01-12 01:23 folder1/hello.txt
$
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/tr2.png)

### Mengekstrak File Tar

Selanjutnya kita akan mencoba ekstrak file *tar*, untuk melakukannya sangat, berikut list dari file tar dan folder yang ada saat ini

```bash
$ ll
total 56
drwxr-xr-x  5 root   root    4096 Jan 12 02:08 ./
drwxr-xr-x 16 ubuntu ubuntu  4096 Jan 12 01:23 ../
-rw-r--r--  1 root   root   10240 Jan 12 01:38 backup.tar
drwxr-xr-x  2 root   root    4096 Jan 12 01:24 folder2/
drwxr-xr-x  2 root   root    4096 Jan 12 01:24 folder3/
drwxr-xr-x  2 root   root    4096 Jan 12 02:04 folder-utama/
-rw-r--r--  1 root   root   10240 Jan 12 01:38 hasil1.tar
-rw-r--r--  1 root   root   10240 Jan 12 01:38 hasil.tar
$
```

Selanjutnya kita coba ekstrak file *backup.tar* ke direktori yang sama

```bash
$ sudo tar -xvf backup.tar
folder1/hello.txt
$ ll
total 60
drwxr-xr-x  6 root   root    4096 Jan 12 02:10 ./
drwxr-xr-x 16 ubuntu ubuntu  4096 Jan 12 01:23 ../
-rw-r--r--  1 root   root   10240 Jan 12 01:38 backup.tar
drwxr-xr-x  2 root   root    4096 Jan 12 02:10 folder1/
drwxr-xr-x  2 root   root    4096 Jan 12 01:24 folder2/
drwxr-xr-x  2 root   root    4096 Jan 12 01:24 folder3/
drwxr-xr-x  2 root   root    4096 Jan 12 02:04 folder-utama/
-rw-r--r--  1 root   root   10240 Jan 12 01:38 hasil1.tar
-rw-r--r--  1 root   root   10240 Jan 12 01:38 hasil.tar
$
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/tr3.png)

Jika Anda ingin ekstraks file *bakcup.tar* ke direktori misal ke direktori *folder-utama* dapat dilakukan menggunakan perintah berikut:

```bash
$ ls
backup.tar  folder1  folder2  folder3  folder-utama  hasil1.tar  hasil.tar
$
$ sudo tar -xvf backup.tar -C /home/ubuntu/blinux/folder-utama/
folder1/hello.txt
$ ls folder-utama/
folder1
$ ll folder-utama/folder1/
total 12
drwxr-xr-x 2 root root 4096 Jan 12 02:16 ./
drwxr-xr-x 3 root root 4096 Jan 12 02:16 ../
-rw-r--r-- 1 root root   59 Jan 12 01:23 hello.txt
$
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/tr4.png)

Jika Anda ingin ekstrak hanya file-file tertentu saja yang ada di file *tar backup.tar* juga dapat dilakukan, gunakan perintah berikut:

```bash
$ sudo tar -xvf backup.tar hello.txt
```

Itulah beberapa contoh dalam penggunaan perintah *tar* di Linux. 

Selamat mencoba 😁
