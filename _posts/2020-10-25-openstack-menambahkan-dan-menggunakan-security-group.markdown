---
author: nurhamim
layout: post
title: 'Openstack: Menambah dan Menggunakan Security Group'
description: 'Openstack adalah sebuah platform cloud yang terdiri dari software open source untuk menjalankan Cloud IaaS (Infrastructure as a Service), baik untuk private ataupun public Cloud'
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/d10.png'
featured: true
date: '2020-10-25 20:52:36'
categories:
- openstack
---

[Belajar Linux ID](/) – Pada tutorial kali ini kita akan membahas mengenai Security Group. Security group merupakan firewall yang ada di openstack.

Untuk membuat dan menggunakan security group dapat melalui horizon atau via CLI. Disini kami akan menggunakan horizon untuk menambahkan security group, berikut tahapannya:

_Login Horizon \>\> Project \>\> Network \>\> Security Group \>\> +Create Security Group_

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="382" src="/content/images/wordpress/2020/10/1-7-1024x382.png" alt="" class="wp-image-741" srcset="/content/images/wordpress/2020/10/1-7-1024x382.png 1024w, /content/images/wordpress/2020/10/1-7-300x112.png 300w, /content/images/wordpress/2020/10/1-7-768x287.png 768w, /content/images/wordpress/2020/10/1-7.png 1366w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Isi nama security group Anda lalu klik **Create Security Group**

<figure class="wp-block-image size-large"><img loading="lazy" width="735" height="359" src="/content/images/wordpress/2020/10/2-8.png" alt="" class="wp-image-742" srcset="/content/images/wordpress/2020/10/2-8.png 735w, /content/images/wordpress/2020/10/2-8-300x147.png 300w" sizes="(max-width: 735px) 100vw, 735px"></figure>

Saat ini security grouup sudah berhasil di buat

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="382" src="/content/images/wordpress/2020/10/3-6-1024x382.png" alt="" class="wp-image-743" srcset="/content/images/wordpress/2020/10/3-6-1024x382.png 1024w, /content/images/wordpress/2020/10/3-6-300x112.png 300w, /content/images/wordpress/2020/10/3-6-768x286.png 768w, /content/images/wordpress/2020/10/3-6.png 1365w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Gambar diatas terdapat 2 security group (default) dan security group yang sudah dibuat sebelumnya.

Untuk yang default sebenarnya dapat Anda gunakan juga. Untuk menambahkan port atau menggunakan security group silakan klik menu **Manage Rules** pada security group Anda

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="382" src="/content/images/wordpress/2020/10/4-5-1024x382.png" alt="" class="wp-image-744" srcset="/content/images/wordpress/2020/10/4-5-1024x382.png 1024w, /content/images/wordpress/2020/10/4-5-300x112.png 300w, /content/images/wordpress/2020/10/4-5-768x287.png 768w, /content/images/wordpress/2020/10/4-5.png 1366w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Klik **+ Add Rule** untuk menambahkan rule atau port yang ingin Anda gunakan, misalnya disini kami ingin allow port atau protokol IMCP, lalu klik **Add**

<figure class="wp-block-image size-large"><img loading="lazy" width="726" height="543" src="/content/images/wordpress/2020/10/5-6.png" alt="" class="wp-image-745" srcset="/content/images/wordpress/2020/10/5-6.png 726w, /content/images/wordpress/2020/10/5-6-300x224.png 300w" sizes="(max-width: 726px) 100vw, 726px"></figure>

Saat ini rule ICMP sudah dibuat

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="429" src="/content/images/wordpress/2020/10/6-3-1024x429.png" alt="" class="wp-image-746" srcset="/content/images/wordpress/2020/10/6-3-1024x429.png 1024w, /content/images/wordpress/2020/10/6-3-300x126.png 300w, /content/images/wordpress/2020/10/6-3-768x322.png 768w, /content/images/wordpress/2020/10/6-3.png 1364w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Anda dapat menambahkan rule atau port – port yang Anda inginkan misalnya port ssh, imap, http dan yang lainnya melalui security group ini.

Selamat mencoba 😁