---
author: leon
layout: post
title: 'Ubuntu: Instalasi Webserver Apache di Ubuntu 20.04'
description: 'Untuk melakukan instalasi Web server Apache di Ubuntu sangat mudah'
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/5.png'
featured: true
date: '2020-11-15 06:19:25'
categories:
- ubuntu
- apache
- linux
---

Pada kesempatan kali ini, saya ingin berbagi informasi seputar langkah konfigurasi tool pada sistem operasi Ubuntu lebih detailnya untuk **Instalasi Webserver Apache di Ubuntu 20.04.**

**Update repository pada server**

Langkah pertama yang perlu dilakukan sebelum melakukan instalasi Apache pada Ubuntu adalah melakukan update repository pada server, berikut perintahnya:

<!--kg-card-begin: markdown-->

`$ sudo apt update`

<!--kg-card-end: markdown--><figure class="kg-card kg-image-card"><img src="/content/images/2020/11/image-17.png" class="kg-image" alt></figure><!--kg-card-begin: html--><script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script><ins class="adsbygoogle" style="display:block; text-align:center;" data-ad-layout="in-article" data-ad-format="fluid" data-ad-client="ca-pub-1515372853161377" data-ad-slot="4684565489"></ins><script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script><!--kg-card-end: html-->

**Instalasi paket Apache**

Setelah dilakukan update repository, maka agar paket Apache dapat dijalankan perlu dilakukan instalasi paket terlebih dahulu pada server, berikut perintahnya:

<!--kg-card-begin: markdown-->

`$ sudo apt install apache2`

<!--kg-card-end: markdown--><figure class="kg-card kg-image-card"><img src="/content/images/2020/11/image-18.png" class="kg-image" alt srcset="/content/images/size/w600/2020/11/image-18.png 600w, /content/images/2020/11/image-18.png 997w" sizes="(min-width: 720px) 720px"></figure>

**Aktifkan dan jalankan service Apache Webserver**

Selanjutnya service Apache perlu diaktifkan terlebih dahulu sebelum dapat dijalankan, berikut adalah perintahnya:

`$ sudo systemctl enable apache2`   
`$ sudo systemct start apache2`

<figure class="kg-card kg-image-card"><img src="/content/images/2020/11/image-19.png" class="kg-image" alt srcset="/content/images/size/w600/2020/11/image-19.png 600w, /content/images/2020/11/image-19.png 772w" sizes="(min-width: 720px) 720px"></figure>

**Tes akses melalui browser**

Buka browser dan masukan http://ip-address-server pada kolom URL.

<figure class="kg-card kg-image-card"><img src="/content/images/2020/11/image-20.png" class="kg-image" alt srcset="/content/images/size/w600/2020/11/image-20.png 600w, /content/images/size/w1000/2020/11/image-20.png 1000w, /content/images/2020/11/image-20.png 1291w" sizes="(min-width: 720px) 720px"></figure>

**Selesai**

Sekian dulu langkah **Instalasi Webserver Apache di Ubuntu 20.04** , semoga bermanfaat bagi pengunjung blog ini.

