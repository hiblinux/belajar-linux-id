---
title: Integarasi Collabora Online dengan Nextcloud di Ubuntu 20.04 LTS
description: 'Collabora Online adalah paket aplikasi perkantoran online berbasis LibreOffice yang andal dengan pengeditan kolaboratif, yang mendukung semua format file dokumen, spreadsheet, dan presentasi utama dan berfungsi di semua browser modern saat ini.'
lang: id_ID
date: 2021-03-13 07:34 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/collabora-next.png
categories:
 - nextcloud
 - ubuntu
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini kami akan mengintegrasikan collabora online dengan nextcloud. Apa itu Collabora Online?.

**[Collabora Online](https://nextcloud.com/collaboraonline/)** adalah paket aplikasi perkantoran online berbasis [**LibreOffice**](https://www.libreoffice.org/) yang andal dengan pengeditan kolaboratif, yang mendukung semua format file dokumen, spreadsheet, dan presentasi utama dan berfungsi di semua browser modern saat ini. 

## Fitur Collabora Online

- Pengeditan dasar
- Fidelitas tinggi, rendering WYSIWYG
- Mendukung format dokumen DOC, DOCX, PPT, PPTX, XLS, XLSX, ODF
- Impor dan tampilkan Visio, Publisher, dan 100+ lainnya
- Pengeditan Bersama

Server collabora online yang akan integrasikan dengan nextcloud dapat satu server dengan host nextcloud atau dipisah dengan server host nextcloud artinya dibuatkan server sendiri untuk server collabora online-nya. Di tutorial kali ini kami akan install dan integrasikan collabora online di satu server atau host yang sama dengan nextcloud. Oleh karena itu sebelum mengikuti ini pastikan Anda sudah melakukan instalasi nextcloud yang dapat Anda lihat tutorialnya pada link berikut: 

- ***[Install Nextcloud di Ubuntu 20.04 LTS](https://belajarlinux.id/install-nextcloud-di-ubuntu-20-04-lts/)***
- ***[Konfigurasi Dasar Nextcloud di Ubuntu 20.04 LTS](https://belajarlinux.id/konfigurasi-dasar-nextcloud-di-ubuntu-20-04-lts/)***

Collabora online sendiri akan di install menggunakan docker dengan demikian Anda perlu install docker terlebih dahulu pada host nextcloud

*Baca juga: [Cara Instalasi Docker Pada Linux](https://belajarlinux.id/docker-installasi-docker-pada-linux/)*

Berikut cara instalasi docker di Ubuntu 20.04 LTS:

Update sistem operasi Ubuntu 20.04 LTS

```bash
ubuntu@lemp-belajarlinux:~$ sudo apt update
```

Jalankan perintah berikut untuk instalasi docker

```bash
ubuntu@lemp-belajarlinux:~$ sudo apt install docker.io
ubuntu@lemp-belajarlinux:~$
```

Enable docker

```bash
ubuntu@lemp-belajarlinux:~$ sudo systemctl enable docker
Created symlink /etc/systemd/system/multi-user.target.wants/docker.service → /lib/systemd/system/docker.service.
ubuntu@lemp-belajarlinux:~$
```

Silakan start dan pastikan status docker sudah running

```bash
ubuntu@lemp-belajarlinux:~$ sudo systemctl start docker
ubuntu@lemp-belajarlinux:~$
ubuntu@lemp-belajarlinux:~$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2021-03-03 11:08:06 UTC; 9s ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 60893 (dockerd)
      Tasks: 10
     Memory: 36.8M
     CGroup: /system.slice/docker.service
             └─60893 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Mar 03 11:08:06 lemp-belajarlinux.id dockerd[60893]: time="2021-03-03T11:08:06.177644892Z" level=warning msg="Your kernel does not support swap mem>
Mar 03 11:08:06 lemp-belajarlinux.id dockerd[60893]: time="2021-03-03T11:08:06.177706353Z" level=warning msg="Your kernel does not support cgroup b>
Mar 03 11:08:06 lemp-belajarlinux.id dockerd[60893]: time="2021-03-03T11:08:06.177718825Z" level=warning msg="Your kernel does not support cgroup b>
Mar 03 11:08:06 lemp-belajarlinux.id dockerd[60893]: time="2021-03-03T11:08:06.178159062Z" level=info msg="Loading containers: start."
Mar 03 11:08:06 lemp-belajarlinux.id dockerd[60893]: time="2021-03-03T11:08:06.707726460Z" level=info msg="Default bridge (docker0) is assigned wit>
Mar 03 11:08:06 lemp-belajarlinux.id dockerd[60893]: time="2021-03-03T11:08:06.812247685Z" level=info msg="Loading containers: done."
Mar 03 11:08:06 lemp-belajarlinux.id dockerd[60893]: time="2021-03-03T11:08:06.866045679Z" level=info msg="Docker daemon" commit=afacb8b7f0 graphdr>
Mar 03 11:08:06 lemp-belajarlinux.id dockerd[60893]: time="2021-03-03T11:08:06.866303455Z" level=info msg="Daemon has completed initialization"
Mar 03 11:08:06 lemp-belajarlinux.id systemd[1]: Started Docker Application Container Engine.
Mar 03 11:08:06 lemp-belajarlinux.id dockerd[60893]: time="2021-03-03T11:08:06.948377163Z" level=info msg="API listen on /run/docker.sock"
ubuntu@lemp-belajarlinux:~$
```

Jalankan perintah berikut untuk pull image Collabora Online Development Edition terbaru dari *Docker Hub*.

```bash
ubuntu@lemp-belajarlinux:~$ sudo docker pull collabora/code
Using default tag: latest
latest: Pulling from collabora/code
7595c8c21622: Pull complete
d13af8ca898f: Pull complete
70799171ddba: Pull complete
b6c12202c5ef: Pull complete
d166f938adfb: Pull complete
9285871f475e: Pull complete
6d3e8ce47235: Pull complete
a8323f3ef03e: Pull complete
Digest: sha256:4ec098591c82f8a239099e43eadf82ab750a86b139a553c60dc1f63a18a06157
Status: Downloaded newer image for collabora/code:latest
docker.io/collabora/code:latest
ubuntu@lemp-belajarlinux:~$
```

Kemudian jalankan container dengan perintah berikut, silakan ubah `nextcloud\\.belajarlinux\\.my.id` dengan nama host nextcloud Anda. Collabora hanya mengizinkan host yang dikenal untuk mengakses layanannya dan Anda perlu menambahkan nama host nextcloud ke daftar putih (whitelist) dengan parameter = domain. 

```bash
ubuntu@lemp-belajarlinux:~$ sudo docker run -t -d -p 127.0.0.1:9980:9980 -e 'domain=nextcloud\\.belajarlinux\\.my.id' -e "extra_params=--o:ssl.enabl
e=false --o:ssl.termination=true" --restart always collabora/code
c132e9cf4dd71be1b16e727a2c039148d1cc0e4c9bd3aff5e5897f592ef04036
ubuntu@lemp-belajarlinux:~$
```

Keterangan:

- **-d**: Detached mode untuk menjalankan container di background
- **-t**: Mengalokasikan pseudo-TTY
- **-p**: Publikasikan port container ke host.
- **-e**: Mengatur variabel environtment

Server Collabora Online akan listen pada port *9980* dari localhost *(127.0.0.1)* 

```bash
ubuntu@lemp-belajarlinux:~$ sudo netstat -lnpt | grep docker
tcp        0      0 127.0.0.1:9980          0.0.0.0:*               LISTEN      61242/docker-proxy
ubuntu@lemp-belajarlinux:~$
```

Server nextcloud memerlukan sertifikat TLS di Collabora Online, jadi Anda perlu membuat host virtual, membuat virtual host atau server block, menyiapkan reverse proxy, dan menginstal sertifikat TLS. Disini kami menggunaka nginx untuk server block dan reverse proxy.

```bash
ubuntu@lemp-belajarlinux:~$ sudo vim /etc/nginx/conf.d/collabora.conf
```

Isi konfigurasi server blocks nginx dari collabora online

```php
server {
    listen 80;
    server_name  collabora.belajarlinux.my.id;

    error_log /var/log/nginx/collabora.error;

    # static files
    location ^~ /loleaflet {
        proxy_pass http://localhost:9980;
        proxy_set_header Host $http_host;
    }

    # WOPI discovery URL
    location ^~ /hosting/discovery {
        proxy_pass http://localhost:9980;
        proxy_set_header Host $http_host;
    }

    # Capabilities
    location ^~ /hosting/capabilities {
        proxy_pass http://localhost:9980;
        proxy_set_header Host $http_host;
    }

    # main websocket
    location ~ ^/lool/(.*)/ws$ {
        proxy_pass http://localhost:9980;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "Upgrade";
        proxy_set_header Host $http_host;
        proxy_read_timeout 36000s;
    }

    # download, presentation and image upload
    location ~ ^/lool {
        proxy_pass http://localhost:9980;
        proxy_set_header Host $http_host;
    }

    # Admin Console websocket
    location ^~ /lool/adminws {
        proxy_pass http://localhost:9980;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "Upgrade";
        proxy_set_header Host $http_host;
        proxy_read_timeout 36000s;
    }
}
```

Verifikasi konfigurasi nginx dan reload nginx

```bash
ubuntu@lemp-belajarlinux:~$ sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
ubuntu@lemp-belajarlinux:~$ sudo systemctl reload nginx
ubuntu@lemp-belajarlinux:~$
```

Install TLS Certificate menggunakan certbort

```bash
ubuntu@lemp-belajarlinux:~$ sudo certbot --nginx --agree-tos --redirect --hsts --staple-ocsp --email me@belajarlinux.id -d collabora.belajarlinux.my.id
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator nginx, Installer nginx
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for collabora.belajarlinux.my.id
Waiting for verification...
Cleaning up challenges
Deploying Certificate to VirtualHost /etc/nginx/conf.d/collabora.conf
Redirecting all traffic on port 80 to ssl in /etc/nginx/conf.d/collabora.conf

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Congratulations! You have successfully enabled
https://collabora.belajarlinux.my.id

You should test your configuration at:
https://www.ssllabs.com/ssltest/analyze.html?d=collabora.belajarlinux.my.id
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/collabora.belajarlinux.my.id/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/collabora.belajarlinux.my.id/privkey.pem
   Your cert will expire on 2021-06-01. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot again
   with the "certonly" option. To non-interactively renew *all* of
   your certificates, run "certbot renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le

ubuntu@lemp-belajarlinux:~$
```

*Noted: Jika belum menginstall certbot silakan install terlebih dahulu*

Jika sudah silakan buka nextcloud menggunakan username admin masuk ke menu *Apps*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/collab01.png)

Mengaktifkan *Collabora Online* yang berada di menu *Office & text*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/collab0.png)

Kemudian pindah ke menu *Settings* 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/collab02.png)

Konfigurasi *Collabora online* yang ada pada menu *Collabora Online >> Pilih Use your own server >> Input URL collabora onlie*, seperti gambar dibawah ini lalu *Save*

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/collab1.png)

Scroll ke bawah pada menu *Advanced settings* ceklist pada bagian *Use Office Open XML (OOMXML) instead of OpenDocument Format (ODF) by default for new files*. Dengan mengatur OOXML sebagai format default, sehingga file akan kompatibel dengan perangkat lunak Microsoft Office.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/collab2.png)

Uji coba collabora online denngan cara akses file docs, ppt, pdf dan power point jika hasilnya seperti gambar dibawah ini maka collobora online sudah berhasil terpasang di nextcloud Anda

- Tampilan membuka file docs menggunakan collabora

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/collab3.png)

- Tampilan membuka file pdf menggunakan collabora

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/collab4.png)

- Tampilan membuka file exel menggunakan collabora

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/collab5.png)

- Tampilan membuka file power point (ppt) menggunakan collabora

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/collab6.png)

Sampai disini Anda sudah berhasil install dan mengintegrasikan collabora online dengan Nextcloud. Apabila terdapat kendala pada saat mengikuti tutorial ini silakan ajukan komentar dibawah ya guys. 

Selamat mencoba 😁