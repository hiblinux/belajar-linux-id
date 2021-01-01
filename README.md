# Cara berkontribusi

1. Kontak mas Leon untuk akses ke repo ini.
2. Konfigurasi SSH Key pada repo ini, merujuk ke artikel [Konfigurasi SSH Key Pada Gitlab](https://ngulik-addict.cyou/post/Konfigurasi-SSH-Key-Pada-Gitlab.html)
3. Lalu clone repo menggunakan opsi SSH : https://gitlab.com/hiblinux/belajar-linux-id
4. Jalankan command `./inisiate.sh` 
5. Buka file `_config.yml` lalu tambahkan author sesuai dengan data dirimu.
6. Jika avatar menggunakan gravatar maka kamu perlu membuat akun pada wordpress.org terlebih dahulu.
7. Mulai berkontribusi ~

## Catatan Penting

[Belajar Linux](https://belajarlinux.id/) merupakan website statis menggunakan Jekyll, yang perlu diketahui adalah struktur direktori dari Jekyll, silakan untuk membaca terlebih dahulu halaman [berikut.](https://jekyllrb.com/docs/structure/)

## Path File

- `~/belajar-linux-id/_config.yml`: Secara default pengaturan dari Jekyll ada pada file `_config.yml`, disini tempat untuk melakukan konfigurasi dasar pada website.
- `~/belajar-linux-id/_posts/`: Disini tempat Anda meletakan file berformat `.md` yang nantinya akan menjadi konten pada website, kita memiliki struktur agar konten memiliiki keselarasan, berikut detailnya:
	- Nama File : yyyy-mm-dd-judul-post-mu.md
	- Header : 
```
---
title: Judul Mu
description: "Tulis deskripsi postingan"
lang: id_ID
date: yyyy-mm-dd HH:MM +0700
layout: post
featured: true
author: Nama-Mu
image: https://s3-kita-com/gambar.png
categories: [ Jekyll, tutorial ]
---
```

- `~/belajar-linux-id/_drafts/`: Disini adalah tempat Anda menaruh file postingan yang belum sepenuhnya jadi, apabila post telah jadi maka perlu dipindahkan ke folder `_posts/`
- `~/belajar-linux-id/tools`: Disini adalah tempat dimana tools pendukung telah Admin siapkan.

## Tool Pendukung

- **GitLab-CI**
Untuk mempermudah dalam pengembangan website saya sudah menyiapkan environment CI/CD yang menggunakan GitLab-CI, silakan untuk menghubungi Admin agar diberikan akses ke repository ini.
- **S3 Storage**
Untuk management file gambar kita menggunakan S3 Storage yang nantinya berfungsi sebagai CDN guna meringankan beban akses pada server host.
- **Bash Script**
Terdapat 4 tool yang telah saya buat menggunakan Bash, yang pertama adalah `push.sh`, `moving.sh`, `blidtools.sh` lalu `new-post.sh`. `Push.sh` digunakan untuk mempermudah dalam melakukan development menggunakan Git, pastikan sebelum mengeksekusi file ini perubahan sudah benar benar fix. Lalu untuk `new-post.sh` digunakan untuk mempermudah membuat file draft yang nantinya akan jadi sebuah konten pada website. Anda perlu **menyesuaikan** path directory pada kedua file tersebut agar dapat berjalan dengan baik.

## Cara Penggunaan

- `new-post` : Buat nama file draft yang akan dibuat dengan menggunakan command ini, contoh: How-To-Create-a-Post (gunakan '-' sebagai pemisah). Catatan : setelah draft selesai perlu dipindahkan ke folder `_posts`
- `push` : Apabila post atau perubahan telah selesai, silakan jalankan command ini beserta pesan commit, usahakan tiap pesan commit jelas sesuai dengan action yang dilakukan.
- `moving` : Digunakan untuk memindahkan file draft yang berada pada direktori `_drafts` ke folder `_posts`, perintah ini akan menyesuaikan tanggal pada nama file dan header agar sesuai dengan tanggal saat ini.

## Alur Penulisan

1. Jalankan command `new-post` lalu masukan judul file dengan menggunakan tanda `-` sebgai penghubung. Anda tidak perlu menambahkan ekstensi `.md` pada bagian ini.
2. Buka file yang sudah dibuat pada `/xx/xx/belajar-linux-id/_drafts/file-anda.md`
3. Sesuaikan header agar sesuai dengan tema konten Anda.
4. Apabila draft sudah selesai dibuat, jalankan perintah `moving` agar draft dapat dipindahkan secara otomatis ke folder `_posts`
5. Pastikan posting sudah berjalan dengan baik pada device lokal sebelum dilakukan push ke repository
7. Jalankan command `push` apabila telah selesai.
8. Masukan commit sesuai dengan perubahan yang dilakukan.
9. Saat terdapat action push, maka secara otomatis akan melakukan trigger ke CI/CD silakan ditunggu hingga proses selesai sebelum konten dapat terlihat di website.

## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

