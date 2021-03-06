---
author: nurhamim
layout: post
title: 'Openstack: Membuat Image via CLI'
description: 'Openstack adalah sebuah platform cloud yang terdiri dari software open source untuk menjalankan Cloud IaaS (Infrastructure as a Service), baik untuk private ataupun public Cloud'
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/d12.png'
featured: true
date: '2020-10-30 01:44:45'
categories:
- openstack
---

**[Belajar Linux ID](/)** – Pada tutorial kali ini kita akan mencoba mempelajari command line yang ada di openstack, disini kita akan memulai mencoba membuat image via CLI (Command Line Interface).

Sebenarnya untuk membuat image di openstack juga dapat melalui dashboard openstack atau sering disebut _Horizon_.

Namun tidak ada salah nya kita mengetahui 2 cara baik melalui CLI ataupun Horizon, untuk cara membuat image melaui horizon Anda dapat melihatnya pada link berikut: [Openstack: Upload Image atau ISO](/openstack-upload-image-atau-iso/)

Berikut tahapan – tahapannya:

Silakan login ke Openstack controller Anda, dan login ke _RC Admin_ atau _keystonerc\_admin_ yang berada di _ **/root** _.

    [root@hamim-controller ~]# source keystonerc_admin

Untuk melihat tabel image di openstack jalankan perintah berikut

    [root@hamim-controller ~(keystone_admin)]#
    [root@hamim-controller ~(keystone_admin)]# openstack image list
    +--------------------------------------+---------------------+--------+
    | ID | Name | Status |
    +--------------------------------------+---------------------+--------+
    | 95300085-0483-4a77-800a-1f3ed015a6a7 | cirros-0.5.1-x86_64 | active |
    +--------------------------------------+---------------------+--------+
    [root@hamim-controller ~(keystone_admin)]#

Disini kami coba mengunggah kembali image cirros menggunakan wget seperti berikut

    [root@hamim-controller ~(keystone_admin)]#
    [root@hamim-controller ~(keystone_admin)]# wget -c https://download.cirros-cloud.net/0.5.1/cirros-0.5.1-x86_64-disk.img

Create image cirros dengan memberi nama image menjadi _cirros1_

    [root@hamim-controller ~(keystone_admin)]#
    [root@hamim-controller ~(keystone_admin)]# openstack image create --disk-format qcow2 --file cirros-0.5.1-x86_64-disk.img --protected --public cirros1
    +------------------+------------------------------------------------------+
    | Field | Value |
    +------------------+------------------------------------------------------+
    | checksum | 1d3062cd89af34e419f7100277f38b2b |
    | container_format | bare |
    | created_at | 2020-09-24T11:04:48Z |
    | disk_format | qcow2 |
    | file | /v2/images/3a132731-4f54-409c-bafe-121010959fe5/file |
    | id | 3a132731-4f54-409c-bafe-121010959fe5 |
    | min_disk | 0 |
    | min_ram | 0 |
    | name | cirros1 |
    | owner | 99f200eba89b49a9b89a981ec76813e1 |
    | protected | True |
    | schema | /v2/schemas/image |
    | size | 16338944 |
    | status | active |
    | categories | |
    | updated_at | 2020-09-24T11:04:48Z |
    | virtual_size | None |
    | visibility | public |
    +------------------+------------------------------------------------------+
    [root@hamim-controller ~(keystone_admin)]#

Lihat tabel image yang sudah kita buat

    [root@hamim-controller ~(keystone_admin)]#
    [root@hamim-controller ~(keystone_admin)]# openstack image list
    +--------------------------------------+---------------------+--------+
    | ID | Name | Status |
    +--------------------------------------+---------------------+--------+
    | 95300085-0483-4a77-800a-1f3ed015a6a7 | cirros-0.5.1-x86_64 | active |
    | 3a132731-4f54-409c-bafe-121010959fe5 | cirros1 | active |
    +--------------------------------------+---------------------+--------+
    [root@hamim-controller ~(keystone_admin)]#

Saat ini sudah ada 2 buah image cirros dengan nama image yang berbeda, selanjutnya kita akan mencoba membuat image dengan OS CentOS 7.

Silakan unduh terlebih dahulu image qcow CentOS 7 menggunakan wget seperti berikut.

    [root@hamim-controller ~(keystone_admin)]#
    [root@hamim-controller ~(keystone_admin)]# wget -c http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2

Buat image CentOS 7, berikut perintahnya:

    [root@hamim-controller ~(keystone_admin)]# openstack image create CentOS7 --public --disk-format qcow2 --container-format bare --file CentOS-7-x86_64-GenericCloud.qcow2
    +------------------+------------------------------------------------------+
    | Field | Value |
    +------------------+------------------------------------------------------+
    | checksum | ef7f109590094e37c54aead73f3cdedc |
    | container_format | bare |
    | created_at | 2020-09-24T12:05:34Z |
    | disk_format | qcow2 |
    | file | /v2/images/6dc06b96-e0ff-4755-aa70-0fec3a05a856/file |
    | id | 6dc06b96-e0ff-4755-aa70-0fec3a05a856 |
    | min_disk | 0 |
    | min_ram | 0 |
    | name | CentOS7 |
    | owner | 99f200eba89b49a9b89a981ec76813e1 |
    | protected | False |
    | schema | /v2/schemas/image |
    | size | 858783744 |
    | status | active |
    | categories | |
    | updated_at | 2020-09-24T12:05:42Z |
    | virtual_size | None |
    | visibility | public |
    +------------------+------------------------------------------------------+
    [root@hamim-controller ~(keystone_admin)]#

Silakan dilihat kembali tabel list image yang sudah Anda buat

    [root@hamim-controller ~(keystone_admin)]#
    [root@hamim-controller ~(keystone_admin)]# openstack image list
    +--------------------------------------+---------------------+--------+
    | ID | Name | Status |
    +--------------------------------------+---------------------+--------+
    | 6dc06b96-e0ff-4755-aa70-0fec3a05a856 | CentOS7 | active |
    | 95300085-0483-4a77-800a-1f3ed015a6a7 | cirros-0.5.1-x86_64 | active |
    | 3a132731-4f54-409c-bafe-121010959fe5 | cirros1 | active |
    +--------------------------------------+---------------------+--------+
    [root@hamim-controller ~(keystone_admin)]#

Terlihat diatas sudah ada 3 buah image diantaranya 2 image cirros dan 1 image CentOS 7.

Selamat mencoba 😁