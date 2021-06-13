---
title: Cara Install dan Patch Suckless Terminal di GNU/Linux
description: st adalah simple terminal buatan suckless terminal
lang: id_ID
date: 2021-06-13 21:01 +0700
layout: post
featured: true
author: Radhitya
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-06-13_21-36-19.jpg'
categories:
- suckless
- st
- linux
---

[Belajar Linux ID](https://belajarlinux.id) - ST atau yang biasa disebut Suckless Terminal, adalah terminal buatan komunitas Suckless. Terminal ini berbeda dari yang lain dikarenakan minimalisnya.

Suckless Terminal sangat ringan, tidak terlalu memakan sumber daya. Jika anda suka berkreasi, maka cocok untuk anda karena terminal ini mudah dikustomisasi.

Motivasi mereka membuat ini karena xterm bloat dan tidak dimaintenance. Juga terminal emulator tidak perlu rumit dengan panjangnya baris kode.

Suckless Terminal tidak seperti lainnya yang menyediakan banyak fitur. Untuk menambahkan fiturnya, anda harus melakukan patch sesuai keinginan.

## Cara Install Suckless Terminal di GNU/Linux
Rata - rata distro GNU/Linux menyediakan suckless terminal di repository. Kelemahannya belum bisa edit sumber kode dan patch. Misal download suckless terminal di Debian GNU/Linux dari repository.
```bash
sudo apt install stterm
```
Lebih disarankan install suckless terminal lewat website suckless.org dengan cara wget.
```
wget https://dl.suckless.org/st/st-0.8.4.tar.gz
tar xf st-0.8.4.tar.gz
cd st-0.8.4
sudo make install
```

## Cara Patch Suckless Terminal di GNU/Linux
Karena Suckless Terminal sangat minimalis, sudah pasti ada yang harus dibayar, salah satunya fitur. Untuk mengatasinya diharuskan melakukan patch. 

Bagian menarik dari Suckless Terminal adalah menyunting sumber kode dan compile ulang.

Untuk menambahkan patch, bisa melakukan ini.
```
cd st-0.8.4
patch -p1 < /path/to/patch
sudo make install
```
Jika kita melakukan kesalahan dan ingin menghapus patch, dapat diatasi dengan ini.
```
cd st-0.8.4
patch -R < /path/to/patch
```
