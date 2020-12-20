---
author: nurhamim
layout: post
title: Cara Mengatur Hostname Pada VM CentOS
description: 'Hostname merupakan nama dari VM, untuk mengatur hostname di CentOS Anda hanya perlu menjalakan satu bari perintah saja'
featured: true
date: '2020-08-20 18:46:48'
categories:
- centos
---

Hostname merupakan nama dari VM, untuk mengatur hostname di CentOS Anda hanya perlu menjalakan satu bari perintah saja.

Perhatikan gambar dibawah ini

<figure class="wp-block-image size-large"><img loading="lazy" width="750" height="301" src="/content/images/wordpress/2020/08/image-3.png" alt="" class="wp-image-62" srcset="/content/images/wordpress/2020/08/image-3.png 750w, /content/images/wordpress/2020/08/image-3-300x120.png 300w" sizes="(max-width: 750px) 100vw, 750px"></figure>

Gambar diatas hostname nya yaitu _hamim-imapsync.neo.internal_ untuk mengubah hostname tersebut jalankan satu baris perintah berikut

_`# hostnamectl set-hostname tutorial.nurhamim.my.id`_

<figure class="wp-block-image size-large"><img loading="lazy" width="844" height="297" src="/content/images/wordpress/2020/08/image-4.png" alt="" class="wp-image-63" srcset="/content/images/wordpress/2020/08/image-4.png 844w, /content/images/wordpress/2020/08/image-4-300x106.png 300w, /content/images/wordpress/2020/08/image-4-768x270.png 768w" sizes="(max-width: 844px) 100vw, 844px"></figure>

Saat ini hostname telah diubah.

Selamat mencoba 😁