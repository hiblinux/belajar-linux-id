---
title: Mengenal Apa Itu Kolla Ansible
description: 'Openstack adalah sebuah platform cloud yang terdiri dari software  open source untuk menjalankan Cloud IaaS (Infrastructure as a Service),  baik untuk private ataupun public Cloud'
lang: id_ID
date: 2021-06-15 20:58 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/cover-kolla.png
categories:
- kolla-ansible
- openstack
---

[Belajar Linux ID](https://belajarlinux.id) - Openstack adalah sebuah platform cloud yang terdiri dari software  open source untuk menjalankan Cloud IaaS (Infrastructure as a Service),  baik untuk private ataupun public Cloud.

Openstack mempunyai kemampuan skalabilitas yang lebih besar dibandingkan kerangka kerja cloud (awan) lainnya. Tujuan Openstack adalah untuk memungkinkan setiap organisasi atau perusahaan (penyedia Cloud) misalnya membuat dan menyediakan layanan komputasi awan dengan menggunakan  perangkat lunak open source yang berjalan di atas perangkat keras ideal  nya di bare metal.

Sangat banyak pilihan deployment tool framework yang dapat kita gunakan untuk deploy Openstack mulai dari yang free sampai yang berbayar selain itu ada juga yang khusus untuk dev atau pembelajaran ada juga deployment tool yang ready production. 

**_Baca Juga:_**

- *[Cloud Computing: Pengenalan](https://belajarlinux.id/cloud-computing/)*
- *[Cloud Computing: Jenis - Jenis Cloud](https://belajarlinux.id/jenis-jenis-cloud-computing/)*
- *[Openstack: Definisi dan Arsitektur](https://belajarlinux.id/openstack-definisi-dan-arsitektur/)*

Berikut ini merupakan gambaran deployment tool yang dapat digunaka untuk deploy Openstack

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/dep-opstack-01.png)

Sumber: **[Deployment Tools](https://www.openstack.org/software/project-navigator/deployment-tools)**

Dari gambaran diatas kami tidak akan membahas satu-persatu deployment tools tersebut, Anda dapat akses sumber deployment tools tersebut secara free dan dapat dieksplore secara mandiri. 

Namun disini kami akan bahas  satu deployment tool untuk deploy opentack yang dapat digunakan untuk skala production yaitu ***Openstack Kolla Ansible***. 

## Apa itu Kolla Ansible?

**Kolla Ansible** salah satu service yang dapat digunakan untuk deploy Openstack skala production yang scalable, fast, reliable, dan upgradable, salah satu best praktis community. barkan sebagai layanan yang menyediakan wadah siap produksi dan alat penyebaran untuk mengoperasikan cloud OpenStack yang dapat diskalakan, cepat, andal, dan dapat ditingkatkan menggunakan praktik terbaik komunitas.

**Kolla Ansible** menginstall Openstack ke dalam container. **Kolla Ansible** menggunakan tool management yang populer yang sering digunakan untuk automasi yaitu **Ansible** untuk penerapan Openstack yang mudah disesuaikan bahkan sepenuhnya dapat disesuaikan sesuai keinginan dan arsitektur yang sudah ditetukan. 

Kolla menggunakan Ansible untuk menjalankan image container dan deploy atau upgrade cluster OpenStack dengan sangat mudah baik di bare metal atau instance/VM (Virtual Machine). Container Kolla dikonfigurasi untuk menyimpan data pada penyimpanan persisten, yang kemudian dapat dipasang kembali ke sistem operasi host dan berhasil di restore untuk melindungi (protect) dari kesalahan (faults).

**Kolla Ansible** menyediakan playbook Ansible untuk menerapkan OpenStack di dalam **Docker** container dan medukung konfigurasi all-in-one dan multi-node dari OpenStack.

## Openstack Services

Mungkin banyak yang akan bertanya apa saja service openstack yang dapat diprovide koll?.

**Kolla Ansible** melakukan deploy container untuk project Openstack berikut: 

- [Aodh](https://docs.openstack.org/aodh/latest/)
- [Barbican](https://docs.openstack.org/barbican/latest/)
- [Bifrost](https://docs.openstack.org/bifrost/latest/)
- [Blazar](https://docs.openstack.org/blazar/latest/)
- [Ceilometer](https://docs.openstack.org/ceilometer/latest/)
- [Cinder](https://docs.openstack.org/cinder/latest/)
- [CloudKitty](https://docs.openstack.org/cloudkitty/latest/)
- [Congress](https://docs.openstack.org/congress/latest/)
- [Designate](https://docs.openstack.org/designate/latest/)
- [Freezer](https://docs.openstack.org/freezer/latest/)
- [Glance](https://docs.openstack.org/glance/latest/)
- [Heat](https://docs.openstack.org/heat/latest/)
- [Horizon](https://docs.openstack.org/horizon/latest/)
- [Ironic](https://docs.openstack.org/ironic/latest/)
- [Karbor](https://docs.openstack.org/karbor/latest/)
- [Keystone](https://docs.openstack.org/keystone/latest/)
- [Kuryr](https://docs.openstack.org/kuryr/latest/)
- [Magnum](https://docs.openstack.org/magnum/latest/)
- [Manila](https://docs.openstack.org/manila/latest/)
- [Mistral](https://docs.openstack.org/mistral/latest/)
- [Murano](https://docs.openstack.org/murano/latest/)
- [Neutron](https://docs.openstack.org/neutron/latest/)
- [Nova](https://docs.openstack.org/nova/latest/)
- [Octavia](https://docs.openstack.org/octavia/latest/)
- [Panko](https://docs.openstack.org/panko/latest/)
- [Rally](https://docs.openstack.org/rally/latest/)
- [Sahara](https://docs.openstack.org/sahara/latest/)
- [Searchlight](https://docs.openstack.org/searchlight/latest/)
- [Senlin](https://docs.openstack.org/senlin/latest/)
- [Solum](https://docs.openstack.org/solum/latest/)
- [Swift](https://docs.openstack.org/swift/latest/)
- [Tacker](https://docs.openstack.org/tacker/latest/)
- [Tempest](https://docs.openstack.org/tempest/latest/)
- [Trove](https://docs.openstack.org/trove/latest/)
- [Vitrage](https://docs.openstack.org/vitrage/latest/)
- [Vmtp](https://vmtp.readthedocs.io/en/latest/)
- [Watcher](https://docs.openstack.org/watcher/latest/)
- [Zun](https://docs.openstack.org/zun/latest/)

Tentunya untuk semua service openstack diatas dapat Anda kustomisasi apa aja yang diikutsertakan pada saat deploy Opesntack. 

## Infrastructure components

Jika sebelumnya kita sudah membahas dari segi service sekarang kita bahas sedikit komponen apa saja dari segi infrastruktur diantaranya sebagai berikut: 

- [Ceph](http://ceph.com/) implementation for Cinder, Glance and Nova.
- [Collectd](https://collectd.org/), [Telegraf](https://docs.influxdata.com/telegraf/), [InfluxDB](https://influxdata.com/time-series-platform/influxdb/), [Prometheus](https://prometheus.io/), and [Grafana](http://grafana.org/) for performance monitoring.
- [Elasticsearch](https://www.elastic.co/de/products/elasticsearch/) and [Kibana](https://www.elastic.co/de/products/kibana/) to search, analyze, and visualize log messages.
- [Etcd](https://coreos.com/etcd/) a distributed reliable key-value store.
- [Fluentd](https://www.fluentd.org/) as an open source data collector for unified logging layer.
- [Gnocchi](http://gnocchi.xyz/) A time-series storage database.
- [HAProxy](http://www.haproxy.org/) and [Keepalived](http://www.keepalived.org/) for high availability of services and their endpoints.
- [MariaDB and Galera Cluster](https://mariadb.com/kb/en/mariadb/galera-cluster/) for highly available MySQL databases.
- [Memcached](https://memcached.org/) a distributed memory object caching system.
- [MongoDB](https://www.mongodb.org/) as a database back end for Panko.
- [Open vSwitch](http://openvswitch.org/) and Linuxbridge backends for Neutron.
- [RabbitMQ](https://www.rabbitmq.com/) as a messaging backend for communication between services.
- [Redis](https://redis.io/) an in-memory data structure store.

Itulah sedikit pengertian tentang **Kolla Ansilbe** nantikan tutorial-tutorial selanjutnya mengenai instalasi openstack menggunakan Kolla Ansible. 

Semangat belajar 😁

Sumber:

- https://docs.openstack.org/kolla-ansible/latest/
- https://github.com/openstack/kolla-ansible
- https://governance.openstack.org/tc/reference/projects/kolla.html?_ga=2.121438728.1808336380.1623575296-1974316858.1621431267
- Kursus Openstack Administrator [Adinusa.id](https://course.adinusa.id/courses/openstack-administration)






