---
title: Kustomisasi Terminal Ubuntu 20.04 LTS dengan Oh-My-Zsh
description: Pada kesempatan kali ini, saya akan mencoba share cara kustomisasi model terminal/konsol. Tujuan kustomisasi ini untuk memperindah tampilan terminal agar pengguna tidak bosan dan tertarik melakukan setup maupun konfigurasi. 
lang: id_ID
date: 2020-12-30 04:42 +0700
layout: post
featured: true
author: Imron
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Terminal%20Oh-My-Zsh/cover-art.png
categories:
  - aplikasi
  - terminal
  - linux
  - ubuntu
---

Pada kesempatan kali ini, saya akan mencoba share cara kustomisasi model WSL. Tujuan kustomisasi ini untuk memperindah tampilan terminal agar pengguna tidak bosan dan tertarik melakukan setup maupun konfigurasi.

## Prasyarat
1. Install Windows Subsystem for Linux (WSL) v2.
2. Menggunakan pilihan distribusi Ubuntu 20.04 LTS

Adapun jika belum memiliki WSL v2, bisa menginstallnya terlebih dahulu dengan mengikuti tautan [berikut](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

Disini saya menggunakan  Oh-My-Zsh, Oh-My-Zsh merupakan suatu framework yang berbasis opensource digunakan untuk mengelola konfigurasi Zsh. Selain itu Oh-My-Zsh memiliki dukungan 275+ plugin dan 150 tema sehingga dapat memudahkan user dalam menggunakan terminal dan terlihat menarik. 

## Instalasi dan Konfigurasi 

1. Langkah yang pertama, update paket terlebih dahulu dengan perintah: 

```
sudo apt update  
sudo apt upgrade
```

{:start="2"}
2. Install font Powerline pada Windows, buka WSL dan jalankan perintah berikut: 

```
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
```

{:start="3"}
3. Install Zsh, curl dan git

```
sudo apt-get install zsh curl git
```

{:start="4"}
4. Install Oh-My-Zsh 
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

{:start="5"}
5. Ubah tema ke [agnoster](https://github.com/agnoster/agnoster-zsh-theme)
Secara default tema Oh-My-Zsh yang digunakan adalah **robbyrussell**, oleh karena itu Anda bisa ubah ke tema agnoster untuk memperindah tampilan WSL. 

```
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
```

{:start="6"}
6. Ubah warna prompt direktori 
Anda juga bisa mengubah warna prompt direktori menjadi lebih cerah (biru), karena secara default warnanya lebih gelap. 

```
sed -i '0,/blue/{s/blue/39d/}' ~/.oh-my-zsh/themes/agnoster.zsh-theme
```

{:start="7"}
7. Mengaktifkan teks autokoreksi

```
sed -i 's/# ENABLE_CORRECTION="true"/ENABLE_CORRECTION="true"/g' ~/.zshrc
```

{:start="8"}
8. Mengaktifkan plugin autosuggestion (opsional)
Clone plugin autosuggestion terlebih dahulu:

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Lalu, edit file `.zshrc` menggunakan teks editor favorit Anda semisal: 

```
vim ~/.zshrc
```

Temukan baris plugins seperti berikut:

```
plugins=(
    git
)
```

Lalu, tambahkan `zsh-autosuggestions` pada bagian `plugins`: 

```
plugins=(
    git
    zsh-autosuggestions
)
``` 

Kemudian, tambahkan baris konfigurasi berikut dibawah bagian `plugins` untuk menghindari adanya error “Insecure completion-dependent directories detected”: 

```
ZSH_DISABLE_COMPFIX=true
```

Simpan file tersebut dan keluar dari teks editor. 

{:start="9"}
9. Mengaktifkan sintaks hightlighting (opsional)
 Clone repo gitnya terlebih dahulu: 

 ```
 git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
 ```

Lalu tambahkan `zsh-syntax-highlighting` pada bagian plugin. 

```
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
```

{:start="10"}
10. Tidak menampilkan nama host pada komputer lokal (opsional)
Biasanya hal ini dilakukan agar pengguna lain tidak mengetahui nama host secara detail. 
Edit file `.zshrc`: 

```
vim ~/.zshrc
```

Tambahkan baris berikut pada bagian file `.zshrc` paling bawah: 
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Terminal%20Oh-My-Zsh/7.%20script2.png)

{:start="11"}
11. Menempatkan kursor (opsional)
Apabila kursor ingin ditempatkan pada bagian bawah prompt bisa menggunakan baris berikut, tambahkan pada baris paling bawah: 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Terminal%20Oh-My-Zsh/7.%20script2.png)

Nah, sampai disini ternyata terdapat karakter aneh yang muncul pada prompt. Hal ini bisa diperbaiki dengan mengganti font WSL menjadi **"DejaVu Sans Mono for Powerline"**. Untuk menggantinya, bisa klik kanan tab dan pilih Properties. Pilih font "DejaVu Sans Mono for Powerline". 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Terminal%20Oh-My-Zsh/3.%20Change%20font1.png) 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Terminal%20Oh-My-Zsh/3.%20Change%20font1b.png)


Lalu restart `zshrc` dengan menjalankan perintah:

```
source ~/.zshrc
```

Apabila berhasil akan tampil seperti berikut ini. 
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Terminal%20Oh-My-Zsh/5.%20Save.png)

## Kesimpulan

Itulah beberapa langkah untuk kustomisasi terminal, selanjutnya Anda bisa melakukan kustomisasi secara lebih jauh dengan Oh-My-Zsh dengan menggunakan [plugin/tema](https://github.com/ohmyzsh/ohmyzsh) yang disediakan. 

Referensi: [Oh-My-Zsh](https://pascalnaber.wordpress.com/2019/10/05/have-a-great-looking-terminal-and-a-more-effective-shell-with-oh-my-zsh-on-wsl-2-using-windows/)

Apabila terdapat kritik. saran, atau masukan silakan komentar dibawah ini ya :) 

Sekian dan terima kasih. 

Semoga bermanfaat dan barokah. 