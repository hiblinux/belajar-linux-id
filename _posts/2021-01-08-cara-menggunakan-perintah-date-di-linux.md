---
title: Cara Menggunakan Perintah date di Linux
description: 'Perintah date digunakan untuk menampilkan tanggal dan waktu, perintah *date* juga digunakan untuk mengatur tanggal dan waktu sistem'
lang: id_ID
date: 2021-01-08 15:37 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/date.png'
categories:
 - linux
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini akan membahas tentang perintah *date*. Perintah *date* digunakan untuk menampilkan tanggal dan waktu, perintah *date* juga digunakan untuk mengatur tanggal dan waktu sistem. 

Secara default, perintah *date* menampilkan tanggal dalam zona waktu sistem operasi Unix/Linux dikonfigurasi. 

Jika Anda ingin mengubah tanggal dan waktu pada sistem operasi Unix/Linux menggunakan perintah *date* pastikan Anda sudah menjadi *super-user* atau *root*. 

## Sintak

Berikut sintak yang digunakan untuk menggunakan perintah *date*:

```bash
date [OPTION]... [+FORMAT]
date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]
```

## Opsi

Berikut beberapa opsi beserta contoh dalam penggunaan perintah *date*:

**date (no option):** Tanpa opsi, perintah *date* menampilkan tanggal dan waktu saat ini, termasuk nama hari yang disingkat, nama bulan yang disingkat, hari dalam sebulan, waktu yang dipisahkan dengan titik dua, nama zona waktu, dan tahun.

```bash
hamimaja@blinux:~$ date
Fri Jan  8 14:53:56 +07 2021
hamimaja@blinux:~$
```

**-u Option:** Menampilkan waktu dalam zona waktu GMT (Greenwich Mean Time) / UTC (Coordinated Universal Time).

```bash
hamimaja@blinux:~$ date -u
Fri Jan  8 07:55:52 UTC 2021
hamimaja@blinux:~$
```

**--date or -d Option:** Menampilkan string tanggal yang diberikan dalam format tanggal. Tetapi ini tidak akan memengaruhi tanggal dan waktu aktual sistem. Sebaliknya, sistem menggunakan tanggal dan waktu yang diberikan dalam bentuk string.

```bash
hamimaja@blinux:~$ date
Fri Jan  8 14:57:23 +07 2021
hamimaja@blinux:~$
hamimaja@blinux:~$ date --date="2/02/2021"
Tue Feb  2 00:00:00 +07 2021
hamimaja@blinux:~$ date --date="Feb 2 2021"
Tue Feb  2 00:00:00 +07 2021
hamimaja@blinux:~$
```

Menggunakan opsi **--date** untuk menampilkan tanggal yang sudah lewat: 

- Tanggal dan waktu 2 tahun yang lalu.

```bash
hamimaja@blinux:~$ date
Fri Jan  8 15:00:12 +07 2021
hamimaja@blinux:~$
hamimaja@blinux:~$ date --date="2 year ago"
Tue Jan  8 15:00:13 +07 2019
hamimaja@blinux:~$
```

- Tanggal dan waktu 5 detik yang lalu.

```bash
hamimaja@blinux:~$ date --date="5 sec ago"
Fri Jan  8 15:01:20 +07 2021
hamimaja@blinux:~$
```

- Tanggal dan waktu hari sebelumnya.

```bash
hamimaja@blinux:~$ date --date="yesterday"
Thu Jan  7 15:01:52 +07 2021
hamimaja@blinux:~$
```

- Tanggal dan waktu 2 bulan yang lalu.

```bash
hamimaja@blinux:~$ date --date="2 month ago"
Sun Nov  8 15:02:25 +07 2020
hamimaja@blinux:~$
```

- Tanggal dan waktu 10 hari yang lalu.

```bash
hamimaja@blinux:~$ date --date="10 day ago"
Tue Dec 29 15:02:58 +07 2020
hamimaja@blinux:~$
```

Menggunakan opsi **--date** untuk menampilkan tanggal yang akan datang:

- Tanggal dan waktu hari kerja tertentu yang akan datang.

```bash
hamimaja@blinux:~$ date --date="next tue"
Tue Jan 12 00:00:00 +07 2021
hamimaja@blinux:~$
```

- Tanggal dan waktu setelah dua hari.

```bash
hamimaja@blinux:~$ date --date="2 day"
Sun Jan 10 15:05:46 +07 2021
hamimaja@blinux:~$
```

- Tanggal dan waktu hari berikutnya.

```bash
hamimaja@blinux:~$ date --date="tomorrow"
Sat Jan  9 15:06:18 +07 2021
hamimaja@blinux:~$
```

- Tanggal dan waktu setelah 1 tahun pada hari ini.

```bash
hamimaja@blinux:~$ date --date="1 year"
Sat Jan  8 15:06:57 +07 2022
hamimaja@blinux:~$
```

**-s or –set**: Opsi ini digunakan untuk mengatur ulang tanggal dan waktu sistem.

#### Sintak:

```bash
$date --set="date to be set"
```

Contoh: 

```bash
root@blinux:~# date
Fri Jan  8 08:12:18 UTC 2021
root@blinux:~#
root@blinux:~# date --set="Tue Nov 13 15:23:34 UTC 2021"
Sat Nov 13 15:23:34 UTC 2021
root@blinux:~#
```

**–file or -f**: Opsi ini digunakan untuk menampilkan string tanggal yang ada di setiap baris file dalam format tanggal dan waktu. Opsi ini mirip dengan opsi **--date** tetapi satu-satunya perbedaan adalah bahwa dalam **--date** kita hanya dapat memberikan satu string tanggal tetapi dalam a file kami dapat memberikan beberapa string tanggal di setiap baris.

#### Sintak

```bash
$date --file=file.txt
```

Contoh:

```bash
hamimaja@blinux:~$ cat >> datefile
 Sep 23 2021
 Nov 03 2021
hamimaja@blinux:~$ ls |grep date
datefile
hamimaja@blinux:~$
hamimaja@blinux:~$ date --file=datefile
Thu Sep 23 00:00:00 +07 2021
Wed Nov  3 00:00:00 +07 2021
hamimaja@blinux:~$
```

**-r**: Opsi ini digunakan untuk menampilkan timestamp waktu terakhir yang dimodifikasi dari sebuah file *datefile*.

#### Sintak

```bash
$date -r file.txt
```

Kita dapat mengubah timestamp waktu dari *datefile* dengan menggunakan perintah *touch*.

```bash
hamimaja@blinux:~$ date
Fri Jan  8 15:30:42 +07 2021
hamimaja@blinux:~$
hamimaja@blinux:~$ touch datefile
hamimaja@blinux:~$ date
Fri Jan  8 15:30:52 +07 2021
hamimaja@blinux:~$
```

Berikut list format yang digunakan dengan perintah *date*:

```bash
%D: Display date as mm/dd/yy.       
%d: Display the day of the month (01 to 31).       
%a: Displays the abbreviated name for weekdays (Sun to Sat).
%A: Displays full weekdays (Sunday to Saturday).
%h: Displays abbreviated month name (Jan to Dec).
%b: Displays abbreviated month name (Jan to Dec).
%B: Displays full month name(January to December).
%m: Displays the month of year (01 to 12).
%y: Displays last two digits of the year(00 to 99).
%Y: Display four-digit year. 
%T: Display the time in 24 hour format as HH:MM:SS.
%H: Display the hour.
%M: Display the minute.
%S: Display the seconds.
```

#### Sintak:

```bash
$date +%[format-option]
```

Contoh: 

```javascript
hamimaja@blinux:~$ date "+%D"
01/08/21
hamimaja@blinux:~$ date "+%D %T"
01/08/21 15:33:23
hamimaja@blinux:~$ date "+%Y-%m-%d"
2021-01-08
hamimaja@blinux:~$ date "+%Y/%m/%d"
2021/01/08
hamimaja@blinux:~$ date "+%A %B %d %T %y"
Friday January 08 15:33:39 21
hamimaja@blinux:~$
```

Itulah beberapa contoh penggunaan perintah *date* di Linux, cukup mudah bukan 😊

Selamat mencoba 😁