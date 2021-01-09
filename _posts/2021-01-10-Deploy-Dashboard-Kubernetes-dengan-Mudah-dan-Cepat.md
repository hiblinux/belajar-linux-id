---
title: Deploy Dashboard Kubernetes dengan Mudah dan Cepat
description: Dashboard kubernetes berbasis web interface yang berfungsi untuk memudahkan pengguna dalam deploy aplikasi berbasis kontainer untuk sebuah cluster kubernetes, troubleshoot kontainer, dan mengelola resource cluster.
lang: id_ID
date: 2021-01-10 03:28 +0700
layout: post
featured: true
author: Imron
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Dashboard%20K8s/cover.png
categories:
  - kubernetes
  - dashboard
  - kontainer
---

Dashboard kubernetes berbasis web interface yang berfungsi untuk memudahkan pengguna dalam deploy aplikasi berbasis kontainer untuk sebuah cluster kubernetes, troubleshoot kontainer, dan mengelola resource cluster. Selain itu Anda juga bisa menggunakan dashboard tersebut untuk melihat gambaran secara umum dari aplikasi yang sedang berjalan pada cluster, dan untuk membuat atau memodifikasi resource kubernetes seperti deployment, Jobs, DaemonSets. Seperti scale deployment, inisasi update rollling, restart pod atau deploy aplikasi baru menggunakan wizard deploy. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Dashboard%20K8s/1.%20Dashboard.png)

## Prasyarat 
1. Sudah memiliki kubernetes cluster
Jika Anda belum memiliki kubernetes cluster, bisa install terlebih dahulu menggunakan referensi [**berikut**](https://belajarlinux.id/Install-Kubernetes-Cluster-Ubuntu/). 
2. Koneksi internet stabil 

## Instalasi dan Konfigurasi 
1. Masuk ke dashboard master node, dan aktifkan dashboard kubernetes. 

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.3/aio/deploy/recommended.yaml
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Dashboard%20K8s/2.%20Dashboard.png)

{:start="2"}
2. Tambahkan akun untuk manajemen dashboard

```
kubectl create serviceaccount -n kubernetes-dashboard admin-user
```

Buat nama file baru, misalnya: `rbac.yml` dan masukkan konfigurasi berikut. 

```
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
```

Eksekusi file tersebut dengan menjalankan perintah: 

```
kubectl apply -f rbac.yml
```

Konfirmasi akun token securitynya: 

```
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Dashboard%20K8s/3.%20rbac.png)

{:start="3"}
3. Karena disini saya tidak ingin akses dashboard kubernetes dengan proxy, maka saya set port-forwarding. 

```
kubectl port-forward -n kubernetes-dashboard service/kubernetes-dashboard --address 0.0.0.0 10443:443
```

{:start="4"}
4. Anda bisa mengakses dashboard port forwarding dengan menggunakan URL: 

```
https://(IP Address_hostname):(Port forwarding)
contoh:  https://127.0.0.1:10443
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Dashboard%20K8s/4.%20forward.png)

Jika berhasil akan muncul login dashboard kubernetes seperti berikut, masukkan token yang sudah digenerate sebelumnya. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Dashboard%20K8s/5.%20Login.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Dashboard%20K8s/6.%20Berhasil.png)

## Kesimpulan 

Dashboard kubernetes memudahkan pengguna dalam membuat aplikasi berbasis kontainer, maupun mengelolanya. Selain itu pengguna dimanjakan dengan tampilan visual dashboardnya yang user-friendly. Selebihnya Anda bisa explore secara lebih jauh melalui tautan refrensi [berikut](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/). 

Sekian dan terima kasih. 

Semoga bermanfaat dan barokah :) 