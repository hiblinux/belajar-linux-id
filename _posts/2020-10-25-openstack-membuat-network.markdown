---
author: nurhamim
layout: post
title: 'Openstack: Membuat Network'
description: 'Openstack adalah sebuah platform cloud yang terdiri dari software open source untuk menjalankan Cloud IaaS (Infrastructure as a Service), baik untuk private ataupun public Cloud'
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/d7.png'
featured: true
date: '2020-10-25 17:53:29'
categories:
- openstack
---

[Belajar Linux ID](/) – Pada tutorial kali ini merupakan kelanjutan dari tutorial kami sebelumnya mengenai bagaimana cara upload image di openstack, berikut: [Openstack: Upload Image atau ISO](/openstack-upload-image-atau-iso/)

Di tutorial kali ini kita akan membuat 2 jenis network yaitu network external dan network internal perbedaannya:  
  
– **Network External:** Network yang tersambung keluar (node controller dan compute).  
– **Network internal:** Network yang akan terhubung dan digunakan oleh instance/vm.

Berikut tahapan – tahapan membuat nya:

_Login Horizon \>\> Admin \>\> Network \>\> Networks \>\> Create Network_

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="348" src="/content/images/wordpress/2020/10/1-3-1024x348.png" alt="" class="wp-image-701" srcset="/content/images/wordpress/2020/10/1-3-1024x348.png 1024w, /content/images/wordpress/2020/10/1-3-300x102.png 300w, /content/images/wordpress/2020/10/1-3-768x261.png 768w, /content/images/wordpress/2020/10/1-3.png 1366w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Pada menu **_Network_** isi sebagai berikut:

<figure class="wp-block-image size-large"><img loading="lazy" width="732" height="633" src="/content/images/wordpress/2020/10/2-4.png" alt="" class="wp-image-702" srcset="/content/images/wordpress/2020/10/2-4.png 732w, /content/images/wordpress/2020/10/2-4-300x259.png 300w" sizes="(max-width: 732px) 100vw, 732px"></figure>

_Name: Name network (isi sesuai keinginan  
Project: Admin  
Provider Network Type: Flat  
Physical Network: extnet_    
  
Selanjutnya pindah ke menu **_Subnet_** , silakan isi nama subnet Anda, dan isi juga network untuk network **net-ext**

<figure class="wp-block-image size-large"><img loading="lazy" width="729" height="511" src="/content/images/wordpress/2020/10/3-2.png" alt="" class="wp-image-703" srcset="/content/images/wordpress/2020/10/3-2.png 729w, /content/images/wordpress/2020/10/3-2-300x210.png 300w" sizes="(max-width: 729px) 100vw, 729px"></figure>

Pada menu _ **Subnet Details** _ silakan isi ip pool yang ingin Anda gunakan dari network address diatas, jika sudah silakan klik _Create_

<figure class="wp-block-image size-large"><img loading="lazy" width="730" height="631" src="/content/images/wordpress/2020/10/4-1.png" alt="" class="wp-image-704" srcset="/content/images/wordpress/2020/10/4-1.png 730w, /content/images/wordpress/2020/10/4-1-300x259.png 300w" sizes="(max-width: 730px) 100vw, 730px"></figure>

Tunggu proses pembuatan network selesai dan lihat hasilnya seperti berikut

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="301" src="/content/images/wordpress/2020/10/5-1-1024x301.png" alt="" class="wp-image-705" srcset="/content/images/wordpress/2020/10/5-1-1024x301.png 1024w, /content/images/wordpress/2020/10/5-1-300x88.png 300w, /content/images/wordpress/2020/10/5-1-768x226.png 768w, /content/images/wordpress/2020/10/5-1.png 1364w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Saat ini external network sudah berhasil dibuat, selanjutnya create internal network seperti berikut:

_Login Horizon \>\> Project \>\> Network \>\> Networks \>\> Create Network_

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="300" src="/content/images/wordpress/2020/10/6-1024x300.png" alt="" class="wp-image-707" srcset="/content/images/wordpress/2020/10/6-1024x300.png 1024w, /content/images/wordpress/2020/10/6-300x88.png 300w, /content/images/wordpress/2020/10/6-768x225.png 768w, /content/images/wordpress/2020/10/6.png 1364w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Pada menu **Network** isikan nama network Anda

<figure class="wp-block-image size-large"><img loading="lazy" width="730" height="474" src="/content/images/wordpress/2020/10/7.png" alt="" class="wp-image-708" srcset="/content/images/wordpress/2020/10/7.png 730w, /content/images/wordpress/2020/10/7-300x195.png 300w" sizes="(max-width: 730px) 100vw, 730px"></figure>

Pindah ke menu subnet untuk menentukan ip address dan subnet nya

<figure class="wp-block-image size-large"><img loading="lazy" width="728" height="512" src="/content/images/wordpress/2020/10/8.png" alt="" class="wp-image-709" srcset="/content/images/wordpress/2020/10/8.png 728w, /content/images/wordpress/2020/10/8-300x211.png 300w" sizes="(max-width: 728px) 100vw, 728px"></figure>

Pada menu Subnet Details, silakan isi pool network yang ingin digunakan dari range ip address diatas lalu klik _ **Create** _ untuk membuat network internal

<figure class="wp-block-image size-large"><img loading="lazy" width="731" height="634" src="/content/images/wordpress/2020/10/9.png" alt="" class="wp-image-710" srcset="/content/images/wordpress/2020/10/9.png 731w, /content/images/wordpress/2020/10/9-300x260.png 300w" sizes="(max-width: 731px) 100vw, 731px"></figure>

Tunggu proses pembuatan network internal dan jika berhasil akan nampak seperti berikut

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="326" src="/content/images/wordpress/2020/10/10-1024x326.png" alt="" class="wp-image-711" srcset="/content/images/wordpress/2020/10/10-1024x326.png 1024w, /content/images/wordpress/2020/10/10-300x96.png 300w, /content/images/wordpress/2020/10/10-768x245.png 768w, /content/images/wordpress/2020/10/10.png 1359w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Saat ini kita sudah mempunyai 2 network, internal dan external.

Selamat mencoba 😁