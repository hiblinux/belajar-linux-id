---
title: Deploy WordPress dan MySQL dengan Persistent Volume pada Kubernetes
description: Pada tutorial kali ini akan membahas cara deploy WordPress menggunakan Persistent Volume pada Kubernetes.
lang: id_ID
date: 2021-01-12 21:18 +0700
layout: post
featured: true
author: Imron
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Deploy%20WP%20dengan%20PV/cover.png
categories: 
 - kubernetes 
 - kontainer 
 - storage
---

Pada tutorial kali ini akan membahas cara deploy WordPress menggunakan Persistent Volume pada Kubernetes. 
Persistent Volume (PV) merupakan sebuah bagian dari penyimpanan cluster yang secara statis dibuat oleh administrator dan secara dinamis dibuat oleh Storage Class. 

Sedangkan Persistent Volume Claim (PVC) merupakan strorage yang direquest oleh user. Jadi si admin disini membuat storage cluster terlebih dahulu, katakanlah 10Gb. Nantinya si user bisa claim storage sebesar 5Gb atau maksimal 10Gb untuk bisa menggunakannya. 


Nah, langsung saja bagaimana cara deploy WordPress dan MySQL menggunakan Persisten Volume pada kubernetes, langsung simak penjelasan berikut ini. 

## Prasyarat
1. Sudah memiliki [cluster kubernetes](https://belajarlinux.id/Install-Kubernetes-Cluster-Ubuntu/) 
3. Internet stabil 

## Pembahasan
1. Membuat Persistent Volume dan Persistent Volume Claim 
2. Buat file `kustomization.yaml` dengan: 
- Konfig resource WordPress 
- Konfig resource MySQL
3. Apply resource dengan `kustomization.yaml` 
4. Clean up resource 

## Instalasi dan Konfigurasi 
1. Login ke master node, dan buat file konfigurasi untuk membuat file PV dan PVC WordPress misal dengan nama `wp-pv-pvc.yaml`

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: wordpress-pv
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/root/blid/wordpress-config/wordpress-data"
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: wordpress-pvc
  labels:
    app: wordpress
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
```
**Keterangan**: 
- name: Isikan nama yang Anda inginkan 
- storage: Isikan besaran data storage yang Anda inginkan
- path: Bisa disesuaikan dengan direktori dimana volume akan disimpan, nantinya akan dimount ke path file sistem Pod. Misalnya: /root/blid/wordpress-config/wordpress-data

{:start="2"}
2. Selanjutnya buat  objek service pada WordPress denga nama file `wp-svc.yaml` seperti contoh konfigurasi berikut: 

```
apiVersion: v1
kind: Service
metadata:
  name: wordpress-svc
  labels:
    app: wordpress
spec:
  ports:
    - port: 80
  selector:
    app: wordpress
    tier: frontend
  type: LoadBalancer
```

{:start="3"}
3. Buat file konfigurasi untuk objek deployment pada WordPress dengan nama file `wp-deployment.yaml`: 

```
apiVersion: apps/v1 # for versions before 1.9.0 use apps/v1beta2
kind: Deployment
metadata:
  name: wordpress-deploy
  labels:
    app: wordpress
spec:
  selector:
    matchLabels:
      app: wordpress
      tier: frontend
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: wordpress
        tier: frontend
    spec:
      containers:
      - image: wordpress:5.4.0-php7.2-apache
        name: wordpress
        env:
        - name: WORDPRESS_DB_HOST
          value: wordpressdb-svc
        - name: WORDPRESS_DB_PASSWORD
          value: <Masukkan_Password_DB>
        - name: WORDPRESS_DB_USER
          value: <Masukkan_User_Database>
        - name: WORDPRESS_DB_NAME
          value: <Masukkan_Nama_Database>
        ports:
        - containerPort: 80
          name: wordpress-svc
        volumeMounts:
        - name: wordpress-persistent-storage
          mountPath: /var/www/html
      volumes:
      - name: wordpress-persistent-storage
        persistentVolumeClaim:
          claimName: wordpress-pvc
```

**Keterangan**: 

mountPath: Tempat mount file sistem

{:start="4"}
4. Sama seperti sebelumnya, kali ini buat PV dan PVC untuk mysql dengan nama file `wpdb-pv-pvc.yaml`. 

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: wordpressdb-pv
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/root/blid/wordpress-config/wordpressdb-data"
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: wordpressdb-pvc
  labels:
    app: wordpress
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
```

{:start="5"}
5. Buat objek service untuk mysql dengan nama file `wpdb-svc.yaml`
```
apiVersion: v1
kind: Service
metadata:
  name: wordpressdb-svc
  labels:
    app: wordpress
spec:
  ports:
  - port: 3306
    protocol: TCP
    targetPort: 3306
  selector:
    app: wordpress
    tier: wordpressdb
  type: ClusterIP
  clusterIP: None
```

{:start="6"}
6. Selanjutnya buat objek deployment untuk mysql dengan nama file `wpdb-deployment.yaml`

```
apiVersion: apps/v1 # for versions before 1.9.0 use apps/v1beta2
kind: Deployment
metadata:
  name: wordpressdb-deploy
  labels:
    app: wordpress
spec:
  selector:
    matchLabels:
      app: wordpress
      tier: wordpressdb
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: wordpress
        tier: wordpressdb
    spec:
      containers:
      - image: mariadb:10.5.2-bionic
        name: wordpressdb-container
        env:
          # Use secret in real usage
        - name: MYSQL_ROOT_PASSWORD
          value: <Masukkan_User_Root>
        - name: MYSQL_USER
          value: <Masukkan_User_Mysql>
        - name: MYSQL_PASSWORD
          value: <Masukkan_Password_Mysql>
        - name: MYSQL_DATABASE
          value: <Masukkan_Nama_Database>
        ports:
        - containerPort: 3306
          name: wordpressdb-svc
        volumeMounts:
        - name: wordpressdb-persistent-storage
          mountPath: /var/lib/mysql
      volumes:
      - name: wordpressdb-persistent-storage
        persistentVolumeClaim:
          claimName: wordpressdb-pvc
```

{:start="7"}
7.  Kemudian masukkan semua file tersebut pada file `kustomization.yaml`. File tersebut nantinya mengandung semua resource pada daftar file yang sudah dimasukkan sebelumnya, sehingga untuk deploynya tidak satu persatu, melainkan secara keseluruhan. 
```
# cat kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
resources:
- wpdb-pv-pvc.yaml
- wpdb-svc.yaml
- wpdb-deployment.yaml
- wp-pv-pvc.yaml
- wp-svc.yaml
- wp-deployment.yaml
```

{:start="8"}
8. Langkah yang terakhir apply dan verify pada file `kustomization.yaml`
```
kubectl apply -k ./
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Deploy%20WP%20dengan%20PV/1.%20Deployment.png)

Verifikasi hasil PV, PVC, service, dan deployment. Pastikan PVC sudah berstatus bound.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Deploy%20WP%20dengan%20PV/4.%20Bound.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Deploy%20WP%20dengan%20PV/5.%20pv.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Deploy%20WP%20dengan%20PV/6.%20deploy.png)

{:start="9"}
9. Untuk mengakses wordpressnya, silakan cek port servicenya dan akses ke browser menggunaakn IP Address/hostname:service_port. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Deploy%20WP%20dengan%20PV/7.%20svc.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Deploy%20WP%20dengan%20PV/8.%20wp.png)

{:start="10"}
10. Jika Anda ingin menghapus semua objek (deployment, service, PV, dan PVC) bisa menggunakan perintah berikut: 

```
kubectl delete -k ./
```

Sekian dan terima kasih. 

Semoga bermanfaat dan berokah :) 