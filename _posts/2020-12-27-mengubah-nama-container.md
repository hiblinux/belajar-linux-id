---
title: Cara Mengubah Nama Linux Container (LXD)
description: 'Jika Anda pernah melakukan sebuah kesalahan pada saat memberikan nama linux container (LXD), maka hal yang perlu Anda lakukan yaitu mengubah nama linux container tersebut'
lang: id_ID
date: 2020-12-27 07:19 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/perintah-dasar/rename-lxd.png'
categories:
 - LXC/LCD
 - Linux Container
---

[Belajar Linux ID](https://belajarlinux.id) -  Jika Anda pernah melakukan sebuah kesalahan pada saat memberikan nama linux container (LXD), maka hal yang perlu Anda lakukan yaitu mengubah nama linux container tersebut. 

Lalu bagaimana cara mengubah nama linux container yang sudah terlanjur terbuat?.

Yaaps kali ini kita akan bahas bagaimana cara mengubah (rename) linux container yang sudah ada (existing) dengan cara sebagai berikut:

Langkah pertama yang dilakukan yaitu melakukan stop linux container 

```bash
ubuntu@lxd-belajarlinux:~$ lxc info cenots-8-c2 |grep Status
Status: Running
ubuntu@lxd-belajarlinux:~$ lxc stop cenots-8-c2
ubuntu@lxd-belajarlinux:~$ lxc info cenots-8-c2 |grep Status
Status: Stopped
ubuntu@lxd-belajarlinux:~$
```

Selanjutnya, Anda dapat ubah nama linux container diatas dengan cara `move` container contohnya seperti berikut

```bash
ubuntu@lxd-belajarlinux:~$ lxc move cenots-8-c2 centos-8-c1
ubuntu@lxd-belajarlinux:~$ lxc start centos-8-c1
ubuntu@lxd-belajarlinux:~$ lxc info centos-8-c1 |grep status
ubuntu@lxd-belajarlinux:~$ lxc info centos-8-c1 |grep Status
Status: Running
ubuntu@lxd-belajarlinux:~$
```

_Note: Dari **cenots-8-c2** di ubah menjadi **centos-8-c1**_

Verifikasi linux container

```bash
ubuntu@lxd-belajarlinux:~$ lxc info centos-8-c1
Name: centos-8-c1
Location: none
Remote: unix://
Architecture: x86_64
Created: 2020/12/26 22:22 UTC
Status: Running
Type: container
Profiles: default
Pid: 352773
Ips:
  eth0: inet    10.171.248.94   veth337ef230
  eth0: inet6   fd42:c106:7321:e7f9:216:3eff:fe6d:7fa2  veth337ef230
  eth0: inet6   fe80::216:3eff:fe6d:7fa2        veth337ef230
  lo:   inet    127.0.0.1
  lo:   inet6   ::1
Resources:
  Processes: 13
  Disk usage:
    root: 23.57MB
  CPU usage:
    CPU usage (in seconds): 1
  Memory usage:
    Memory (current): 44.91MB
    Memory (peak): 51.16MB
  Network usage:
    eth0:
      Bytes received: 1.42kB
      Bytes sent: 2.20kB
      Packets received: 14
      Packets sent: 24
    lo:
      Bytes received: 0B
      Bytes sent: 0B
      Packets received: 0
      Packets sent: 0
ubuntu@lxd-belajarlinux:~$
```

Login ke linux container dan setting `hostname` serta update `/etc/hosts`

```bash
ubuntu@lxd-belajarlinux:~$ lxc exec centos-8-c1 bash
[root@centos-8-c1 ~]#
[root@centos-8-c1 ~]# echo 'centos-8-c1' > /etc/hostname
[root@centos-8-c1 ~]# sed -i 's/cenots-8-c2/centos-8-c1/g' /etc/hosts
[root@centos-8-c1 ~]# exit
exit
ubuntu@lxd-belajarlinux:~$ lxc restart centos-8-c1
ubuntu@lxd-belajarlinux:~$
```

Verifikasi kembali dengan cara login ke linux container

```bash
ubuntu@lxd-belajarlinux:~$
ubuntu@lxd-belajarlinux:~$ lxc exec centos-8-c1 bash
[root@centos-8-c1 ~]# cat /etc/os-release
NAME="CentOS Linux"
VERSION="8"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="8"
PLATFORM_ID="platform:el8"
PRETTY_NAME="CentOS Linux 8"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:8"
HOME_URL="https://centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"
CENTOS_MANTISBT_PROJECT="CentOS-8"
CENTOS_MANTISBT_PROJECT_VERSION="8"
[root@centos-8-c1 ~]#
```

Oke sampai disini linux container Anda sudah berhasil diubah. 

Selamat mencoba 😁
