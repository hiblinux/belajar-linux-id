---
title: Load Balancing SMTP Menggunakan HAProxy
description: 'Tujuan dari tutorial kali ini yaitu untuk melakukan load balancing email SMTP, dengan metode load balancing ini diharapkan email SMTP dapat dibagi bebannya dan tidak bertumpu hanya 1 server saja'
lang: id_ID
layout: post
date: 2020-12-24 12:00 +0700
author: nurhamim
featured: true
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lb-smtp.png'
categories:
  - haproxy
  - mail-server
---

Jika di tutorial sebelumnya kita sudah membahas bagaimana cara melakukan [instalasi HAProxy di Linux](https://belajarlinux.id/cara-install-haproxy-di-linux/), maka tutorial kali ini kita bahas bagaimana cara konfigurasi SMTP di HAProxy. 

Tujuan dari tutorial kali ini yaitu untuk melakukan load balancing email SMTP, dengan metode load balancing ini diharapkan email SMTP dapat dibagi bebannya dan tidak bertumpu hanya 1 server saja. 

Kemudian untuk mengikuti tutorial ini pastikan Anda sudah instalasi SMTP.

Berikut topologi sederhana yang kami gunakan

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/load-balancing-smtp.png)

Berikut detail dari topologi diatas:

| IP           | Hostname            | Keterangan |
| :---------:  | :------------------:| :--------: |
| 20.20.20.104 | pmg.nurhamim.my.id  | SMTP 1     |
| 20.20.20.105 | pmg1.nurhamim.my.id | SMTP 2     |
| 20.20.20.109 | ha.nurhamim.my.id   | LB         |

**Note:** Ke 2 server SMTP diatas akan ditangani oleh server LB dimana server LB akan di set menggunakan algoritma round robin. 

Untuk melakukan konfigurasi SMTP di HAProxy hampir sama dengan konfigurasi protokol HTTP dan letak direktorinya berada di `/etc/haproxy`, silakan buka file `haproxy.cfg`. 

Berikut contoh konfigurasi SMTP di HAProxy:

```console
global
        log /dev/log local0
        log /dev/log local1 notice
        chroot /var/lib/haproxy
        stats timeout 30s
        user haproxy
        group haproxy
        daemon

defaults
        log global
        mode http
        option httplog
        option dontlognull
        timeout connect 5000
        timeout client 50000
        timeout server 50000

frontend ft_smtp
        bind 0.0.0.0:26
        mode tcp
        timeout client 1m
        log global
        option tcplog
        default_backend bk_postfix

backend bk_postfix
        mode tcp
        no option http-server-close
        balance roundrobin
        log global
        timeout server 1m
        timeout connect 5s
        server pmg 20.20.20.104:26 check
        server pmg1 20.20.20.105:26 check
```

*Note:* 
- Silakan sesuaikan alamat IP SMTP di bagian _server_ dan pastikan untuk _mode_ menggunakan **TCP** karena SMTP menggunakan protokol **TCP**. 
- Untuk port SMTP silakan disesuaikan dengan kondisi masing-masing, disini SMTP kami listen di port **26**
- Tentukan algoritma yang ingin digunakan, disini kami menggunakan round-robin

Simpan konfigurasi diatas dan verifikasi konfigurasi HAProxy menggunakan perintah berikut:

```console
[root@ha-pmg-belajarlinux ~]#
[root@ha-pmg-belajarlinux ~]# haproxy -c -f /etc/haproxy/haproxy.cfg
Configuration file is valid
[root@ha-pmg-belajarlinux ~]#
```

Jika sudah valid seperti diatas, silakan restart atau reload service HAProxy Anda

```console
[root@ha-pmg-belajarlinux ~]#
[root@ha-pmg-belajarlinux ~]# systemctl restart haproxy
[root@ha-pmg-belajarlinux ~]#
```

Testing SMTP HAProxy bisa menggunakan telnet ke alamat IP LB disini yaitu 20.20.20.109 seperti berikut

```console
# Percobaan 1

[root@ha-pmg-belajarlinux ~]#
[root@ha-pmg-belajarlinux ~]# telnet 20.20.20.109 26
Trying 20.20.20.109...
Connected to 20.20.20.109.
Escape character is '^]'.
220 pmg.nurhamim.my.id pmg belajar linux
quit
221 2.0.0 Bye
Connection closed by foreign host.
[root@ha-pmg-belajarlinux ~]#

# Percobaan 2

[root@ha-pmg-belajarlinux ~]#
[root@ha-pmg-belajarlinux ~]# telnet 20.20.20.109 26
Trying 20.20.20.109...
Connected to 20.20.20.109.
Escape character is '^]'.
220 pmg1.nurhamim.my.id pmg belajar linux
quit
221 2.0.0 Bye
Connection closed by foreign host.
[root@ha-pmg-belajarlinux ~]#
```

Dari informasi telnet diatas terliat algortima round robin untuk SMTP Load Balancing yang kami gunakan sudah berjalan dengan normal. 

Selamat mencoba 😁


