# Cara berkontribusi

1. Buat akun GitLab pada halaman [GitLab](https://gitlab.com/users/sign_up)
2. Memiliki teks editor seperti VSCode, Sublime, atau Atom.
3. Install jekyll pada laptop dengan merujuk ke panduan [ini](https://jekyllrb.com/docs/installation/ubuntu/).
4. Kontak Author Belajar Linux ID untuk akses ke repo ini.
5. Konfigurasi SSH Key pada repo ini, merujuk ke artikel [Konfigurasi SSH Key Pada Gitlab](https://ngulik-addict.cyou/post/Konfigurasi-SSH-Key-Pada-Gitlab.html)
6. Lalu clone repo menggunakan opsi SSH : https://gitlab.com/hiblinux/belajar-linux-id
7. Jalankan command `./inisiate.sh` 
8. Buka file `_config.yml` lalu tambahkan author sesuai dengan data dirimu, contoh:

```
authors:
  leon: //Nantinya digunakan pada markdown header pada setiap posting.
    name: leonachild@gmail.com //Email Anda
    display_name: Leon Sastra //Nama yang akan ditampilkan pada postinganmu
    gravatar: dd84917a411ef717c000da8f846050df //Jika memiliki akun gravatar, bisa tempel ID disini.
    email: leonachild@gmail.com
    web: https://leonsastra.my.id
    twitter: https://www.instagram.com/yonzleon_aw/ //Sebagai hyperlink pada tombol follow
    description: "Seorang pemuda yang sangat tertarik untuk mempelajari dunia IT terutama bidang Cloud Computing Sys/Dev/Ops. Bio lengkap saya dapat dilihat pada https://leonsastra.my.id/" //Deskripsikan dirimu disini
```

9. Jika avatar menggunakan gravatar maka kamu perlu membuat akun pada wordpress.org terlebih dahulu.
10. Mulai berkontribusi ~

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
categories:
  - jekyll
  - contoh
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
- **Canva**
Segala sesuatu yang berbau desain seperti cover post dan lainnya, tersedia pada akun Canva Belajar Linux ID.

## Cara Penggunaan

- `new-post` : Buat nama file draft yang akan dibuat dengan menggunakan command ini, contoh: How-To-Create-a-Post (gunakan '-' sebagai pemisah). Catatan : setelah draft selesai perlu dipindahkan ke folder `_posts`
- `push` : Apabila post atau perubahan telah selesai, silakan jalankan command ini beserta pesan commit, usahakan tiap pesan commit jelas sesuai dengan action yang dilakukan.
- `moving` : Digunakan untuk memindahkan file draft yang berada pada direktori `_drafts` ke folder `_posts`, perintah ini akan menyesuaikan tanggal pada nama file dan header agar sesuai dengan tanggal saat ini.
- `S3 Storage` : Digunakan untuk melakukan upload gambar seperti cover posting, atau dokumentasi pada posting. Tool ini bisa diakses pada web [Uploader](https://belajarlinux.my.id/uploader/) . **Catatan:** Pastikan nama file yang akan diupload tidak mengandung spasi.

## Alur Penulisan

1. Jalankan command `new-post` lalu masukan judul file dengan menggunakan tanda `-` sebgai penghubung. Anda tidak perlu menambahkan ekstensi `.md` pada bagian ini.
2. Buka file yang sudah dibuat pada `/xx/xx/belajar-linux-id/_drafts/file-anda.md`
3. Sesuaikan header agar sesuai dengan tema konten Anda, dan buat cover post pada akun Canva Belajar Linux ID.
4. Apabila draft sudah selesai dibuat, jalankan perintah `moving` agar draft dapat dipindahkan secara otomatis ke folder `_posts`
5. Pastikan posting sudah berjalan dengan baik pada device lokal sebelum dilakukan push ke repository
7. Jalankan command `push` apabila telah selesai.
8. Masukan commit sesuai dengan perubahan yang dilakukan.
9. Saat terdapat action push, maka secara otomatis akan melakukan trigger ke CI/CD silakan ditunggu hingga proses selesai sebelum konten dapat terlihat di website.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/Workflow-BLID.png)

## Spesifikasi Server Belajar Linux ID

```
CPU : Intel(R) Xeon(R) CPU E5-2680 v3 @ 2.50GHz (2vCPU)
RAM : 4GB
Disk : 40GB SSD
Location : Indonesia
```

## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

