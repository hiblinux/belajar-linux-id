---
title: Mengenal Tentang LXC/LXD
description: 'Linux Container kepanjangan dari LXC merupakan suatu metode virtualisasi level sistem operasi linux untuk menjalankan beberapa sistem linux yang terisolasi pada satu host'
lang: id_ID
date: 2020-12-25 22:48 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/cover-lxd.png'
categories: 
 - LXC/LCD
 - Linux Container
---

**Linux Container** kepanjangan dari LXC merupakan suatu metode virtualisasi level sistem operasi linux untuk menjalankan beberapa sistem linux yang terisolasi pada satu host. 

LXC mengandalkan Linux cgroups [Grup Kontrol/cgroups](https://en.wikipedia.org/wiki/Cgroups) yang dikembangkan sebagai bagian dari LXC yang merupakan fitur untuk membatasi, menghitung dan mengisolasi penggunaan sumber daya (CPU, memori, disk I / O, dll.) Dari grup proses ini juga bergantung pada jenis lain dari fungsi namespace-isolation, yang dikembangkan dan diintegrasikan ke dalam kernel Linux mainline.

Lalu **Apa itu LXD?**

LXD merupakan **_next generation system container_** dimana LXD sebenarnya adalah container based OS yang menawarkan user experience yang hampir sama dengan virtual machine.

LXD sebuah proyek lanjutan pengembangan dari LXC. LXD memiliki cukup banyak fitur menarik berikut: 

- Secure by design (unprivileged containers, resource restrictions and much more)
- Scalable (from containers on your laptop to thousand of compute nodes)
- Intuitive (simple, clear API and crisp command line experience)
- Image based (with a wide variety of Linux distributions published daily)
- Support for Cross-host container and image transfer (including live migration with CRIU)
- Advanced resource control (cpu, memory, network I/O, block I/O, disk usage and kernel resources)
- Device passthrough (USB, GPU, unix character and block devices, NICs, disks and paths)
- Network management (bridge creation and configuration, cross-host tunnels, …)
- Storage management (support for multiple storage backends, storage pools and storage volumes

LXD dapat digunakan bagi Anda yang ingin menggunakan container level OS karena base images, Anda dapat menggunakan LXD untuk kebutuhan container, images yang disupport oleh LXD sangat banyak mulai dari CentOS, Debian, Ubuntu dan masih banyak lagi lainnya. 

Untuk list OS yang di support LXD dapat Anda lihat pada link berikut: [Image server for LXC and LXD](https://us.images.linuxcontainers.org/).

Dengan adanya LXD Anda dapat membuat sebuah container dengan berbagai macam sistem operasi yang Anda inginkan. 

Apabila Anda ingin melakukan komparasi antara LXC vs LXD, Anda dapat merujuk pada link berikut: [Stachshare LXC vs LXD](https://stackshare.io/stackups/lxc-vs-lxd)

Berikut contoh arsitektur sederhana dari LXC:

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/arc-lxd.png)

**#Proses Container**

Kurang lebih untuk proses container-nya sendiri seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/cgroups.png)

Kemudian, untuk perbandingan antara **Linux Containers** dengan **Docker** sebagai berikut:

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxc_docker.png)

Untuk pengenalan tentang apa itu **Docker** Anda dapat merujuk pada tutorial berikut: [Pengenalan Terhadap Docker](https://belajarlinux.id/pengenalan-terhadap-docker/).

Itulah pengelan singkat mengenai LXC/LXD semoga dapat membantu 😁