---
title: Cara Install LXDUI di Ubuntu 20.04 LTS
description: 'Tutorial kali ini kami akan membahas bagaimana cara melakukan manajemen linux container melalui web interface (web browser).  Linux container yang terinstall secara stand-alone (1 host) dapat dilakukan manajemen melalui web browser menggunakan LXDUI'
lang: id_ID
date: 2020-12-27 19:06 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/manage-lxdui/cover1.png'
categories:
 - LXC/LCD
 - Linux Container
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini kami akan membahas bagaimana cara melakukan manajemen linux container melalui web interface (web browser).  Linux container yang terinstall secara stand-alone (1 host) dapat dilakukan manajemen melalui web browser menggunakan **LXDUI**.

**LXDUI** sendiri memanfaatkan Python client library, [pylxd](https://github.com/lxc/pylxd), untuk berinteraksi dengan LXD REST API. Hal ini yang memungkinkan penyediaan dan pengelolaan sejumlah besar container dengan cepat dari browser web, dan Anda dapat secara bersamaan membuat sejumlah besar container, bahkan dari beberapa images (linux container).

**LXDUI** kali ini akan kami install di sistem operasi Ubuntu 20.04 LTS. Sebelum melakukan instalasi **LXDUI** kita perlu install terlebih dahulu dependensi yang dibutuhkan sebagai berikut: 

```bash
ubuntu@lxd-belajarlinux:~$  sudo apt install -y git build-essential libssl-dev python3-venv python3-pip python3-dev zfsutils-linux bridge-utils
```

Selanjutnya install LXD, untuk panduan install LXD dapat merujuk pada link berikut: [Cara Install Linux Container (LXD)](https://belajarlinux.id/install-lxd-di-linux/) 

Jika sudah silakan cloen project LXDUI dari repository github berikut: [Repository LXDUI](https://github.com/AdaptiveScale/lxdui) atau bisa menggunakan command `git clone` seperti berikut: 

```bash
ubuntu@lxd-belajarlinux:~$ git clone https://github.com/AdaptiveScale/lxdui.git
Cloning into 'lxdui'...
remote: Enumerating objects: 1, done.
remote: Counting objects: 100% (1/1), done.
remote: Total 5120 (delta 0), reused 0 (delta 0), pack-reused 5119
Receiving objects: 100% (5120/5120), 5.01 MiB | 1.01 MiB/s, done.
Resolving deltas: 100% (3566/3566), done.
ubuntu@lxd-belajarlinux:~$
```

Upgrade _pip3 python_ terlebih dahulu

```bash
ubuntu@lxd-belajarlinux:~$ pip3 install --upgrade pip
Collecting pip
  Downloading pip-20.3.3-py2.py3-none-any.whl (1.5 MB)
     |████████████████████████████████| 1.5 MB 4.0 MB/s
Installing collected packages: pip
  WARNING: The scripts pip, pip3 and pip3.8 are installed in '/home/ubuntu/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
Successfully installed pip-20.3.3
ubuntu@lxd-belajarlinux:~$
```

Install **LXUI** menggunakan _pip3_

```bash
ubuntu@lxd-belajarlinux:~/lxdui$
ubuntu@lxd-belajarlinux:~/lxdui$ pip3 install .
```

Untuk menjalankan service **LXDUI** dapat menggunakan _python3_ atau menggunakan command _lxdui_ seperti berikut

```bash
# Menggunakan Python
ubuntu@lxd-belajarlinux:~/lxdui$
ubuntu@lxd-belajarlinux:~/lxdui$ python3 run.py start
/usr/local/lib/python3.8/dist-packages/netaddr-0.7.19-py3.8.egg/netaddr/strategy/__init__.py:189: SyntaxWarning: "is not" with a literal. Did you mean "!="?
  if word_sep is not '':
LXDUI ver. 2.1.2 -- (c)AdaptiveScale, Inc.
http://www.adaptivescale.com
LXDUI started. Running on http://0.0.0.0:15151
PID=619118, Press CTRL+C to quit

# Menggunakan Commang LXDUI
ubuntu@lxd-belajarlinux:~/lxdui$
ubuntu@lxd-belajarlinux:~/lxdui$ lxdui start
LXDUI ver. 2.1.2 -- (c)AdaptiveScale, Inc.
http://www.adaptivescale.com
LXDUI started. Running on http://0.0.0.0:15151
PID=641040, Press CTRL+C to quit
```

Silakan Akses IP Host menggunakan port **15151** seperti berikut

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/lxdui/1.png)

Username dan password default yang digunakan yaitu _admin:admin_

Berikut tampilan dashboard dari **LXDUI** 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/lxdui/2.png)

Selamat mencoba 😁
