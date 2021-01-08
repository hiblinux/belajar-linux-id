---
title: Instal Kubernetes Cluster pada Ubuntu Server 20.04 LTS
description: Kubernetes merupakan tool orkestrasi kontainer yang berfungsi untuk melakukan deployment, scale up dan mengelola aplikasi berbasis kontainer.
lang: id_ID
date: 2021-01-09 03:11 +0700
layout: post
featured: true
author: Imron
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/Cover.png
categories: 
 - container 
 - docker 
 - kubernetes 
 - cluster
---

Kubernetes merupakan tool orkestrasi kontainer yang berfungsi untuk melakukan deployment, scale up dan mengelola aplikasi berbasis kontainer. Disini saya akan share cara install kubernetes cluster pada Ubuntu Server 20.04 LTS menggunakan tiga server, dimana satu server berfungsi sebagai master node, dan kedua server berfungsi sebagai worker node. 

Adapun topologi yang digunakan adalah sebagai berikut: 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/Kubernetes.png)

Kebutuhan lab: 
1. Server 1 - Pod49-master - 192.168.20.116
2. Server 2 - Pod49-worker0 - 192.168.20.64
3. Server 3 - Pod49-worker1 - 192.168.20.105
{:class="table table-bordered"}

**Keterangan**:
Hostname masing-masing server bisa menggunakan nama yang berbeda. 

## Prasyarat 
1. Minimal RAM 2 GB 
2. 2 CPUs atau lebih 
3. Koneksi internet stabil 
4. Menggunakan hostname server unik/FQDN
5. Swap dinonaktifkan

## Instalasi dan Konfigurasi 

1. Set hostname dan tambahkan baris pada `/etc/hosts` pada masing-masing server. 

```
hostnamectl set-hostname pod49-master // lakukan pada node master
hostnamectl set-hostname pod49-worker0 // lakukan pada node worker0
hostnamectl set-hostname pod49-worker1 // lakukan pada node worker1
```

Masukkan baris berikut pada masing-masing server.

```
192.168.20.116   pod49-master
192.168.20.64    pod49-worker0
192.168.20.105   pod49-worker1
```

Verifikasi dengan test ping menggunakan hostname. 
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/12.%20Test.png)

{:start="2"}
2. Install docker (Container Runtime) pada masing-masing node/server.
Login ke masing-masing node dan coba update paket beserta install docker. 

```
apt update
apt install -y docker.io
```

Aktifkan service docker dengan perintah: 

```
systemctl enable docker.service
```

Pastikan status service docker aktif, Anda juga bisa menggunakan perintah berikut untuk cek versi dockernya.

```
systemctl status docker
docker --version
```

{:start="3"}
3. Non-aktifkan swap dan aktifkan IP forwarding masing-masing node/server.
Untuk menon-aktifkan swap, edit file `/etc/fstab` dan komen (beri tanda #) pada baris yang mencakup partisi dan file swap. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/15.%20Swap.png)

Simpan dan keluar, lalu jalankan perintah berikut untuk menon-aktifkan swap secara cepat. 

```
swapoff -a
```

Selanjutnya, aktifkan IP Forwarding secara permanen. Edit file `/etc/sysctl.conf`, lalu cari baris `net.ipv4.ip_forward=1` dan hilangkan tanda pagar. Setelah itu, simpan dan jalankan perintah berikut: 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/16.%20IP.png)

```
sysctl -p
net.ipv4.ip_forward = 1
```

{:start="4"}
4. Install Kubectl, kubelet dan kubeadm pada masing-masing node/server

```
apt install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt update
apt install -y kubelet kubeadm kubectl
```

{:start="5"}
5. Inisialiassi Kubernetest Cluster menggunakan Kubeadm (dari master node)

Login ke node master dan jalankan perintah berikut: 

```
kubeadm init
```

Karena saya menggunakan VCPu 1 core, maka akan muncul pesan error penggunaan vCPU kurang mencukupi (minimal 2 core). Hal tersebut bisa diantisipasi dengan menambahkan flag `--ignore-preflight-errors=NumCPU`. 

```
kubeadm init --ignore-preflight-errors=NumCPU
```

Jika berhasil maka akan muncul informasi perintah mulai join cluster seperti berikut: 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/1.%20Join.png)

Jalankan perintah berikut pada node master. 

```
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
```

Setelah itu, jalankan perintah berikut ini pada masing-masing node worker untuk join ke node master. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/19.%20joinl.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/2.%20Join2.png)

![](http://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/3.%20Join3.png)]

Kemudian, dari sisi node master cek status node apakah sudah ready atau belum dengan perintah: `kubectl get nodes`. 

```
NAME            STATUS     ROLES                 AGE     VERSION
pod49-master    NotReady   control-plane,master  27m     v1.20.1
pod49-worker0   NotReady   <none>                8m3s    v1.20.1
pod49-worker1   NotReady   <none>                7m19s   v1.20.1
```

Pada keterangan diatas terlihat join cluster kubernetes sudah berhasil, namun untuk status masih belum ready. Untuk membuat status node menjadi ready, kita harus deploy Container Network Interface (CNI) yang berbasis add-ons Pod network seperti calico, kube-router, dan weave-net. Add-ons Pod network tersebut berfungsi untuk membuat Pod berhubungan satu sama lain. 

{:start="6"}
6. Deploy Add-on Pod Network Calico pada node master 
Login ke node master, lalu jalankan perintah berikut untuk install Add-on Pod Network Calico: 

```
kubectl apply -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml
```

Apabila instalasi sudah selesai, silakan cek kembali status node. Nantinya akan menjadi Ready. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/4.%20Get.png)

Verifikasi Pod semua namespace apakah sudah bersatus running atau belum. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/18.%20namespace.png)

Pada gambar diatas menunjukkan bahwa stutus pod dalam kondisi baik, oleh karena itu bisa melanjutkan untuk mencoba deploy pod, deployment dan service. Hal tersebut berguna untuk cek apakah kondisi cluster berjalan dengan baik atau tidak. 

{:start="7"}
7. Uji coba dan Verifikasi Kubernetes Cluster 
Coba buat deployment dengan nama **nginx-web** menggunakan image kontainer **nginx** didalam namespace default. Jalankan perintah berikut dari node master. 

```
kubectl create deployment nginx-web --image=nginx
```

Jalankan perintah berikut untuk verifikasi status deployment. 
```
kubectl get deploy
kubectl get deploy  -o wide
kubectl get pods
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/6.%20Get.png)

Dari gambar diatas jumlah Pod masih satu dan belum terdapat replikasinya. Apabila ingin scale up bisa menjalankan perintah: 

```
kubectl scale --replicas=4 deployment nginx-web
```

Pastikan jumlah pod adalah 4. 

```
kubectl get deploy
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/7.%20Scale.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/8.%20Scale.png)

Dari gambar diatas sudah menunjukan Pod berjumlah 4 artinya scale up berjalan dengan sukses.

Selanjutnya silakan coba deploy satu pod dengan nama "http-web" dan ekspos dengan nama service "http-service" menggunakan port default `80` dan tipe service NodePort. 

```
kubectl run http-web --image=httpd --port=80
```

Jalankan perintah `kubectl get pods` untuk verifikasi status Pod sudah `Running` atau belum. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/9.%20Podhttp.png)

```
kubectl expose pod http-web --name=http-service --port=80 --type=NodePort
```

Untuk cek service sudah sesuai atau belum bisa menjalankan perintah berikut: 

```
kubectl describe svc http-service
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/10.%20Nodeport.png)

Cek IP atau hostname yang digunakan pod "http-web" lalu silakan akses menggunakan `curl` via NodePort (32185). 

```
kubectl get pods http-web -o wide
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/Install%20K8s/11.%20Curl.png)

## Kesimpulan 
Instalasi kubernetes cluster pada Ubuntu Server 20.04 LTS terbukti berjalan dengan lancar, pada saat membuat deployment, pod, dan scale up replica terlihat tidak terdapat kendala sama sekali. 

Apabila terdapat saran atau kritik bisa cantumkan komen pada kolom berikut ya. 

Sekian dan terima kasih.

Semoga bermanfaat dan barokah, aamiin :) 
