---
title: Cara Menggunakan Perintah cat di Linux
description: 'Perintah cat (concatenate) sangat sering digunakan di Linux. Biasanya digunakan untuk membaca data dari file, perintah ini membantu Anda untuk membuat, melihat, menggabungkan file'
lang: id_ID
date: 2021-01-08 16:50 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/cat-linux.png'
categories:
 - linux
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini akan dibahas mengenai perintah *cat* di Linux. Perintah *cat (concatenate)* sangat sering digunakan di Linux. Biasanya digunakan untuk membaca data dari file, perintah ini membantu Anda untuk membuat, melihat, menggabungkan file. Jadi mari kita lihat beberapa perintah *cat* yang sering digunakan.

1. Melihat satu file

```bash
hamimaja@blinux:~$ cat datefile
 Sep 23 2021
 Nov 03 2021
hamimaja@blinux:~$
```

2. Melihat multi atau banyak file

```bash
hamimaja@blinux:~$ cat datefile datefile01
 Sep 23 2021
 Nov 03 2021
 Sep 23 2021
 Nov 03 2021
hamimaja@blinux:~$
```

3. Melihat konten file sebelumnya dengan nomor baris.

```bash
hamimaja@blinux:~$ cat -n datefile datefile01
     1   Sep 23 2021
     2   Nov 03 2021
     3   Sep 23 2021
     4   Nov 03 2021
hamimaja@blinux:~$
```

4. Membuat file

```bash
hamimaja@blinux:~$ cat > newfile
Isi kontennya disini bebas sesuai kebutuhan
hamimaja@blinux:~$ cat newfile
Isi kontennya disini bebas sesuai kebutuhan
hamimaja@blinux:~$
```

5. Copy file

```bash
hamimaja@blinux:~$ cat newfile > newfile01
hamimaja@blinux:~$ ls |grep new
newfile
newfile01
hamimaja@blinux:~$
```

6. Perintah *cat* juga dapat digunakan untuk menyembuikan baris kosong pada file

```bash
hamimaja@blinux:~$ cat -s newfile02.txt
Isi kontennya disini bebas sesuai kebutuhan
hamimaja@blinux:~$
```

7. Perintah *cat* dapat menambahkan konten satu file ke akhir file lain

```bash
hamimaja@blinux:~$ cat newfile >> newfile01
hamimaja@blinux:~$ cat newfile01
Isi kontennya disini bebas sesuai kebutuhan
Isi kontennya disini bebas sesuai kebutuhan
hamimaja@blinux:~$
```

8. Perintah *cat* dapat menampilkan konten dalam urutan terbalik menggunakan perintah *tac*

```bash
hamimaja@blinux:~$ tac newfile01
Isi kontennya disini bebas sesuai kebutuhan
Isi kontennya disini bebas sesuai kebutuhan
hamimaja@blinux:~$
```

9. Perintah *cat* dapat menyoroti akhir baris.

```bash
hamimaja@blinux:~$ cat -E "newfile01"
Isi kontennya disini bebas sesuai kebutuhan$
Isi kontennya disini bebas sesuai kebutuhan$
hamimaja@blinux:~$
```

10. Jika Anda ingin menggunakan opsi **-v, -E** dan **-T** secara bersamaan, Anda cukup menggunakan opsi **-A** di baris perintah.

```bash
hamimaja@blinux:~$ cat -A "newfile01"
Isi kontennya disini bebas sesuai kebutuhan$
Isi kontennya disini bebas sesuai kebutuhan$
hamimaja@blinux:~$
```

11. Perintah *cat* untuk membuka file putus-putus.

```bash
hamimaja@blinux:~$ cat -- "-dashfile"
```

12. Perintah *cat* jika file memiliki banyak konten dan tidak dapat masuk ke terminal.

```bash
hamimaja@blinux:~$ cat "newfile01" | more
```

13. Perintah *cat* untuk menggabungkan konten dari beberapa file.

```bash
hamimaja@blinux:~$ cat "newfile" "newfile01" "newfile02.txt" > "file_gabungan"
hamimaja@blinux:~$ cat file_gabungan
Isi kontennya disini bebas sesuai kebutuhan
Isi kontennya disini bebas sesuai kebutuhan
Isi kontennya disini bebas sesuai kebutuhan
Isi kontennya disini bebas sesuai kebutuhan
hamimaja@blinux:~$
```

14. Perintah *cat* untuk menampilkan konten semua file teks di folder.

```bash
hamimaja@blinux:~$ sudo cat *.txt
```

Itulah beberapa perintah *cat* yang sering digunakan. 

Selamat mencoba 😁
