---
title: Cara Download dan Update LibreOffice di Debian GNU/Linux
description: 'LibreOffice adalah salah satu office suite open source di GNU/Linux'
lang: id_ID
date: 2021-06-12 22:10 +0700
layout: post
featured: true
author: Radhitya
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-06-13_11-11-04.jpg'
categories:
- libreoffice
---

## Apa Itu LibreOffice?
[Belajar Linux ID](https://belajarlinux.id) - LibreOffice adalah salah satu office suite open source terbaik di GNU/Linux. Distro - distro Linux Mainstream umumnya menjadikan LibreOffice sebagai default office suite.

Program ini menyediakan Writer untuk menulis dokumen, Calc untuk spreadsheet, Impress untuk presentasi, Math untuk formula, dan Base untuk Database. Bisa dibilang LibreOffice sangat powerfull sebagai alternatif Microsoft Office.

Kabar baiknya, anda bisa mendapatkannya secara gratis dan tersedia di Windows, Linux, FreeBSD, dan MacOS.

## Bagaimana cara download LibreOffice di Debian GNU/Linux?
Cara mendownload LibreOffice di GNU Linux sangat mudah lewat repository. Disini saya akan mempraktekan di distro Debian GNU/Linux.

```bash
sudo apt install libreoffice -y
```
Terkadang versi repository tidak secepat versi website, apalagi distro dengan stabilitas tinggi seperti Debian GNU/Linux. Alamatnya harus lewat websitenya langsung. Cara ini bersifat opsional.

```bash
wget https://download.documentfoundation.org/libreoffice/stable/7.1.3/deb/x86_64/LibreOffice_7.1.3_Linux_x86-64_deb.tar.gz
tar -zxf LibreOffice_7.1.3.Linux_x86-64_deb.tar.gz
cd LibreOffice_7.1.3.Linux_x86-64_deb/DEBS/
sudo dpkg -i *.deb
```

## Bagaimana Cara Mengupdate LibreOffice di Debian GNU/Linux?
Cara mengupdate sama seperti cara mendownload. Otomatis akan menimpa versi lama dengan versi terbaru.
