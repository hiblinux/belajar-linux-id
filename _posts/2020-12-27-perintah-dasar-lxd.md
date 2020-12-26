---
title: Perintah Dasar Linux Container (LXD)
description: 'Perintah dasar ini sangat penting untuk dikuasai dengan kita paham perintah dasar yang digunakan, maka kita dapat mengoperasikan atau mengadministrasikan LXD dengan mudah'
lang: id_ID
date: 2020-12-27 06:34 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/perintah-dasar/perintah-dasar-linux-container.png'
categories:
 - LXC/LCD
 - Linux Container
---

[Belajar Linux ID](https://belajarlinux.id) - Jika sebelumnya kita sudah melakukan instalasi LXD, selanjutnya kita akan belajar bagaimana cara menggunakan LXD terutama perintah-perintah dasar yang ada di LXD. 

Perintah dasar ini sangat penting untuk dikuasai dengan kita paham perintah dasar yang digunakan, maka kita dapat mengoperasikan atau mengadministrasikan LXD dengan mudah. 

Sangat banyak perintah dasar yang perlu diketahui, pada tutorial ini akan dibahas perintah-perintah dasar LXD yang sering digunakan.

Berikut list pembahasan pada tutorial kali ini:

- Melihat daftar image LXD
- Membuat Linux Container
- Manajemen Container Menggunakan CLI
- Help Command LXD

## Melihat Images LXD

Untuk melihat images yang tersedia di LXD dapat dilakukan melalui command line dengan mudah, berikut ini beberapa perintah atau command yang dapat digunakan: 

Melihat semua list images LXD

```bash
ubuntu@lxd-belajarlinux:~$ lxc image list images:
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/perintah-dasar/1.png)

Melihat image spesifik distro Linux

```bash
ubuntu@lxd-belajarlinux:~$ lxc image list images: | grep -i centos
ubuntu@lxd-belajarlinux:~$ lxc image list images: | grep -i ubuntu
ubuntu@lxd-belajarlinux:~$ lxc image list images: | grep -i debian
```

## Membuat Linux Container

Sebelum membuat linux container, mari kita lihat terlebih dahulu linux container yang ada menggunakan command berikut

```bash
ubuntu@lxd-belajarlinux:~$ lxc list
+------+-------+------+------+------+-----------+
| NAME | STATE | IPV4 | IPV6 | TYPE | SNAPSHOTS |
+------+-------+------+------+------+-----------+
ubuntu@lxd-belajarlinux:~$
```

Terlihat diatas saat ini masih belum ada linux container. Untuk membuat linux container lxd sangatlah mudah, berikut contoh command yang digunakan:

```bash
$ lxc launch images:{distro}/{version}/{arch} {container-name}
```

Disini kami berikan contoh bagaimana cara membuat container Ubuntu 16.04, 18.04 dan 20.04 LTS 

```bash
# Ubuntu 16.04 LTS
ubuntu@lxd-belajarlinux:~$ lxc launch images:ubuntu/xenial/amd64 ubuntu-xenial-c1

# Ubuntu 18.04 LTS
ubuntu@lxd-belajarlinux:~$ lxc launch images:ubuntu/bionic/amd64 ubuntu-bionic-c2

# Ubuntu 20.04 LTS
ubuntu@lxd-belajarlinux:~$ lxc launch images:ubuntu/focal/amd64 ubuntu-focal-c3
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/perintah-dasar/2.png)

Jika ingin membuat linux container dengan sistem operasi CentOS 8 juga dapat dilakukan seperti berikut:

```bash
ubuntu@lxd-belajarlinux:~$ lxc launch images:centos/8/amd64 cenots-8-c2
Creating cenots-8-c2
Starting cenots-8-c2
ubuntu@lxd-belajarlinux:~$
```

Dan berikut contoh cara membuat linux container untuk sistem operasi Debian 9 dan 10

```bash
# Debian 9
ubuntu@lxd-belajarlinux:~$ lxc launch images:debian/stretch/amd64 debian-9-c1
Creating debian-9-c1
Starting debian-9-c1
ubuntu@lxd-belajarlinux:~$

# Debian 10
ubuntu@lxd-belajarlinux:~$ lxc launch images:debian/10/amd64 debian-10-c1
Creating debian-10-c1
Starting debian-10-c1
ubuntu@lxd-belajarlinux:~$
```

Berikut contoh membuat linux container untuk distro Linux lainnya

```bash
# Arch Linux Container
ubuntu@lxd-belajarlinux:~$ lxc launch images:archlinux/amd64 arch-c4
Creating arch-c4
Starting arch-c4
ubuntu@lxd-belajarlinux:~$

# Gentoo Linux container
ubuntu@lxd-belajarlinux:~$ lxc launch images:gentoo/amd64 gentoo-c4
Creating gentoo-c4
Starting gentoo-c4
ubuntu@lxd-belajarlinux:~$

# OpenSUSE Linux 15.0 container
ubuntu@lxd-belajarlinux:~$ lxc launch images:opensuse/15.1/amd64 opensuse15-1-c4
Creating opensuse15-1-c4
Starting opensuse15-1-c4
ubuntu@lxd-belajarlinux:~$

# Oracle Linux 8.x VM
ubuntu@lxd-belajarlinux:~$ lxc launch images:oracle/8/amd64 oracle-8-c4
Creating oracle-8-c4
Starting oracle-8-c4
ubuntu@lxd-belajarlinux:~$
```

Sekarang mari kita lihat semua list container yang sudah kita buat diatas menggunakan command `lxc list` hasilnya seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/perintah-dasar/3.png)

## Manajemen Linux Container  via CLI

Jika sebelumnya kita sudah belajar bagaimana membuat linux container, saat ini kita akan belajar bagaimana melakukan manajemen linux container menggunakan commmand line lxc seperti halnya melihat linux container, login ke linux container, start linux container, stop linux container, restart linux container dan delete linux container. 

Ada beberapa command linux yang dapat kita manfaatkan dalam melakukan manajemen linux container seperti halnya command `grep atau egrep` command ini sangat membantu kita dalam melakukan manajemen linux container, dengan menggunakan command tersebut kita dapat melihat secara spesifik `kata` apa yang diperlukan. 

### List  Linux  Container

Untuk melihat detail informasi linux container apa saja yang ada dapat mengguunakan perintah 

```bash
ubuntu@lxd-belajarlinux:~$ lxc list
```

Atau dapat Anda tambahkan `--fast` dan lihat perbedaanya

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/perintah-dasar/4.png)

Yaaps, dengan command `--fast` kita tidak ada melihat detail IP dari linux container.

Seperti yang sudah disinggung diatas kita dapat mengkombinasikannya menggunakan `grep`, misal kita ingin melihat container yang sedang running dan stop secara spesifik menggunakan `grep `

```bash
ubuntu@lxd-belajarlinux:~$ lxc list | grep RUNNING
ubuntu@lxd-belajarlinux:~$ lxc list | grep STOP
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/perintah-dasar/5.png)

Atau dapat Anda `grep` spesifik name container contoh container `opensuse`

```bash
ubuntu@lxd-belajarlinux:~$ lxc list | grep -i opensuse
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/perintah-dasar/6.png)

Anda juga dapat melihat list container berdasarkan name container tanpa menggunakan `grep` contoh:

```bash
ubuntu@lxd-belajarlinux:~$ lxc list "*c1*"
ubuntu@lxd-belajarlinux:~$ lxc list "*c2*"
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/perintah-dasar/7.png)

### Login atau Exec Linux Container

Linux container yang sudah kita buat dapat di eksekusi tanpa login ke dalam linux container (eksekusi dari host) caranya sangat mudah, berikut contoh commandnya

```bash
$ lxc exec containerName -- command
$ lxc exec containerName -- /path/to/script
$ lxc exec containerName --env EDITOR=/usr/bin/vim -- command
```

Berikut contoh misalnya disini kami menggunakan linux container name `ubuntu-bionic-c2`

```bash
# Lihat tanggal
ubuntu@lxd-belajarlinux:~$ lxc exec ubuntu-bionic-c2 -- date
Sat Dec 26 22:55:37 UTC 2020
ubuntu@lxd-belajarlinux:~$

# Lihat IP Container
ubuntu@lxd-belajarlinux:~$ lxc exec ubuntu-bionic-c2 -- ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
14: eth0@if15: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 00:16:3e:c4:50:a8 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 10.171.248.204/24 brd 10.171.248.255 scope global dynamic eth0
       valid_lft 3132sec preferred_lft 3132sec
    inet6 fd42:c106:7321:e7f9:216:3eff:fec4:50a8/64 scope global dynamic mngtmpaddr noprefixroute
       valid_lft 3118sec preferred_lft 3118sec
    inet6 fe80::216:3eff:fec4:50a8/64 scope link
       valid_lft forever preferred_lft forever
ubuntu@lxd-belajarlinux:~$

# Lihat IP Router Container
ubuntu@lxd-belajarlinux:~$ lxc exec ubuntu-bionic-c2 -- ip r
default via 10.171.248.1 dev eth0 proto dhcp src 10.171.248.204 metric 100
10.171.248.0/24 dev eth0 proto kernel scope link src 10.171.248.204
10.171.248.1 dev eth0 proto dhcp scope link src 10.171.248.204 metric 100
ubuntu@lxd-belajarlinux:~$

# Update Linux Container
ubuntu@lxd-belajarlinux:~$
ubuntu@lxd-belajarlinux:~$ lxc exec ubuntu-bionic-c2 -- apt update -y
Hit:1 http://archive.ubuntu.com/ubuntu bionic InRelease
Get:2 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:3 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Fetched 177 kB in 1s (138 kB/s)
Reading package lists... Done
Building dependency tree
Reading state information... Done
All packages are up to date.
ubuntu@lxd-belajarlinux:~$

# Cek Veri Container Ubuntu
ubuntu@lxd-belajarlinux:~$
ubuntu@lxd-belajarlinux:~$ lxc exec ubuntu-bionic-c2 -- lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.04.5 LTS
Release:        18.04
Codename:       bionic
ubuntu@lxd-belajarlinux:~$
```

Apabila Anda ingin akses ke container dapat melalui bash shell, disini kami contohkan akses ke linux container `ubuntu-bionic-c2` command yang digunakan seperti berikut

```bash
$ lxc exec {container-name} {shell-name}
```

Contohnya

```bash
# Menggunakan Shell Bash
ubuntu@lxd-belajarlinux:~$ lxc exec ubuntu-bionic-c2 bash
root@ubuntu-bionic-c2:~#
root@ubuntu-bionic-c2:~# ping google.com -c2 |grep icmp
64 bytes from 172.217.194.102: icmp_seq=1 ttl=55 time=12.8 ms
64 bytes from 172.217.194.102: icmp_seq=2 ttl=55 time=12.7 ms
root@ubuntu-bionic-c2:~#
root@ubuntu-bionic-c2:~# exit
exit
ubuntu@lxd-belajarlinux:~$

# Menggunakan Shell SH
ubuntu@lxd-belajarlinux:~$ lxc exec ubuntu-bionic-c2 sh
#
# ping google.com -c2 |grep icmp
64 bytes from 172.217.194.101: icmp_seq=1 ttl=55 time=12.7 ms
64 bytes from 172.217.194.101: icmp_seq=2 ttl=55 time=12.7 ms
#
# exit
ubuntu@lxd-belajarlinux:~$
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/perintah-dasar/8.png)

### Stop, Start, Restart dan Delete Linux Container

 Untuk melakukan stop, start, restart dan delete linux container sangat mudah sekali, disini kami berikan contoh diatas dimana container yang kami gunakan yaitu `ubuntu-bionic-c2`

```bash
# Stop Container
Command: $ lxc stop {container-name}

ubuntu@lxd-belajarlinux:~$ lxc stop ubuntu-bionic-c2
ubuntu@lxd-belajarlinux:~$

# Start Container
Command: $ lxc start {container-name}

ubuntu@lxd-belajarlinux:~$ lxc start ubuntu-bionic-c2
ubuntu@lxd-belajarlinux:~$

# Restart Container
Command: $ lxc restart {container-name}

ubuntu@lxd-belajarlinux:~$ lxc restart ubuntu-bionic-c2
ubuntu@lxd-belajarlinux:~$

# Delete Container
Command: $ lxc delete {container-name}

ubuntu@lxd-belajarlinux:~$ lxc delete ubuntu-bionic-c2
ubuntu@lxd-belajarlinux:~$
```

_Noted: Untuk delete linux container pastikan container tersebut dalam keadaan stop._

### Informasi Linux Container

Untuk melihat informasi dari linux container dapat dilakukan langsung dari host tanpa login ke container berikut command yang digunakan

```bash
lxc info
lxc info {container-name}
ubuntu@lxd-belajarlinux:~$ lxc info ubuntu-bionic-c2
Name: ubuntu-bionic-c2
Location: none
Remote: unix://
Architecture: x86_64
Created: 2020/12/26 22:18 UTC
Status: Stopped
Type: container
Profiles: default
ubuntu@lxd-belajarlinux:~$
```

Anda juga dapat pull (mengambil) file yang ada di dalam container contoh 

```bash
Command: lxc file pull {continer-nane}/{path/to/file} {/path/to/local/dest}

ubuntu@lxd-belajarlinux:~$ lxc file pull ubuntu-bionic-c2/var/www/nginx/app/config.php .
```

Sebaliknya Anda juga dapat mengirim file dari host ke dalam container menggunakan `push`

```bash
Command: lxc file push {/path/to/file} {continer-nane}/path/to/dest/dir/

ubuntu@lxd-belajarlinux:~$ lxc file push config.php ubuntu-bionic-c2/var/www/nginx/app/
```

## Help Command LXD

Setiap service pasti mempunyai command bantuan (help) atau sering disebut dengan document internal yang sangat banyak orang tidak memanfaatkan command ini, padahal command ini sangat berguna sekali bagi Anda yang bingung dan malas untuk mencari di internet dengan command help ini kita dapat mencari `hint` atau contoh command yang dapat kita gunakan berikut cara menggunakan command `help` di LXD

```bash
$ lxc --help
$ lxc {command} --help
$ lxc list --help
```

Itulah beberapa perintah-perintah dasar yang sering digunakan dalam berinteraksi di linux container, apabila terdapat pertanyaan dapat melalui kolom komentar ya !

Selamat mencoba 😊
