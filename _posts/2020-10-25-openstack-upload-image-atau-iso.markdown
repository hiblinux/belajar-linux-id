---
author: nurhamim
layout: post
title: 'Openstack: Upload Image atau ISO'
description: 'Openstack adalah sebuah platform cloud yang terdiri dari software open source untuk menjalankan Cloud IaaS (Infrastructure as a Service), baik untuk private ataupun public Cloud'
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/d6.png'
featured: true
date: '2020-10-25 17:06:29'
categories:
- openstack
---

[Belajar Linux ID](/) – Pada tutorial kali ini kita akan membahas bagaimana cara melakukan upload image atau ISO di openstack dan tutorial kali salah satu kelanjutan dari tutorial sebelumnya mengenai instalaasi openstack di VM baik all in one atau multi node yang dapat Anda lihat pada link berikut:

- [Openstack: Install Openstack All-in-One with Packstack](/openstack-02-install-openstack-all-in-one-with-packstack/)
- [Openstack: Install Openstack Queens Multi-Node Part 1](/openstack-install-openstack-queens-multi-node-part-1/)
- [Openstack: Install Openstack Queens Multi-Node Part 2](/openstack-install-openstack-queens-multi-node-part-2/)
- [Openstack: Install Openstack Queens Multi-Node Part 3](/openstack-install-openstack-queens-multi-node-part-3/)

Untuk upload image atau iso di openstack terdapat 2 cara yang dapat dilakukan yaitu melalui horizon (melalui web) atau CLI.

Disini kami berikan contoh melalui horizon terlebih dahulu, sebelum melakukan upload image atau iso pastikan Anda sudah mengunguh image nya terlebih dahulu berikut link jika menggunakan Ubuntu, CentOS dan Cirros

- [Ubuntu Cloud Images](https://cloud-images.ubuntu.com/)
- [CentOS Cloud Images](https://cloud.centos.org/centos/)
- [Cirros](https://download.cirros-cloud.net/)

Pada tutorial kali ini kami contohkan upload image atau iso menggunakan cirros, silakan login Horizon \>\> Admin \>\> Compute \>\> Images \>\> Create Images

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="374" src="/content/images/wordpress/2020/10/1-2-1024x374.png" alt="" class="wp-image-696" srcset="/content/images/wordpress/2020/10/1-2-1024x374.png 1024w, /content/images/wordpress/2020/10/1-2-300x109.png 300w, /content/images/wordpress/2020/10/1-2-768x280.png 768w, /content/images/wordpress/2020/10/1-2.png 1357w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Selanjutnya, isi _Image Name_ dengan nama image yang Anda inginkan dan klik _Browser_ \>\> _Upload Image_ _\>\> Format (QCOW2 – QEMU Emulator)_ _\>\> Klik Create Image_

<figure class="wp-block-image size-large"><img loading="lazy" width="959" height="455" src="/content/images/wordpress/2020/10/2-3.png" alt="" class="wp-image-697" srcset="/content/images/wordpress/2020/10/2-3.png 959w, /content/images/wordpress/2020/10/2-3-300x142.png 300w, /content/images/wordpress/2020/10/2-3-768x364.png 768w" sizes="(max-width: 959px) 100vw, 959px"></figure>

Tunggu proses upload image sampai selesai dimana proses ini membutuhkan waktu bergantung besaran size image yang Anda upload.

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="301" src="/content/images/wordpress/2020/10/3-1-1024x301.png" alt="" class="wp-image-698" srcset="/content/images/wordpress/2020/10/3-1-1024x301.png 1024w, /content/images/wordpress/2020/10/3-1-300x88.png 300w, /content/images/wordpress/2020/10/3-1-768x226.png 768w, /content/images/wordpress/2020/10/3-1.png 1361w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Jika sudah, hasilnya seperti gambar diatas dimana di menu images sudah ada images cirros yang Anda upload.

Selamat mencoba 😁