---
title: Cara Menggunakan Perintah W di Linux
description: 'Perintah w di Linux digunakan untuk menunjukkan siapa yang masuk dan apa yang mereka lakukan'
lang: id_ID
date: 2021-01-06 13:12 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/cover-w.png'
categories:
 - linux
---

[Belajar Linux ID](https://belajarlinux.id)  - Perintah w di Linux digunakan untuk menunjukkan siapa yang masuk dan apa yang mereka lakukan. Perintah ini menunjukkan informasi tentang pengguna saat ini di mesin/vm/vps/instance menunjukkan header,  dalam urutan ini, waktu saat ini, berapa lama sistem telah berjalan, berapa banyak pengguna yang saat ini masuk, dan rata-rata beban sistem selama 1, 5, dan 15 menit terakhir. Entri berikut ini ditampilkan untuk setiap pengguna: nama login, nama tty, remote host, waktu login, waktu idle, JCPU, PCPU, dan baris perintah dari proses saat ini. Waktu JCPU adalah waktu yang digunakan oleh semua proses yang dilampirkan ke tty. Waktu PCPU adalah waktu yang digunakan oleh proses saat ini, dinamai di bidang "what".

Berikut sintak penggunaan perintah "w'' di Linux: 

```bash
w [options] user [...]
```

Contoh: 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/w1.png)

Opsi: 

**w -h:**  Opsi ini tidak menampilkan header

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/w2.png)

**w -u:** Opsi ini akan mengabaikan nama pengguna saat mencari tahu proses saat ini dan waktu cpu.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/w3.png)

**w -s:** Opsi ini menggunakan format pendek dan tidak akan menampilkan waktu login, JCPU atau waktu PCPU.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/w4.png)

**w -f:** Opsi ini akan mengalihkan penambpilan from (remote hostname). 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/w5.png)

**w –help:** Opsi ini akan menampilkan pesan bantuan dan keluar.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/w6.png)

**w -i:** Opsi ini akan menampilkan alamat IP

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/w7.png)

**w -V:** Opsi ini akan menampilkan informasi versi.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/w8.png)

**w -o:** Opsi ini akan menampilkan ruang kosong untuk waktu idle kurang dari satu menit.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/w9.png)

**w user:** Opsi ini hanya akan menampilkan informasi tentang pengguna tertentu.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/w10.png)

Itulah beberapa perintah **w** yang dapat Anda gunakan tentunya untuk mengetahui detail informasi user dan sebagainya. 

Jika terdapat pertanyaan atau ada hal lain yang ingin didiskusikan seputar command line di Linux silakan komentar dibawah yah 😁

Selamat mencoba  😁