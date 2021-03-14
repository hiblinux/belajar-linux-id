---
title: Integrasi Nextcloud Dengan S3 Protocol atau Object Storage
description: 'Tutorial kali ini kami akan melakukan integrasi layanan S3 Protokol atau layanan penyimpanan berbasis object seperti OpenStack Swift atau Amazon Simple Storage Service (S3), NEO Object Storage atau implementasi S3 yang kompatibel (misalnya Minio atau Ceph Object Gateway) sebagai penyimpanan utama yang menggantikan penyimpanan file default dari Nextcloud'
lang: id_ID
date: 2021-03-14 23:44 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/s3--nextinteg.png
categories:
 - nextcloud
 - ubuntu
 - s3
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini kami akan melakukan integrasi layanan S3 Protokol atau layanan penyimpanan berbasis object seperti *OpenStack Swift atau Amazon Simple Storage Service (S3), NEO Object Storage atau implementasi S3 yang kompatibel (misalnya Minio atau Ceph Object Gateway)* sebagai penyimpanan utama yang menggantikan penyimpanan file default dari Nextcloud. 

*Baca juga:*

- **[Install Nextcloud di Ubuntu 20.04 LTS](https://belajarlinux.id/install-nextcloud-di-ubuntu-20-04-lts/)**
- [**Konfigurasi Dasar Nextcloud di Ubuntu 20.04 LTS**](https://belajarlinux.id/konfigurasi-dasar-nextcloud-di-ubuntu-20-04-lts/)
- [**Integarasi Collabora Online dengan Nextcloud di Ubuntu 20.04 LTS**](https://belajarlinux.id/integrasi-collabora-online-dengan-nextcloud-di-ubuntu-20-04-lts/)

Secara default, file disimpan di `nextcloud/data` atau direktori lain yang dikonfigurasi di `config.php` dari instance Nextcloud Anda. Direktori data ini mungkin masih digunakan untuk alasan kompatibilitas. 

Di Indonesia terdapat 2 rekomendasi penyedia layanan S3 Protokol yang dapat Anda gunakan yaitu: 

1. ***[NEO Object Storage](https://www.biznetgio.com/product/neo-object-storage)***
2. ***[Kilat Storage](https://www.cloudkilat.com/layanan/kilat-storage)***

Saat menggunakan penyimpanan objek sebagai penyimpanan primary (utama), Nextcloud mengasumsikan akses eksklusif atas bucket yang digunakan.

Berlawanan dengan menggunakan penyimpanan objek sebagai penyimpanan eksternal, ketika penyimpanan objek digunakan sebagai penyimpanan primary (utama), tidak ada metadata *(nama, struktur direktori, dll)* yang disimpan di penyimpanan objek storage. Metadata hanya disimpan dalam *database* dan penyimpanan objek hanya menyimpan konten file dengan pengenal unik.

Karena penyimpanan objek primary (utama) ini biasanya bekerja lebih baik dari pada saat menggunakan penyimpanan objek yang sama sebagai penyimpanan eksternal tetapi membatasi kemampuan untuk mengakses file dari luar Nextcloud.

Sekilas dari keterangan diatas kami akan mencoba integrasikan S3 Protokol atau Object Storage ke Nextcloud sebagai primary (utama) dan eksternal. 

## Integrasi S3 Protokol Sebagai Primary Storage Nextcloud

Tahapan pertama yang harus Anda lakukan yaitu membuat bucket di Object Storage Anda masing-masing contoh seperti gambar dibawah ini kami sudah menyiapkan bucket yang akan digunakan sebagai storage primary (utama) dari Nextcloud

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/nex-bucket1.png)

Langkah selanjutnya, login ke server nextcloud untuk konfigurasi primary storage nextcloud, jika sudah silakan pindah ke direktori `config` nextcloud berikut:

```bash
ubuntu@lemp-belajarlinux:~$ cd /usr/share/nginx/nextcloud/config/
ubuntu@lemp-belajarlinux:/usr/share/nginx/nextcloud/config$
```

*Note: Seseuaikan dengan path root direktori nextcloud Anda masing-masing*

Sebelum melakukan perubahan ke konfigurasi default `config.php` nextcloud ada baiknya untuk backup terlebih dahulu menggunakan command `cp` 

```bash
ubuntu@lemp-belajarlinux:/usr/share/nginx/nextcloud/config$ sudo cp config.php config.php.bak
```

Jika sudah silakan buka file `config.php` dan tambahkan konfigurasi object storage berikut: 

```bash
'objectstore' =>
  array (
    'class' => '\\OC\\Files\\ObjectStore\\S3',
    'arguments' =>
    array (
      'bucket' => 'bucket-s3-nextcloud',
      'autocreate' => true,
      'key' => '00adxxxxxxc904d14cc',
      'secret' => 'YFB9gYxxxxxxxxxxxxxcYikHIqVS',
      'hostname' => 's3-id-jkt-1.url-s3-blinux.id',
      'port' => 443,
      'use_ssl' => true,
      'region' => 'id',
    ),
  ),
```

Keterangan: 

- **bucket:** Nama bucket yang sudah dibuat diatas
- **autocreate:** Otomatis create set sebagai `true` (iya) jika tidak set sebagai `false` (no)
- **key:** Isi key dari object storage Anda masing-masing
- **secret:** Isi secrete dari object storage Anda masing-masing
- **hostname:** Isi alamat atau URL atau endpoint dari object storage Anda masing-masing
- **port:** Isi port HTTP/HTTPS sesuaikan dengan kondisi object storage Anda masing-masing
- **use_ssl:** Set `true` jika sudah menggunakan SSL, jika tidak bisa di set `false`
- **region:** Isi region object storage Anda berada

Untuk mengetahui detail informasi diatas, Anda dapat menghubungi pihak penyedia S3 Protokol atau Object Storage Anda masing-masing. 

Berikut contoh konfigurasinya

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/nex-bucket2.png)

Jika sudah silakan simpan buka nextcloud administrator Anda hasilnya akan nampak seperti berikut

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/prim-next-01.png)

Selanjutnya, buka kembali bucket primary nextcloud Anda, maka akan nampak banyak file dengan penamaan unik seperti yang dijelaskan diatas

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/nex-bucket3.png)

Sampai disini integrasi S3 Protokol atau Object Storage sebagai primary storage nextcloud sudah selesai dilakukan. 

## Integrasi S3 Protokol Sebagai Eksternal Storage Nextcloud

Untuk integrasi S3 Protokol atau Object Storage sebagai eksternal storage di nextcloud berbeda caranya dengan primary diatas, Anda tidak perlu login ssh ke server nextcloud yang perlu Anda lakukan hanyalah login ke Nextcloud sebagai Administrator lalu masuk ke menu ***Apps*** seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/external-next-1.png)

Kemudian masuk ke menu ***Disabled Apps >> External storage support >> Enable*** 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/external-next-2.png)

Selanjutnya, masuk ke menu ***Settings***

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/external-next-3.png)

Masuk ke menu ***External storage >> Input informasi S3 Protokol atau Object Storage*** seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/external-next-4.png)

Lakukan verifikasi apabila sudah ceklist hijau seperti berikut menandakan S3 Protokol sudah siap digunakan sebagai eksternal storage nextcloud

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/external-next-5.png)

Jika di klik kembali menu *External Storages* maka Anda akan melihat list External storage mana saja yang terhubung ke nextcloud

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/external-next-6.png)

Kemudian pindah ke dashboard atau files maka Anda akan menemukan external storage dimana Anda dapat menyimpan aset gambar, video, music dan semua file static ke external storage Anda. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/external-next-7.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/external-next-8.png)

Sekarang membuat direktori di dalam storage eksternal contoh seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/external-next-9.png)

Setiap folder isi file contoh disini kami isi file gambar di *Folder 2 Belajar Linux*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/external-next-10.png)

Selanjutnya cek bucket S3 Protokol atau Object Storage Anda seharusnya akan nampak 4 Folder yang sudah dibuat diatas contoh hasilnya seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/external-next-12.png)

Sampai disini Anda sudah berhasil melakukan integrasi S3 Protokol atau Object Storage sebagai eksternal storage nextcloud. 

Apabila terdapat kendala dan pertanyaan dalam implementasi ini silakan ajukan detailnya di kolom komentar ya !.

Selamat mencoba 😁