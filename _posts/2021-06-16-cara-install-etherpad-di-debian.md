---
title: Cara Install Etherpad di Debian GNU/Linux
description: Lelah dengan Google Docs? Saatnya menggunakan Etherpad!
lang: id_ID
date: 2021-06-16 19:36 +0700
layout: post
featured: true
author: Radhitya
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-06-16_19-48-59.jpg
categories: 
- debian
- Etherpad
- internet independen
---

Etherpad adalah editor dokumen online yang dapat berkolaborasi antar user lain secara langsung. Editor ini bisa didownload secara gratis dan salah satu program open source. Dapat dikatakan Etherpad adalah *Google Docs* versi open source.

## Cara Install Etherpad di Debian GNU/Linux
Instalasi Etherpad sangat mudah dan cepat. Kali ini kita akan praktek install etherpad di Debian GNU/Linux. Proses pemasangan dilakukan sebagai **root**.

Kita akan download file filenya yang dibutuhkan
```bash
apt install nodejs libssl-dev pkg-config git gcc g++ make build-essential gnupg2 -y
```
Etherpad menggunakan mysql guna menyimpan data, buka mysql.
```bash
mysql
```
Lalu kita buat database nya
```bash
> create database etherpaddb;
> exit;
```
Buat userb baru untuk menjalankan Etherpad.
```bash
adduser --home /opt/etherpad --shell /bin/bash etherpad
```
Ganti permission direktori Etherpad
```bash
install -d -m 755 -o etherpad -g etherpad /opt/etherpad
```
Saatnya login sebagai Etherpad
```bash
su - etherpad
```
Download Etherpad dari repository github.
```bash
git clone --branch master https://github.com/ether/etherpad-lite.git
```
Masuk ke direktori dan jalankan Etherpad
```bash
cd etherpad-lite
bin/run.sh
```
Server Etherpad akan berjalan, tekan CTRL+C untuk berhenti. Sekarang kita akan merubah konfigurasi **settings.json**.
```bash
vi settings.json
```
Hapus konfigurasi ini:
```bash
"dbType" : "dirty",
  "dbSettings" : {
                   "filename" : "var/dirty.db"
                 },
```
Ganti konfigurasi dan samakan seperti database yang kita buat sebelumnya.
```bash
  "dbType" : "mysql",
  "dbSettings" : {
    "user":     "user_mysql_kamu",
    "host":     "localhost",
    "port":     3306,
    "password": "passwordpalingsusah",
    "database": "etherpaddb",
    "charset":  "utf8mb4"
  },
```
Ubah konfig trustProxy
```bash
"trustProxy": true,
```
Mari kita ganti konfigurasi admin.
```bash
"users": {
    "admin": {
      "password": "passwordpalingsusah",
      "is_admin": true
    },
```
Jalankan instalasi.
```bash
./bin/installDeps.sh
```
Selanjutnya keluar.
```bash
exit
```
Kita akan membuat service systemd untuk etherpad
```bash
vi /etc/systemd/system/etherpad.service
```
Tulis konfigurasi seperti dibawah
```bash
[Unit]
Description=Etherpad-lite, the collaborative editor.
After=syslog.target network.target

[Service]
Type=simple
User=etherpad
Group=etherpad
WorkingDirectory=/opt/etherpad/etherpad-lite
Environment=NODE_ENV=production

ExecStart=/usr/bin/node /opt/etherpad/etherpad-lite/src/node/server.js

Restart=always

[Install]
WantedBy=multi-user.target
```
Jangan lupa disimpan dan muat kembali systemd daemon untuk melakukan perubahan.
```bash
systemctl daemon-reload
```
Terakhir jalankan dan aktifkan untuk berjalan ketika system reboot.
```bash
systemctl start etherpad
systemctl enable etherpad
```
## Membuat Reverse Proxy untuk Etherpad
Saatnya kita membuat reverse proxy untuk mengakses Etherpad menggunakan domain. Kali ini kita akan mencoba menghubungkan ke domain pad.radhitya.net, nantinya ganti sesuai domain milik anda.
```bash
cd /etc/nginx
vi conf.d/pad.radhitya.conf
```
Tulis seperti di bawah
```bash
server {
	listen 80;
	server_name pad.radhitya.net;
	include snippets/letsencrypt.confl
	return 301 https://pad.radhitya.net$request_uri;
}

server {
	listen 443 ssl http2;
	server_name pad.radhitya.net;

	proxy_read_timeout 720s;
	proxy_connect_timeout 720s;
	proxy_send_timeout 720s;

	client_max_body_size 50m;

	# Proxy headers
	proxy_set_header X-Forwarded-Host $host;
	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	proxy_set_header X-Forwarded-Proto $scheme;
	proxy_set_header X-Real_IP $remote_addr;

	# SSL parameters
    	ssl_certificate /etc/letsencrypt/live/pad.radhitya.net/fullchain.pem;
    	ssl_certificate_key /etc/letsencrypt/live/pad.radhitya.net/privkey.pem;
    	ssl_trusted_certificate /etc/letsencrypt/live/pad.radhitya.net/chain.pem;
    	include snippets/letsencrypt.conf;
    	include snippets/ssl.conf;

    	# log files
    	access_log /var/log/nginx/pad.radhitya.net.access.log;
    	error_log /var/log/nginx/pad.radhitya.net.error.log;

    	# Handle / requests
    	location / {
       	proxy_redirect off;
       	proxy_pass http://127.0.0.1:9001;
    }
}
```
Jangan lupa restart nginx. 
```bash
systemctl restart nginx
```

Akses Etherpad di https://pad.radhitya.net dan hasilnya seperti di bawah.
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-06-16_19-33-29.jpg)
