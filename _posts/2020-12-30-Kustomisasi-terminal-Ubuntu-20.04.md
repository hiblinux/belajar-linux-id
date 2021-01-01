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

Pada kesempatan kali ini, saya akan mencoba share cara kustomisasi model terminal/konsol. Tujuan kustomisasi ini untuk memperindah tampilan terminal agar pengguna tidak bosan dan tertarik melakukan setup maupun konfigurasi. 

Disini saya menggunakan Oh-My-Zsh, karena lebih fleksibel dan menarik. 

1. Langkah yang pertama, update paket terlebih dahulu dengan perintah: 
```
sudo apt-get update  
sudo apt upgrade
```

{:start="2"}
2. Langkah yang kedua, install paket yang dibutuhkan (ZSH, powerline, dan font powerline)
```
sudo apt install zsh  
sudo apt-get install powerline fonts-powerline
```

{:start="3"}
3. Clone repo Oh-My-Zsh
```
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
```

{:start="4"}
4. Buat file konfigurasi ZSH baru 
```
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```

{:start="5"}
5. Setup tema untuk terminal, Anda bisa menemukan dan memilih tema Oh-My-Zsh yang diinginkan. Bisa melihat referensi [berikut](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)

Disini saya menggunakan tema robbyrussell, set pada baris "ZSH_THEME" pada file ".zshrc" seperti berikut:

```
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
```

{:start="6"}
6. Karena default shell yang digunakan adalah "bash", maka Anda bisa mengubahnya ke "zsh". 

```
chsh -s /bin/zsh
```

Agar bisa berjalan efektif dan efisien, Anda bisa melakukan resart sistem operasi. 
Setelah itu, buka kembali terminalnya dan akan muncul tampilan seperti berikut. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Terminal%20Oh-My-Zsh/1.%20Look-and-feel.png)

Apabila Anda ingin teks terminal terlihat highlight bisa mengilkuti cara berikut (opsional): 

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
```

Tambahkan syntax-highlighting pada file konfigurasi .zshrc: 
```
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"
```

Apabila ada yang terlihat error, Anda bisa mengembalikan default shell ke "bash" seperti semula: 
```
chsh -s /bin/bash
```

Apabila Anda seorang scientis bisa menggunakan anaconda pada konfigurasi file .zshrc, tambahkan pada baris paling bawah: 

```
# >>> conda initialize >>>  
# !! Contents within this block are managed by ‘conda init’ !!  
__conda_setup=”$(‘/home/yourusername/anaconda3/bin/conda’ ‘shell.bash’ ‘hook’ 2> /dev/null)”  
if [ $? -eq 0 ]; then  
 eval “$__conda_setup”  
else  
 if [ -f “/home/yourusername/anaconda3/etc/profile.d/conda.sh” ]; then  
 . “/home/yourusername/anaconda3/etc/profile.d/conda.sh”  
 else  
 export PATH=”/home/yourusername/anaconda3/bin:$PATH”  
 fi  
fi  
unset __conda_setup  
# <<< conda initialize <<<
```

**Keterangan**: 

Ganti "yourusername" dengan nama user setelah direktori /home, nantinya akan tampak seperti berikut. 

![](http://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Terminal%20Oh-My-Zsh/2.%20Anaconda.png)

{:start="7"}
7. Langkah yang terakhir, silakan update bash shell dengan menjalankan perintah: 

```
source ./zshrc
```

Itulah beberapa langkah untuk kustomisasi terminal, selanjutnya Anda bisa melakukan kustomisasi secara lebih jauh dengan Oh-My-Zsh. 

Sekian dan terima kasih. 

Semoga bermanfaat dan barokah. 

Apabila terdapat kritik dan saran, silakan komentar dibawah ini ya :) 


**Referensi**: 
https://github.com/ohmyzsh/ohmyzsh
