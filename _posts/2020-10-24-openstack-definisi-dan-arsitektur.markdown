---
author: nurhamim
layout: post
title: 'Openstack: Definisi dan  Arsitektur'
description: 'Openstack adalah sebuah platform cloud yang terdiri dari software open source untuk menjalankan Cloud IaaS (Infrastructure as a Service), baik untuk private ataupun public Cloud'
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/d1.png'
featured: true
date: '2020-10-24 18:09:19'
categories:
- openstack
---

**[Belajar Linux ID](/)** – Sebelum masuk ke pembahasan inti, ada baiknya kita mengetahui terlebih dahulu singkat cerita adanya Openstack. Openstack merupakan sebuah project open source yang dikembangkan oleh Rackspace dan NASA sejakt tahun 2010. Openstack sendiri dapat digunakan untuk cloud public ataupun private cloud. Openstack relatif lebih mudah jika dibandingkan dengan cloud yang lain seperti CloudStack atau OpenNebula.

### Definisi Openstack

Openstack adalah sebuah platform cloud yang terdiri dari software open source untuk menjalankan Cloud IaaS (Infrastructure as a Service), baik untuk private ataupun public Cloud.

Openstack mempunyai kemampuan skalabilitas yang lebih besar dibandingkan kerangka kerja awan lainnya. Tujuan Openstack adalah untuk memungkinkan setiap organisasi atau perusahaan (penyedia Cloud) misalnya membuat dan menyediakan layanan komputasi awan dengan menggunakan perangkat lunak open source yang berjalan di atas perangkat keras ideal nya di bare metal.

Namun openstack juga dapat dijalankan di VM (Virtual Machine) oleh karena itu jika ingin belajar Openstack dapat menggunakan VM.

## Arsitektur Openstack

<figure class="aligncenter size-large"><img loading="lazy" width="1024" height="630" src="/content/images/wordpress/2020/10/openstack1-1024x630.png" alt="" class="wp-image-663" srcset="/content/images/wordpress/2020/10/openstack1-1024x630.png 1024w, /content/images/wordpress/2020/10/openstack1-300x185.png 300w, /content/images/wordpress/2020/10/openstack1-768x473.png 768w, /content/images/wordpress/2020/10/openstack1.png 1300w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Openstack dirancang dengan sistem arsitektur _modular,_ yang terdiri dari beberapa komponen berikut:

<figure class="wp-block-image size-large"><img loading="lazy" width="720" height="405" src="/content/images/wordpress/2020/10/openstack-2.jpg" alt="" class="wp-image-664" srcset="/content/images/wordpress/2020/10/openstack-2.jpg 720w, /content/images/wordpress/2020/10/openstack-2-300x169.jpg 300w" sizes="(max-width: 720px) 100vw, 720px"></figure>
- **Horizon – OpenStack Dashboard:** Merupakan dashboard atau portal yang dapat di kelola oleh administrator ataupun useruntuk dapat digunakan sebagai manajemen sistem Openstack. Mulai dari membuat instance/vm (nova), membuat subnet, vrouter (neutron) dan konfigurasi akses kontrol.  
- **Nova – OpenStack Compute (komputasi):** Digunakan untuk mengontrol vm atau mengelola resources hypervisor untuk menyediakan vm, spanwning, penjadwalan dan dekomisioning pada virtual machine on demand  
- **Neutron – OpenStack Networking (jaringan):** Sebuah sistem untuk mengelola jaringan dan IP Address pada platform openstack, dan memberikan kemampuan self-service ke sisi pengguna sampai ke level konfigurasi jaringan. Neutron juga berfungsi menghubungkan instance(vm) untuk bisa terhubung ke real network, router, firewall, load balancing dan VPN. untuk management yang lebih canggih neutron juga dapat dihubungkan dengan SDN (Software Defined Networking) seperti Openflow untuk mendukung multi tenancy dalam skala besar.  
- **Swift – OpenStack Object Storage (penyimpan)**: Merupakan komponen Object Storage pada Openstack. Swift dapat menyimpan dan menerima data yang sangat banyak dan dapat di-scale dengan mudah. Switch ideal untuk menyimpan data tidak terstruktur yang dapat berkembang tanpa batas.  
- **Cinder – OpenStack Block Storage (penyimpan blok)**: Cinder menyediakan layanan penyimpanan blok (persistent) untuk digunakan oleh compute instances. Cinder didesain untuk bekerja-sama dengan komponen OpenStack, terutama compute dan dashboard. Cinder memungkinkan admin atau pengguna untuk mengatur kebutuhan terhadap media penyimpan dan dapat digunakan untuk skenario-skenario pemakaian yg sensitif atau yg membutuhkan kinerja tinggi seperti: penyimpan database, expandable file systems, akses raw pada penyimpan blok, snapshot management untuk backup atau restorasi.  
- **Keystone – OpenStack Identity (layanan identitas)**: Digunakan sebagai layanan pusat untuk autentikasi dan autorisasi untuk manajemen user, project, dan tenant.  
- **Glance – OpenStack Image** : Merupakan layanan yang bertugas untuk manajemen image. Ketika sebuah instance akan di-launch maka image yang digunakan akan mengambil dari image (pre-installed) yang terdapat di recources glance. Dengan kata lain, layanan ini berfungsi sebagai tempat menampung image VM dan bisa juga volume shapshoot.  
- **Ceilometer – OpenStack Telemetry (billing)**: Biasanya bertugas untuk menghitung trafik measurements of cloud resources  
- **Heat – OpenStack Orchestration** : Sebuah template-based orchestration engine yang mendukung pembuatan resource stack secara otomatis.  
- **Trove – OpenStack Database** : Merupakan layanan database yang mengijinkan user untuk memilih, menyediakan, menjalankan dan administatif dari relasi database dan non-relasi database.

Itulah beberapa pengetahuan tentang openstack, selanjutnya Anda dapat eksplore secara mandiri mengenai Openstack.   
  
Referensi:   
– [OpenStack Architecture Design Guide](https://docs.openstack.org/arch-design/)  
– [Wikipedia Openstack](https://en.wikipedia.org/wiki/OpenStack)