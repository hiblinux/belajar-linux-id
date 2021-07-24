---
title: Cara Install Parabola GNU/Linux-libre OpenRC
description: Parabola GNU/Linux-libre adalah distro yang diendorse oleh GNU
lang: id_ID
date: 2021-06-26 11:27 +0700
layout: post
featured: true
author: Radhitya
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-06-26_11-25-28.jpg
categories:
- parabola linux
---

## Apa Itu Parabola GNU/Linux-libre
Parabola GNU/Linux-libre adalah distribusi turunan Arch yang menggunakan kernel **linux-libre**. Distro ini disokong oleh Komunitas Free Software Foundation (GNU). Ketika menggunakan Parabola GNU/Linux-libre, anda merasa bebas dan nyaman karena tidak ada bahaya dari **proprietary software**.

## Yang Harus Diperhatikan Ketika Install
Ingat, GNU/Linux-libre sangat berbeda dari GNU/Linux. Kernel disini sudah menghapus komponen closed source, bisa jadi firmware/hardware anda tidak bisa digunakan. Masalah ini biasa terjadi ke wifi card. 

Berikut hal - hal yang harus diperhatikan ketika install :

### Your Freedom
Ada sebuah packages bernama **your freedom**, packages ini berfungsi menolak instalasi (lewat repositori) program - program spyware, closed source, dan tidak sepaham dengan FSF. Contoh program - program yang diblokir antara lain Firefox, Chromium, Discord, dan masih banyak lagi.

Tetapi saya mencoba memasang Firefox secara manual dan berhasil. Jadi jika program anda diblokir, cobalah menginstall secara manual, bisa saja berhasil juga.
### WiFi Devices
Internet adalah krusial untuk laptop. Sebelum menggunakan Parabola GNU/Linux-libre, pastikan wifi card bisa digunakan.

Anda bisa membaca <a href="https://wiki.parabola.nu/WiFi_devices_known_to_work_with_Parabola_GNU/Linux-libre">Daftar Hardware Wifi</a>. Waktu mencoba Parabola GNU/Linux, saya menggunakan TP-LINK WN722N v1.
### Arch User Repository (AUR)
Keistimewaan Arch adalah AUR, sebuah repositori yang berisi ribuan program. Sayangnya Parabola GNU/Linux-libre tidak mendukung ini, sebaliknya disini menggunakan PCR alias Parabola Community Repo.

Jika anda masih bersikeras, silahkan gunakan AUR. Pastikan package tidak bermasalah dengan **your freedom**.
## Cara Install Parabola GNU/Linux-libre OpenRC
Pemasangan distro ini sangat mudah dan persis seperti *arch-based* umumnya. Waktu instalasi tergantung koneksi internet.

Saya anggap anda sudah punya ISO Netinstall versi OpenRC. Jika belum, silahkan download di <a href="https://parabola.nu">Parabola GNU/Linux-libre</a>

### Partisi Disk
Kita akan membuat partisi untuk distro Parabola.
```bash
cfdisk /dev/sdXX	## pilih harddisk yang digunakan
```
### Format File System Partisi
Disini kita akan memilih ext4 sebagai file system.
```bash
mkfs.ext4 -L ROOT /dev/sdXX	## partisi root, samakan seperti yang dibuat
mkfs.ext4 -L HOME /dev/sdXX	## partisi home, samakan seperti yang dibuat, jika tidak dibuat biarkan (opsional)
mkswap -L SWAP /dev/sdXX	## partisi swpa, samakan seperti yang dibuat, jika tidak dibuat biarkan (opsional))
```
### Mount Partisi
Kita akan mount dan membuat folder.
```bash
swapon /dev/disk/by-label/SWAP		## kalau tadi buat
mount /dev/sdik/by-label/ROOT /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount /dev/disk/by-label/HOME /mnt/home ## kalau tadi buat
mount /dev/disk/by-label/BOOT /mnt/boot ## kalau tadi buat
```

### Menghubungkan Ke Internet
Sebelum instalasi, pastikan sudah terhubung di internet. Disini saya menggunakan **Network Manager** dengan command **nmtui** atau **nmcli**.
Setelah sudah, bisa check dengan ping.
```bash
ping 8.8.8.8
```
### Verifikasi Tanda Tangan Paket
Kita akan meverifikasi paket dengan keyring agar bisa mengunduh.
```bash
pacman -Sy archlinux-keyring archlinuxarm-keyring parabola-keyring
pacman -U https://www.parabola.nu/packages/core/i686/archlinux32-keyring-transition/download/
```
### Install Base System
Kita akan mendownload base distro Parabola GNU/Linux-libre
```bash
pacstrap /mnt base libelogind udev-init-scripts
```
### Install Kernel Linux-Libre
Kita akan install kernel, disini saya menggunakan kernel LTS karena stabil.
```bash
pacstrap /mnt linux-libre-lts
```
### Install Network Manager
Install Network Manager untuk menghubungkan internet.
```bash
pacstrap /mnt networkmanager
```
### Install Firmware
Jangan lupa install firmware karena berisi driver - driver, salah satunya WiFi.
```bash
pacstrap /mnt linux-libre-firmware
```
### Install Graphical Desktop Environments
Kita akan menginstall elogind.
```bash
pacstrap /mnt elogind
```
### Install GRUB Bootloader
Memasang GRUB sebagai bootloader.
```bash
pacstrap /mnt grub
```
### Install Wireless Tools
Jika wifi anda adalah bersandi, anda butuh ini.
```bash
pacstrap /mnt wpa_supplicant
```
### Chroot
Kita akan generate fstab dengan command berikut
```bash
genfstab -p /mnt >> /mnt/etc/fstab
```
Lalu kita akan chroot ke distro yang sudah diinstall.
```bash
arch-chroot /mnt
```
### Menentukan Host
Kita akan menentukan host. Sebelumnya kita install text editor agar bisa mengedit file nya.
```bash
pacstrap /mnt vim nano
```
Jika sudah buka /etc/hosts dengan text editor, misalnya vim. Ganti **Parabola** sesuai keinginan.
```bash
vim /etc/hosts
---
127.0.0.1	localhost
::1		localhost
127.0.1.1	parabola.localdomain	myhostname
```
### Menentukan Hostname
Kita akan menentukan hostname. Ganti **parabola** sesuai keinginan.
```bash
vim /etc/conf.d/hostname
---
hostname="parabola"
```
### Menentukan timezone
Kita akan menentukan waktu dan tanggal, lakukan seperti dibawah.
```bash
ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
```
### Konfigurasi GRUB
Kita akan memasang grub sebagai bootloader.
```bash
grub-install /dev/sdX
grub-mkconfig -o /boot/grub/grub.cfg
```
### Setup User dan Password
Kita akan membuat password untuk root.
```bash
passwd
```
Kita akan membuat user berserta passwordnya.
```bash
useradd -m (username_kamu)
passwd (username_kamu)
```
### Unmount
Jika sudah, keluar dari chroot dan umount /mnt.
```bash
exit
umount /mnt
reboot
```
Selesai, anda telah berhasil memasang Parabola GNU/Linux-libre
