---
title: Cara Hapus Cluster di Proxmox Mail Gateway
description: 'Proxmox Mail Gateway merupakan solusi keamanan email sumber terbuka (open source) terkemuka yang dapat membantu Anda melindungi server email Anda dari semua ancaman email.'
lang: id_ID
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/cover-hapus-cluster-pmg.png'
categories:
  - proxmox-mail-gateway
---

Tutorial ini salah satu dari experiment penulis dimana mencoba cluster dan menghapus cluster karena masih dalam uji coba mempelajari skema cluster dari proxmox mail gateway. 

Ternyata untuk menghapus sebuah cluster atau node cluster di proxmox mail gateway itu cukup mudah, berikut merupakan contoh dan tahapan bagaimana menghapus cluster di proxmox mail gateway. 

Tahapan pertama yang perlu dilakukan yaitu login SSH ke proxmox mail gateway, kemudian lihat list node cluster yang Ada. 

Untuk melihat list cluster bisa melalui dashboard proxmox mal gateway atau bisa juga melalui command line interface proxmox mail gateway. 

- Dari sisi Dashboard Proxmox Mail Gateway

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/cluster-pmg-1.png)

- Menggunakan CLI Proxmox Mail Gateway

```bash
root@pmg:~#
root@pmg:~# pmgcm status
NAME(CID)--------------IPADDRESS----ROLE-STATE---------UPTIME---LOAD----MEM---DISK
pmg(1)               20.20.20.104    master A    9 days 00:54   0.03    93%     6%
root@pmg:~#
root@pmg:~#
```

Untuk menhapus cluster Anda dapat rename atau delete konfigurasi cluster menggunakan command berikut: 

```bash
root@pmg:~# rm -rf /etc/pmg/cluster.conf
root@pmg:~# pmgcm status
no cluster defined
root@pmg:~#
```

Terlihat diatas untuk status cluster sudah tidak tersedia dan jika dilihat di dahsboard juga sudah tidak ada cluster

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/cluster-pmg-2.png)

Selamat mencoba 😁

Referensi: [Remove Cluster with one only node](https://forum.proxmox.com/threads/remove-cluster-with-one-only-node.68283/)
