---
title: Cara Membuat, Restore dan Delete Snapshot Linux Container (LXD)
description: Tulis deskripsi postingan
lang: id_ID
date: 2020-12-27 08:22 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/snapshot/cover-snapshot-lxd.png'
categories:
 - LXC/LCD
 - Linux Container
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini kita akan belajar bagaimana cara membuat snapshot linux container, snapshot ini dapat kita peruntukan sebagai backup linux container jika dibutuhkan. 

### Create Snapshot Linux Container

Sintak yang digunakan untuk membuat snapshot linux container yaitu:

```bash
$ lxc snapshot {container} {snapshot-name}
```

Contoh: 

```bash
ubuntu@lxd-belajarlinux:~$ lxc snapshot centos-8-c1 snapshot-27-des-2020
```

Verifikasi linux container yang sudah di snapshot

```bash
ubuntu@lxd-belajarlinux:~$ lxc info centos-8-c1 |grep snapshot
  snapshot-27-des-2020 (taken at 2020/12/27 00:41 UTC) (stateless)
ubuntu@lxd-belajarlinux:~$
```

Selanjutnya, untuk membuat snapshot atau mengambil snaphost disarankan untuk stop linux container terlebih dahulu kemudian dapat dilakukan snapshot linux container contoh

```bash
ubuntu@lxd-belajarlinux:~$
ubuntu@lxd-belajarlinux:~$ lxc stop centos-8-c1
ubuntu@lxd-belajarlinux:~$ lxc info centos-8-c1 |grep Status
Status: Stopped
ubuntu@lxd-belajarlinux:~$ lxc snapshot centos-8-c1 snap01
ubuntu@lxd-belajarlinux:~$ lxc start centos-8-c1
ubuntu@lxd-belajarlinux:~$ lxc info centos-8-c1 |grep Status
Status: Running
ubuntu@lxd-belajarlinux:~$
```

### Restore Snapshot Linux Container

Sintak yang digunakan untuk melakukan restore snapshot sebagai berikut: 

```bash
$ lxc restore {container} {snapshot-name}
```

Untuk melakukan snapshot dapat menggunakan perintah berikut:

```bash
ubuntu@lxd-belajarlinux:~$ lxc restore centos-8-c1 snap01
```

### Delete Snapshot

Sintak yang digunakan untuk delete snapshot sebagai berikut:

```bash
$ lxc delete {container}/snapshot-name}
```

Jika ingin hapus snapshot dengan konfirmasi terlebih dahulu dapat ditambahkan opsi `-i` 

```
$ lxc delete {container}/snapshot-name} -i 
```

Mari kita lihat snapshot yang ada di linux container contoh

```bash
ubuntu@lxd-belajarlinux:~$ lxc info centos-8-c1 |grep snap
  snapshot-27-des-2020 (taken at 2020/12/27 00:41 UTC) (stateless)
  snap01 (taken at 2020/12/27 00:58 UTC) (stateless)
ubuntu@lxd-belajarlinux:~$
```

Studi kasusnya yaitu menghapus dua snapshot yang ada di linux container `centos-8-c1` 

```bash
# Hapus snapshot dengan konfirmasi (-i)
ubuntu@lxd-belajarlinux:~$ lxc delete centos-8-c1/snapshot-27-des-2020 -i
Remove centos-8-c1/snapshot-27-des-2020 (yes/no): yes
ubuntu@lxd-belajarlinux:~$

# Hapus snapshot tanpa konfirmasi
ubuntu@lxd-belajarlinux:~$ lxc delete centos-8-c1/snap01
ubuntu@lxd-belajarlinux:~$
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/snapshot/1.png)

Sampai  disini Anda sudah dapat membuat, restore dan delete snapshot dengan mudah menggunakan command lxc tentunya. 

Selamat mencoba 😁
