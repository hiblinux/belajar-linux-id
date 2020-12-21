---
author: nurhamim
layout: post
title: Membuat Authentikasi dan Custom Port HAProxy di CentOS 8
description: 'Membuat authentikasi login ke HAProxy menggunakan username dan password selain itu untuk login ke HAProxy nantinya kita akan mencoba custom menggunakan port tujuan utama nya supaya lebih secure dan hanya Anda yang mengetahui URL login ke sisi HAProxy Anda'
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/c6.png'
featured: true
date: '2020-09-02 23:00:06'
categories:
- centos
- haproxy
---

Pada tutorial kali ini kami akan memberikan cara sederhana bagaimana membuat authentikasi login ke HAProxy menggunakan username dan password selain itu untuk login ke HAProxy nantinya kita akan mencoba custom menggunakan port tujuan utama nya supaya lebih secure dan hanya Anda yang mengetahui URL login ke sisi HAProxy Anda.

Untuk mengikuti tutorial kali ini pastikan Anda sudah melakukan instalasi HAProxy, silakan buka konfigurasi haproxy Anda

    [root@haproxy ~]#
    [root@haproxy ~]# vim /etc/haproxy/haproxy.cfg

Tambahkan konfigurasi statistik HAProxy berikut

    listen stats
            bind *:2233
            stats enable
            stats hide-version
            stats refresh 30s
            stats show-node
            stats auth hamim:secret
            stats uri /stats

_Keterangan:_   
_ **bind:** Tentukan port yang ingin Anda gunakan_  
_ **stats enable:** Enable statistik HAProxy_  
_ **stats hide-version:** Melakukan disable versi HAProxy_  
_ **stats refresh:** Digunakan untuk refresh brower setiap s/m/sesuai keinginan_  
_ **stats show-node:** Digunakan untuk menampilkan node stats_  
_ **stats auth:** Digunakan untuk define username dan password login ke HAProxy sebagai contoj hamim:secret (hamim = username dan secret = password)_  
_ **stats uri:** Digunakan untuk difine /url yang diinginkan_

Pastikan Anda sudah allow port 2233 di sisi Firewall yang Anda gunakan

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="31" src="/content/images/wordpress/2020/09/image-10-1024x31.png" alt="" class="wp-image-438" srcset="/content/images/wordpress/2020/09/image-10-1024x31.png 1024w, /content/images/wordpress/2020/09/image-10-300x9.png 300w, /content/images/wordpress/2020/09/image-10-768x23.png 768w, /content/images/wordpress/2020/09/image-10-1536x46.png 1536w, /content/images/wordpress/2020/09/image-10.png 1668w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Reload HAProxy

    [root@haproxy ~]#
    [root@haproxy ~]# systemctl reload haproxy
    [root@haproxy ~]#

Akses HAProxy melalui web browser contohnya sebagai berikut

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="526" src="/content/images/wordpress/2020/09/1-1-1024x526.png" alt="" class="wp-image-439" srcset="/content/images/wordpress/2020/09/1-1-1024x526.png 1024w, /content/images/wordpress/2020/09/1-1-300x154.png 300w, /content/images/wordpress/2020/09/1-1-768x395.png 768w, /content/images/wordpress/2020/09/1-1-1536x790.png 1536w, /content/images/wordpress/2020/09/1-1.png 1920w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Isikan username dan password yang sudah tentukan sebelumnya

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="307" src="/content/images/wordpress/2020/09/2-1-1024x307.png" alt="" class="wp-image-440" srcset="/content/images/wordpress/2020/09/2-1-1024x307.png 1024w, /content/images/wordpress/2020/09/2-1-300x90.png 300w, /content/images/wordpress/2020/09/2-1-768x230.png 768w, /content/images/wordpress/2020/09/2-1-1536x460.png 1536w, /content/images/wordpress/2020/09/2-1.png 1920w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Saat ini HAProxy sudah dapat diakses menggunakan port dan authentikasi berupa username dan password.

Selamat mencoba 😁