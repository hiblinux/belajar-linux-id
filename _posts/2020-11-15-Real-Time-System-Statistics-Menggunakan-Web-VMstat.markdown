---
author: nurhamim
layout: post
title: 'Linux: Real Time System Statistics (Memory, CPU, Processess, etc) Menggunakan Web VMstat'
description: 'cara install web vmstat yaaa web vmstat sama dengan vmstat di linux perbedaannya web vmstat dapat di akses melalui browser dan public tentunya akan menampilkan grafik seperti layak nya monitoring di web stat yang akan ditampilkan antara lain penggunaan memory, cpu, process, swap, io dan system'
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/d26.png'
featured: true
date: '2020-11-15 02:20:07'
categories:
- linux
- centos
---

[Belajar Linux ID](/) - &nbsp;Tutorial kali ini kita akan membahas mengenai bagaimana cara install `web vmstat` yaaa `web vmstat` sama dengan `vmstat` di linux perbedaannya `web vmstat` dapat di akses melalui browser dan public tentunya akan menampilkan grafik seperti layak nya monitoring di `web stat` yang akan ditampilkan antara lain penggunaan `memory, cpu, process, swap, io` dan `system`.

_(Baca juga: **[Linux: Mengenal vmstat](/linux-mengenal-vmstat/)**)_

<!--kg-card-begin: html--><script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script><ins class="adsbygoogle" style="display:block; text-align:center;" data-ad-layout="in-article" data-ad-format="fluid" data-ad-client="ca-pub-1515372853161377" data-ad-slot="4684565489"></ins><script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script><!--kg-card-end: html-->

Sebelum melakukan instalasi `web vmstat` kita install terlebih dahulu utilisasi yang dibutuhkan untuk mendukung instalasi `web vmstat` berikut

<!--kg-card-begin: markdown-->

    [root@jumpwjv ~]#
    [root@jumpwjv ~]# yum install wget vim unzip -y

<!--kg-card-end: markdown-->

Unduh `web-vmstat` melalui repository berikt: [https://github.com/joewalnes/web-vmstats](https://github.com/joewalnes/web-vmstats) atau Anda dapat unduh menggunakan wget

<!--kg-card-begin: markdown-->

    [root@jumpwjv ~]# wget https://github.com/joewalnes/web-vmstats/archive/master.zip
    --2020-11-15 00:55:06-- https://github.com/joewalnes/web-vmstats/archive/master.zip
    Resolving github.com (github.com)... 13.229.188.59
    Connecting to github.com (github.com)|13.229.188.59|:443... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: https://codeload.github.com/joewalnes/web-vmstats/zip/master [following]
    --2020-11-15 00:55:06-- https://codeload.github.com/joewalnes/web-vmstats/zip/master
    Resolving codeload.github.com (codeload.github.com)... 13.250.162.133
    Connecting to codeload.github.com (codeload.github.com)|13.250.162.133|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: unspecified [application/zip]
    Saving to: 'master.zip'
    
        [<=>] 135,179 294KB/s in 0.4s
    
    2020-11-15 00:55:07 (294 KB/s) - 'master.zip' saved [135179]
    
    [root@jumpwjv ~]#

<!--kg-card-end: markdown-->

Unzip dan pindah ke direktori `web vmstat`

<!--kg-card-begin: markdown-->

    [root@jumpwjv ~]#
    [root@jumpwjv ~]# unzip master.zip
    Archive: master.zip
    a9646c6f6837f02404251fed067160e4ac504a2a
       creating: web-vmstats-master/
     extracting: web-vmstats-master/.gitignore
      inflating: web-vmstats-master/LICENSE
      inflating: web-vmstats-master/README.md
      inflating: web-vmstats-master/run
      inflating: web-vmstats-master/screenshot.png
       creating: web-vmstats-master/web/
      inflating: web-vmstats-master/web/index.html
       creating: web-vmstats-master/web/js/
      inflating: web-vmstats-master/web/js/chroma.min.js
      inflating: web-vmstats-master/web/js/jquery-2.0.3.min.js
      inflating: web-vmstats-master/web/js/reconnecting-websocket.js
      inflating: web-vmstats-master/web/js/smoothie.js
      inflating: web-vmstats-master/web/js/sugar-1.4.1.min.js
      inflating: web-vmstats-master/web/stats.css
      inflating: web-vmstats-master/web/stats.js
    [root@jumpwjv ~]#
    [root@jumpwjv ~]# cd web-vmstats-master/
    [root@jumpwjv web-vmstats-master]#

<!--kg-card-end: markdown-->

Selanjutnya membuat direktori dan copy data yang ada di `web-vmstat-master` ke diretori yang Anda buat

<!--kg-card-begin: markdown-->

    [root@jumpwjv web-vmstats-master]# mkdir /opt/web_vmstats
    [root@jumpwjv web-vmstats-master]# cp -r web/* /opt/web_vmstats/
    [root@jumpwjv web-vmstats-master]# ls /opt/web_vmstats/
    index.html js stats.css stats.js
    [root@jumpwjv web-vmstats-master]#

<!--kg-card-end: markdown-->

Langkah selanjutnya adalah unduh dan install program streaming **[websocketd.](https://github.com/joewalnes/websocketd/wiki/Download-and-install)** Buka halaman WebSocket resmi dan unduh paket agar sesuai dengan arsitektur sistem Anda (Linux 64-bit, 32-bit atau ARM).

<!--kg-card-begin: markdown-->
#### 32-bit System

    # wget https://github.com/joewalnes/websocketd/releases/download/v0.2.9/websocketd-0.2.9-linux_386.zip

#### 64-bit System

    # wget https://github.com/joewalnes/websocketd/releases/download/v0.2.9/websocketd-0.2.9-linux_amd64.zip

<!--kg-card-end: markdown-->

Disini kami menggunakan `64-bit system` silakan gunakan wget untuk mengunduhnya seperti berikut

<!--kg-card-begin: markdown-->

    [root@jumpwjv web-vmstats-master]#
    [root@jumpwjv web-vmstats-master]# pwd
    /root/web-vmstats-master
    [root@jumpwjv web-vmstats-master]#
    [root@jumpwjv web-vmstats-master]# wget https://github.com/joewalnes/websocketd/releases/download/v0.2.9/websocketd-0.2.9-linux_amd64.zip
    --2020-11-15 00:57:40-- https://github.com/joewalnes/websocketd/releases/download/v0.2.9/websocketd-0.2.9-linux_amd64.zip
    Resolving github.com (github.com)... 13.250.177.223
    Connecting to github.com (github.com)|13.250.177.223|:443... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: https://github-production-release-asset-2e65be.s3.amazonaws.com/8201256/57ee6620-e7a7-11e3-8ab0-071e25c28ad7?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20201115%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20201115T005740Z&X-Amz-Expires=300&X-Amz-Signature=8866d9bfc9e8dfaa5b7fb3886448ada3a887a3472e14511fa2a7d9c865e78500&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=8201256&response-content-disposition=attachment%3B%20filename%3Dwebsocketd-0.2.9-linux_amd64.zip&response-content-type=application%2Foctet-stream [following]
    --2020-11-15 00:57:40-- https://github-production-release-asset-2e65be.s3.amazonaws.com/8201256/57ee6620-e7a7-11e3-8ab0-071e25c28ad7?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20201115%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20201115T005740Z&X-Amz-Expires=300&X-Amz-Signature=8866d9bfc9e8dfaa5b7fb3886448ada3a887a3472e14511fa2a7d9c865e78500&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=8201256&response-content-disposition=attachment%3B%20filename%3Dwebsocketd-0.2.9-linux_amd64.zip&response-content-type=application%2Foctet-stream
    Resolving github-production-release-asset-2e65be.s3.amazonaws.com (github-production-release-asset-2e65be.s3.amazonaws.com)... 52.216.0.48
    Connecting to github-production-release-asset-2e65be.s3.amazonaws.com (github-production-release-asset-2e65be.s3.amazonaws.com)|52.216.0.48|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 2211144 (2.1M) [application/octet-stream]
    Saving to: 'websocketd-0.2.9-linux_amd64.zip'
    
    100%[=======================================================================>] 2,211,144 1.20MB/s in 1.8s
    
    2020-11-15 00:57:43 (1.20 MB/s) - 'websocketd-0.2.9-linux_amd64.zip' saved [2211144/2211144]
    
    [root@jumpwjv web-vmstats-master]#

<!--kg-card-end: markdown-->

Unzip data `websocketd` dan copy file binary ke `system executable`

<!--kg-card-begin: markdown-->

    [root@jumpwjv web-vmstats-master]# unzip websocketd-0.2.9-linux_amd64.zip
    [root@jumpwjv web-vmstats-master]# cp websocketd /usr/bin/

<!--kg-card-end: markdown-->

Testing `web vmstat` dengan cara menjalankan `websocketd` berikut

<!--kg-card-begin: markdown-->

    [root@jumpwjv web-vmstats-master]#
    [root@jumpwjv web-vmstats-master]# websocketd --port=8080 --staticdir=/opt/web_vmstats/ /usr/bin/vmstat -n 1
    Sun, 15 Nov 2020 01:00:00 +0000 | INFO | server | | Serving using application : /usr/bin/vmstat -n 1
    Sun, 15 Nov 2020 01:00:00 +0000 | INFO | server | | Serving static content from : /opt/web_vmstats/
    Sun, 15 Nov 2020 01:00:00 +0000 | INFO | server | | Starting WebSocket server : ws://:8080/
    Sun, 15 Nov 2020 01:00:00 +0000 | INFO | server | | Serving CGI or static files : http://:8080/

<!--kg-card-end: markdown--><!--kg-card-begin: html--><script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script><ins class="adsbygoogle" style="display:block; text-align:center;" data-ad-layout="in-article" data-ad-format="fluid" data-ad-client="ca-pub-1515372853161377" data-ad-slot="4684565489"></ins><script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script><!--kg-card-end: html-->

Deskripsi setiap parameter diatas sebagai berikut:

- **--Port = 8080:** Port yang digunakan untuk terhubung pada protokol HTTP - Anda dapat menggunakan nomor port yang Anda inginkan.
- **--Staticdir = /opt/web\_vmstats/:** Jalur tempat semua file web Web-Vmstat dihosting.
- **/usr/bin/vmstat -n 1:** Perintah Linux Vmstat yang memperbarui statusnya setiap detik. Terlihat diatas `web vmstat` sudah running.

Selanjutnya kita akan membuat bash script, script ini sebenarnya hanya opsional dan hanya sistem yang support `script init`. Untuk mengelola `Websocket` sebagai daemon sistem, sebagai berikut

<!--kg-card-begin: markdown-->

    [root@jumpwjv web-vmstats-master]#
    [root@jumpwjv web-vmstats-master]# vim /etc/init.d/web-vmstats

###### Isi File Bash nya

    #!/bin/sh
    # source function library
    . /etc/rc.d/init.d/functions
    start() {
                    echo "Starting webvmstats process..."
    
    /usr/bin/websocketd --port=8080 --staticdir=/opt/web_vmstats/ /usr/bin/vmstat -n 1 &
    }
    
    stop() {
                    echo "Stopping webvmstats process..."
                    killall websocketd
    }
    
    case "$1" in
        start)
           start
            ;;
        stop)
           stop
            ;;
        *)
            echo "Usage: stop start"
            ;;
    esac

<!--kg-card-end: markdown-->

Selanjutnya jika sudah silakan berikan hak akses execute ke file `web-vmstat` yang berada di `init.d` dan silakan start `web-vmstats` seperti berikut

<!--kg-card-begin: markdown-->

    [root@jumpwjv web-vmstats-master]#
    [root@jumpwjv web-vmstats-master]# chmod +x /etc/init.d/web-vmstats
    [root@jumpwjv web-vmstats-master]# /etc/init.d/web-vmstats start
    Reloading systemd: [OK]
    Starting web-vmstats (via systemctl): [OK]
    [root@jumpwjv web-vmstats-master]#

<!--kg-card-end: markdown-->

Apabila sudah running, selanjutnya Anda dapat akses IP server Anda beserta port 8080 seperti berikut: http://IP\_server:8080

<figure class="kg-card kg-image-card kg-width-wide"><img src="/content/images/2020/11/web-vmstats.png" class="kg-image" alt srcset="/content/images/size/w600/2020/11/web-vmstats.png 600w, /content/images/2020/11/web-vmstats.png 869w"></figure>

Selamat mencoba ????

<!--kg-card-begin: html--><script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script><ins class="adsbygoogle" style="display:block; text-align:center;" data-ad-layout="in-article" data-ad-format="fluid" data-ad-client="ca-pub-1515372853161377" data-ad-slot="4684565489"></ins><script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script><!--kg-card-end: html-->
