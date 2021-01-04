---
title: Install dan Penggunaan Tmux pada Sistem Operasi Linux
description: Tmux merupakan salah satu terminal multiplexer, dimana tmux bisa membuat multi terminal. Dalam artian bisa membuat banyak virtual terminal window dalam satu terminal window. Setiap window terminal sendiri bisa menggunakan satu screen atau menggabungkan panel. 
lang: id_ID
date: 2021-01-04 14:20 +0700
layout: post
featured: true
author: Imron
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Tmux/2.%20Cover
categories: 
 - Terminal
 - Linux
 - Multiplexer
---

Tmux merupakan terminal multiplexer, dimana tmux bisa membuat multi terminal. Dalam artian bisa membuat banyak virtual terminal window dalam satu terminal window. Setiap window terminal sendiri bisa menggunakan satu screen atau menggabungkan panel. 
Hal ini bisa membuat program yang berjalan pada tmux bisa tetap berjalan walaupun terdapat koneksi server yang gagal. 

## Instalasi 
A. Instalasi tmux pada Debian dan Ubuntu 
```
$ sudo apt install tmux
```
B. Instalasi tmux pada CentOs dan Fedora 
```
$ sudo yum install tmux
```
C. Instalasi tmux pada MacOs
```
$ brew install tmux
```

## Penggunaan
1. Membuat sesi baru tanpa nama sesi
Cara menggunakan tmux pertama kali dengan mengetikkan `tmux`. Perintah tersebut digunakan untuk membuat sesi baru tanpa nama sesi. Nantinya akan muncul window screen dengan warna address bar hijau beserta nama deskripsinya. 

Adapun cheat sheet untuk menggunakan tmux bisa menjalankan perintah `ctrl-b + ?`, lalu akan muncul list atribut yang sudah disediakan. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Tmux/1.%20Help.png)

{:start="2"}
2. Membuat sesi baru dengan nama sesi 
Membuat sesi baru diserta dengan nama untuk mempermudah user attach sesi. Untuk membuat sesi baru bisa menggunakan perintah: 

```
$ sudo tmux new -s nama_sesi
```

**Keterangan**: Ganti nama_sesi sesuai dengan nama yang Anda inginkan. 

{:start="3"}
3. Explore window dan panel tmux 
Adapun membuat window dan panel linux bisa menggunakan perintah yang sering digunakan sebagai berikut: 

```
    Ctrl-b + c : Membuat window baru
    Ctrl-b + w : Pilih daftar nama window
    Ctrl-b + 0 : Pindah ke window 0 (0 = nomor window)
    Ctrl-b + , : Ubah nama window yang sedang digunakan.
    Ctrl-b + % : Menggabungkan panel saat ini menjadi dua panel secara horizontal
    Ctrl-b + " : Menggabungkan panel saat ini menjadi dua panel secara vertikal
    Ctrl-b + o : Beralih ke panel selanjutnya
    Ctrl-b + ; : Beralih hanya ke panel sebelum dan sesudahnya
    Ctrl-b + x : Menutup panel yang sedang digunakan. 
```

{:start="4"}  
4. Detach dari sesi tmux 
Apabila Anda ingin melakukan detach sesi tmux bisa menggunakan tombol keyboard: 

```
Ctrl-b + d
```
Detach akan menutup sesi namun program masih tetap berjalan. 

{:start="5"}
5. Attach ulang sesi tmux 
Setelah melakukan detach, Anda bisa attach sesi tersebut kembali. Apabila sesi yang dibuat banyak, bisa dilist terlebih dahulu untuk menentukan sesi mana yang dipilih.

```
$ sudo tmux ls
```

**Output**:

```
3: 1 windows (created Mon Jan  4 13:44:14 2021)
blid: 1 windows (created Mon Jan  4 13:50:44 2021)
linux: 1 windows (created Mon Jan  4 13:50:56 2021)
```

**Keterangan**: 
Dari output diatas terdapat tiga sesi, dimana sesi yang pertama dengan nama `3`, sesi kedua dengan nama `blid`, dan sesi yang ketiga dengan nama `linux`. 

Semisal, saya ingin attach ke sesi dengan nama `linux` maka bisa menggunakan perintah sebagai berikut: 

```
tmux attach-session -t linux
```

## Kesimpulan 
Tmux merupakan terminal multiplexer, dimana satu terminal bisa memiliki virtual terminal yang banyak. Satu window terminal bisa membuat banyak panel sehingga memudahkan administrator dalam bekerja. 
Apabila Anda ingin explore lebih jauh lagi untuk mempelajari tmux bisa melihat halaman [berikut](https://man.openbsd.org/OpenBSD-current/man1/tmux.1). 

Jika terdapat pertanyaan atau kritik dan saran bisa komen saja dibawah ini. 

Sekian dan terima kasih. 

Semoga bermanfaat dan barokah, aamiin :)