---
author: nurhamim
layout: post
title: 'Openstack: Menambahkan SSH Key'
description: 'Openstack adalah sebuah platform cloud yang terdiri dari software open source untuk menjalankan Cloud IaaS (Infrastructure as a Service), baik untuk private ataupun public Cloud'
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/d9.png'
featured: true
date: '2020-10-25 19:44:52'
categories:
- openstack
---

[Belajar Linux ID](/) – Pada tutorial kali ini kita akan menambahkan SSH Key di openstack. Di openstack untuk menambahkan SSH Key dapat melalui CLI ataupun Horizon, disini kami contohkan menggunakan Horizon.

Login ke _Horizon \>\> Compute \>\> Key Pairs_

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="323" src="/content/images/wordpress/2020/10/1-5-1024x323.png" alt="" class="wp-image-725" srcset="/content/images/wordpress/2020/10/1-5-1024x323.png 1024w, /content/images/wordpress/2020/10/1-5-300x95.png 300w, /content/images/wordpress/2020/10/1-5-768x242.png 768w, /content/images/wordpress/2020/10/1-5.png 1364w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Terdapat 2 pemilihan terkait SSH Key diantaranya:

1. Import Public Key: Jika Anda sudah mempunyai public key pribadi Anda dapat upload public key nya tanpa create key baru. 
2. Create Key Pair: Anda dapat membuat keypair baru dan keypair ini akan Anda gunakan untuk login ke instance

Berikut kami berikan contoh masing – masing pilihan diatas: Import Public Key.

- **_Import Public Key_**

Silakan klik menu **Import Public Key** lalu berikan nama key Anda dan isi public key Anda contoh nya seperti gambar dibawah lalu klik Import Public Key

<figure class="wp-block-image size-large"><img loading="lazy" width="957" height="470" src="/content/images/wordpress/2020/10/2-6.png" alt="" class="wp-image-726" srcset="/content/images/wordpress/2020/10/2-6.png 957w, /content/images/wordpress/2020/10/2-6-300x147.png 300w, /content/images/wordpress/2020/10/2-6-768x377.png 768w" sizes="(max-width: 957px) 100vw, 957px"></figure>

Jika berhasil akan nampak seperti berikut ini

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="334" src="/content/images/wordpress/2020/10/3-4-1024x334.png" alt="" class="wp-image-727" srcset="/content/images/wordpress/2020/10/3-4-1024x334.png 1024w, /content/images/wordpress/2020/10/3-4-300x98.png 300w, /content/images/wordpress/2020/10/3-4-768x251.png 768w, /content/images/wordpress/2020/10/3-4.png 1366w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>
- **_Create Key Pair_**

Silakan Klik pada **Create Key Pair** lalu isi nama keypair yang Anda inginkan

<figure class="wp-block-image size-large"><img loading="lazy" width="959" height="214" src="/content/images/wordpress/2020/10/4-3.png" alt="" class="wp-image-728" srcset="/content/images/wordpress/2020/10/4-3.png 959w, /content/images/wordpress/2020/10/4-3-300x67.png 300w, /content/images/wordpress/2020/10/4-3-768x171.png 768w" sizes="(max-width: 959px) 100vw, 959px"></figure>

Pada gambar diatas silakan klik **Create Key Pair,** setelah nya akan muncul pop seperti Anda, silakan download key pair nya.

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="407" src="/content/images/wordpress/2020/10/5-4-1024x407.png" alt="" class="wp-image-729" srcset="/content/images/wordpress/2020/10/5-4-1024x407.png 1024w, /content/images/wordpress/2020/10/5-4-300x119.png 300w, /content/images/wordpress/2020/10/5-4-768x305.png 768w, /content/images/wordpress/2020/10/5-4.png 1365w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Selamat mencoba 😁