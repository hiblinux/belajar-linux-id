---
title: Cara Install Linux Container (LXD)
description: 'Linux Container kepanjangan dari LXC merupakan suatu metode virtualisasi level sistem operasi linux untuk menjalankan beberapa sistem linux yang terisolasi pada satu host'
lang: id_ID
date: 2020-12-26 00:42 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/Install%20LXD.png'
categories:
 - LXC/LCD
 - Linux Container
---


Dikutip dari laman resmi [Linux Containers](https://linuxcontainers.org) LXD dapat di install diberbagai jenis distro Linux bahkan LXD juga dapat diinstall di MacOS serta Windows.

Pada tutorial kali ini akan kami bahas bagaimana cara install linux container LXD. Ada baiknya sebelum melakukan instalasi LXD Anda telah mempelajari terlebih dahulu tentang apa itu LXD yang dapat Anda lihat pada link berikut: [Mengenal Tentang LXC/LXD](https://belajarlinux.id/pengenalan-lxc-atau-lxd/).

**_Note:_**  Untuk kebutuhan production kami sarankan install LXD di sistem operasi **Ubuntu** karena yang mengembangkan LXD yaitu Ubuntu (Canonical), seharusnya dari segi performa dan update security akan lebih bagus jika menggunakan Ubuntu.

Berikut ini beberapa perintah untuk melakukan instalasi LXD.

```bash
## Linux Alpine
$ apk add lxd

## Arch Linux
$ pacman -S lxd

## Gentoo
$ emerge --ask lxd

## Ubuntu All release stable with snap
$ snap install lxd

## Ubuntu LXD 4.0 stable version
$ snap install lxd --channel=4.0/stable

## Ubuntu LXD 3.0 stable version
$ snap install lxd --channel=3.0/stable

## Ubuntu LXD 2.0 stable version
$ snap install lxd --channel=2.0/stable

## Ubuntu LXD Install with APT
$ sudo apt install lxd
```

### Snap package (Arch Linux, Debian, Fedora, OpenSUSE and Ubuntu)

LXD upstream menerbitkan dan menguji paket snap yang berfungsi untuk sejumlah distribusi Linux. Daftar distribusi Linux yang saat ini kami uji snap kami dapat ditemukan melalui link berikut: [Project lxd-test-snap-latest-stable](https://jenkins.linuxcontainers.org/job/lxd-test-snap-latest-stable/).

### Install LXD di MacOS

LXD juga dapat dijalankan di MacOS tentnunya disisi client bukan disisi server. LXD upstream menerbitkan build client LXD untuk macOS melalui [Homebrew](https://brew.sh/).

Jalankan perintah berikut, untuk instalasinya: 

```bash
$ brew install lxc
```

### Install LXD di Windows

Saat ini Windows sudah ada WSL (Windows Subsystem Linux) dengan demikian Anda dapat memanfaatkan WSL di Windows jika ingin mencoba lab linux container LXD. 

Tahapan instalasi LXD di WSL dapat merujuk pada link berikut: [WSL2+LXD: Let’s have some Fun too](https://wsl.dev/wsl2-lxd-funtoo/).


## Konfigurasi Dasar

Setelah melakukan instalasi LXD Anda perlu melakukan konfigurasi dasar yang wajib dilakukan, untuk melakukannya jalankan perintah `lxd init` seperti berikut: 

```bash
$ sudo lxd init
Would you like to use LXD clustering? (yes/no) [default=no]: no
Do you want to configure a new storage pool? (yes/no) [default=yes]: yes
Name of the new storage pool [default=default]: zfs_blinux
Name of the storage backend to use (zfs, ceph, btrfs, dir, lvm) [default=zfs]: zfs
Create a new ZFS pool? (yes/no) [default=yes]: yes
Would you like to use an existing block device? (yes/no) [default=no]: no
Size in GB of the new loop device (1GB minimum) [default=15GB]: 40GB
Would you like to connect to a MAAS server? (yes/no) [default=no]: no
Would you like to create a new local network bridge? (yes/no) [default=yes]: yes
What should the new bridge be called? [default=lxdbr0]:
What IPv4 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]: auto
What IPv6 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]: auto
Would you like LXD to be available over the network? (yes/no) [default=no]: no
Would you like stale cached images to be updated automatically? (yes/no) [default=yes] yes
Would you like a YAML "lxd init" preseed to be printed? (yes/no) [default=no]: yes
config: {}
networks:
- config:
    ipv4.address: auto
    ipv6.address: auto
  description: ""
  name: lxdbr0
  type: ""
storage_pools:
- config:
    size: 40GB
  description: ""
  name: zfs_blinux
  driver: zfs
profiles:
- config: {}
  description: ""
  devices:
    eth0:
      name: eth0
      network: lxdbr0
      type: nic
    root:
      path: /
      pool: zfs_blinux
      type: disk
  name: default
cluster: null
$
```

Selamat mencoba 😁

Referensi: [Linux Container](https://linuxcontainers.org/)

