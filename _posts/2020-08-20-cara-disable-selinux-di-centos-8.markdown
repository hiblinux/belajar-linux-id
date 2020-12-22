---
author: nurhamim
layout: post
title: Cara Disable SELinux di CentOS 8
description: 'Security Enhanced Linux atau SELinux adalah mekanisme keamanan yang dibangun di dalam kernel Linux yang digunakan oleh distribusi berbasis RHEL'
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/a5.png'
featured: true
date: '2020-08-20 22:03:06'
categories:
- centos
- linux
---

Security Enhanced Linux atau SELinux adalah mekanisme keamanan yang dibangun di dalam kernel Linux yang digunakan oleh distribusi berbasis RHEL.

SELinux menambahkan lapisan keamanan tambahan ke sistem dengan mengizinkan administrator dan pengguna untuk mengontrol akses ke objek berdasarkan aturan kebijakan.

Aturan kebijakan SELinux menentukan bagaimana proses dan pengguna berinteraksi satu sama lain serta bagaimana proses dan pengguna berinteraksi dengan file. Ketika tidak ada aturan yang secara eksplisit mengizinkan akses ke suatu objek, seperti untuk proses membuka file, akses ditolak.

SELinux memiliki tiga mode operasi:

1. _ **Enforcing:** SELinux memungkinkan akses berdasarkan aturan kebijakan SELinux._
2. _ **Permissive:** SELinux hanya mencatat tindakan yang akan ditolak jika berjalan dalam mode enforcing. Mode ini berguna untuk men-debug dan membuat aturan kebijakan baru._
3. _ **Disabled:** Tidak ada kebijakan SELinux yang dimuat, dan tidak ada pesan yang dicatat._

Secara default di CentOS 8, SELinux diaktifkan dan dalam mode enforcing. Sangat disarankan untuk menjaga SELinux dalam mode enforcing. Namun, terkadang hal itu dapat mengganggu fungsi beberapa aplikasi, dan Anda perlu mengaturnya ke mode permissive atau menonaktifkannya sepenuhnya (mode disabled)  
  
Untuk melihat status SELinux gunakan perintah _ **sestatus** _ seperti berikut

    [root@tutorial ~]#
    [root@tutorial ~]# sestatus
    SELinux status: enabled
    SELinuxfs mount: /sys/fs/selinux
    SELinux root directory: /etc/selinux
    Loaded policy name: targeted
    Current mode: enforcing
    Mode from config file: enforcing
    Policy MLS status: enabled
    Policy deny_unknown status: allowed
    Memory protection checking: actual (secure)
    Max kernel policy version: 31
    [root@tutorial ~]#

Untuk menonaktifkan SELinux silakan buka file config SELinux berikut

    [root@tutorial ~]#
    [root@tutorial ~]# vim /etc/selinux/config

Ubah value SELinux menjadi **disabled** lalu simpan file config SELinux

<figure class="wp-block-image size-large"><img loading="lazy" width="869" height="282" src="/content/images/wordpress/2020/08/image-15.png" alt="" class="wp-image-86" srcset="/content/images/wordpress/2020/08/image-15.png 869w, /content/images/wordpress/2020/08/image-15-300x97.png 300w, /content/images/wordpress/2020/08/image-15-768x249.png 768w" sizes="(max-width: 869px) 100vw, 869px"></figure>

Jika sudah silakan reboot pada instance atau VM CentOS 8

    [root@tutorial ~]# reboot

Pastikan SELinux sudah disabled

    [root@tutorial ~]# sestatus
    SELinux status: disabled
    [root@tutorial ~]#

Saat ini SELinux sudah disabled.

Selamat mencoba 😄