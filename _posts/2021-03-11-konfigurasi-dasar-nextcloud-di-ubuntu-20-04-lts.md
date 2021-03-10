---
title: Konfigurasi Dasar Nextcloud di Ubuntu 20.04 LTS
description: 'NextCloud adalah solusi penyimpanan cloud self-host open source gratis, secara fungsional mirip dengan Dropbox, Google Drive dan lain-lain'
lang: id_ID
date: 2021-03-11 06:22 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/kofigdasar-nextcloud.png
categories:
 - nextcloud
 - ubuntu
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini merupakan kelanjutan dari tutorial sebelumnya tentang instalasi nextcloud di Ubuntu 20.04 LTS, dimana pada tutorial kali ini akan membahas sedikit dasar konfigurasi nextcloud 20.0.4 dimana setelah melakukan instalasi nextcloud terdapat beberapa warning yang perlu di solved tentunya demi keamaan dan yang lainnya. 

*Baca juga: [Install Nextcloud di Ubuntu 20.04 LTS](https://belajarlinux.id/install-nextcloud-di-ubuntu-20-04-lts/)*

Berikut beberapa konfigurasi dasar yang perlu dilakukan di nextcloud: 

## Konfigurasi Email Notifikasi di Nextcloud

Sebenarnya untuk konfigurasi ini bersifat optional dengan demikian jika memang Anda tidak terlalu membutuhkan notifikasi maka bisa di skip saja dan lanjut ke konfigurasi yang lainnya. Untuk melakukan konfigurasi email notifikasi di nextcloud cukup mudah masuk ke menu *Settings >> Personal Info >> Email >> Input email dan data personal lainnya jika dibutuhkan* 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/nextc-co1.png)

Kemudian pindah ke menu *Settings >> Basic setttings* disini Anda akan menemukan pengaturan server email. Ada dua mode pengiriman email yaitu menggunakan *sendmail* dan *smtp*. Anda dapat memilih mode *sendmail* jika host NextCloud Anda menjalankan server *SMTP*.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/sendmail-netc.png)

Jika Anda ingin menggunakan server SMTP yang berjalan di host lain, pilih mode smtp dan masukkan alamat server SMTP dan kredensial login seperti di bawah ini. Pilih STARTTLS untuk enkripsi.

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/nextc-co2.png)

## Meningkatkan Memory Limit PHP

Secara default PHP memory limit adalah 128MB. NextCloud merekomendasikan 512MB untuk kinerja yang lebih baik. Untuk mengubah memori limit PHP dapat dilakukan dengan cara edit file *php.ini*.

```bash
ubuntu@lemp-belajarlinux:~$ sudo sed -i 's/memory_limit = 128M/memory_limit = 512M/g' /etc/php/7.4/fpm/php.ini
ubuntu@lemp-belajarlinux:~$ cat /etc/php/7.4/fpm/php.ini |grep memory_limit
memory_limit = 512M
ubuntu@lemp-belajarlinux:~$
```

Reload php-fpm

```bash
ubuntu@lemp-belajarlinux:~$ sudo systemctl reload php7.4-fpm
```

## Menyiapkan PHP Query System Environment Variables

Hilangkan tanda ***;*** yang berada pada *www.conf*, gunakan perintah berikut:

```bash
ubuntu@lemp-belajarlinux:~$ sudo sed -i 's/;clear_env = no/clear_env = no/g' /etc/php/7.4/fpm/pool.d/www.conf
ubuntu@lemp-belajarlinux:~$ cat /etc/php/7.4/fpm/pool.d/www.conf |grep clear_env
clear_env = no
ubuntu@lemp-belajarlinux:~$
```

Reload php-fpm

```bash
ubuntu@lemp-belajarlinux:~$ sudo systemctl reload php7.4-fpm
```

## Meningkatkan Size Limit Upload File

Secara default maksimum upload file di nginx yaitu 1MB. Untuk memungkinkan mengunggah file besar ke server NextCloud Anda, edit file konfigurasi Nginx dan php.ini.

```bash
ubuntu@lemp-belajarlinux:~$ sudo sed -i 's/client_max_body_size = 512M/client_max_body_size = 1024M/g' /etc/nginx/conf.d/nextcloud.conf
ubuntu@lemp-belajarlinux:~$ cat /etc/nginx/conf.d/nextcloud.conf |grep client_max_body
    client_max_body_size 512M;
ubuntu@lemp-belajarlinux:~$
```

```bash
ubuntu@lemp-belajarlinux:~$ sudo sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 1024M/g' /etc/php/7.4/fpm/php.ini
ubuntu@lemp-belajarlinux:~$ cat /etc/php/7.4/fpm/php.ini |grep upload_max_filesize
upload_max_filesize = 1024M
ubuntu@lemp-belajarlinux:~$
```

Reload nginx dan php-fpm

```bash
ubuntu@lemp-belajarlinux:~$ sudo systemctl reload nginx
ubuntu@lemp-belajarlinux:~$ sudo systemctl reload php7.4-fpm
ubuntu@lemp-belajarlinux:~$
```

## Konfigurasi Cache Menggunakan Redis Di Nextcloud

Jika Anda ke menu *Nextcloud settings >> Overwiew*, Anda akan menemukan warning atau peringatan berikut:

### Warning Pertama

> ```
> No memory cache has been configured. To enhance your performance please configure a memcache if available.
> ```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/war-02.png)

Warning tersebut dikarenakan tidak adanya cache memory di nextcloud. Kami akan mengaktifkan cache memori untuk nextcloud menggunakan Redis. Silakan install server Redis di host Nextcloud Anda dengan cara menjalankan perintah berikut: 

```bash
ubuntu@lemp-belajarlinux:~$ sudo apt install redis-server
```

Cek versi redis server yang terinstall 

```bash
ubuntu@lemp-belajarlinux:~$ redis-server -v
Redis server v=5.0.7 sha=00000000:0 malloc=jemalloc-5.2.1 bits=64 build=636cde3b5c7a3923
ubuntu@lemp-belajarlinux:~$
```

Cek status redis server

```bash
ubuntu@lemp-belajarlinux:~$ sudo systemctl status redis
● redis-server.service - Advanced key-value store
     Loaded: loaded (/lib/systemd/system/redis-server.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2021-03-03 10:23:02 UTC; 39s ago
       Docs: http://redis.io/documentation,
             man:redis-server(1)
   Main PID: 57718 (redis-server)
      Tasks: 4 (limit: 2344)
     Memory: 1.9M
     CGroup: /system.slice/redis-server.service
             └─57718 /usr/bin/redis-server 127.0.0.1:6379

Mar 03 10:23:02 lemp-belajarlinux.id systemd[1]: Starting Advanced key-value store...
Mar 03 10:23:02 lemp-belajarlinux.id systemd[1]: redis-server.service: Can't open PID file /run/redis/redis-server.pid (yet?) after start: Operatio>
Mar 03 10:23:02 lemp-belajarlinux.id systemd[1]: Started Advanced key-value store.
```

Start dan Enable service redis server

```bash
ubuntu@lemp-belajarlinux:~$ sudo systemctl start redis-server
ubuntu@lemp-belajarlinux:~$ sudo systemctl enable redis-server
Synchronizing state of redis-server.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable redis-server
ubuntu@lemp-belajarlinux:~$
```

Untuk melakukan konfigurasi redis sebagai cache untuk nextcloud kita perlu install terlebih dahulu *ekstensi php redis*

```bash
ubuntu@lemp-belajarlinux:~$ sudo apt install php-redis
```

Cek *ekstensi php-redis* sudah aktif menggunakan perintah

```bash
ubuntu@lemp-belajarlinux:~$ php --ri redis
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/nextc-co4.png)

Apabila sudah aktif, selanjutnya konfigurasi cache redis pada nextcloud 

```bash
ubuntu@lemp-belajarlinux:~$ sudo vim /usr/share/nginx/nextcloud/config/config.php
```

Tambahkan konfigurasi berikut pada default konfigurasi nextcloud

```bash
'memcache.distributed' => '\OC\Memcache\Redis',
'memcache.local' => '\OC\Memcache\Redis',
'memcache.locking' => '\OC\Memcache\Redis',
'redis' => array(
     'host' => 'localhost',
     'port' => 6379,
     ),
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/nextc-co5.png)

Jika sudah silakan restart service nginx dan php-fpm

```bash
ubuntu@lemp-belajarlinux:~$ sudo systemctl restart nginx php7.4-fpm
```

### Warning Kedua

> ```
> The database is missing some indexes. Due to the fact that adding indexes on big tables could take some time they were not added automatically.
> ```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/war-01.png)

Warning diatas karena terdapat missing indexes di direktori nextcloud, solusinya yaitu menambahkan indexes di webroot direktory nextcloud

```bash
ubuntu@lemp-belajarlinux:~$ cd /usr/share/nginx/nextcloud/
```

Jalankan perintah berikut untuk menambahkan indexes ke database nextcloud.

```bash
ubuntu@lemp-belajarlinux:/usr/share/nginx/nextcloud$ sudo -u www-data php occ db:add-missing-indices
Check indices of the share table.
Check indices of the filecache table.
Check indices of the twofactor_providers table.
Check indices of the login_flow_v2 table.
Check indices of the whats_new table.
Check indices of the cards table.
Adding cards_abiduri index to the cards table, this can take some time...
cards table updated successfully.
Check indices of the cards_properties table.
Check indices of the calendarobjects_props table.
Check indices of the schedulingobjects table.
Check indices of the oc_properties table.
ubuntu@lemp-belajarlinux:/usr/share/nginx/nextcloud$
```

Jika terdapat pesan warning seperti berikut: 

> ```
> Some columns in the database are missing a conversion to big int. Due to the fact that changing column types on big tables could take some time they were not changed automatically.
> ```

Maka Anda perlu mengubah jenis kolom secara manual. Pindah ke direktori webroot nextcloud.

```bash
ubuntu@lemp-belajarlinux:~$ cd /usr/share/nginx/nextcloud/
```

Ubah nextcloud Anda ke mode **_maintenance_** untuk mencegah pengguna masuk dan membuat perubahan.

```bash
ubuntu@lemp-belajarlinux:/usr/share/nginx/nextcloud$ sudo -u www-data php occ maintenance:mode --on
Maintenance mode enabled
ubuntu@lemp-belajarlinux:/usr/share/nginx/nextcloud$
```

Kemudian jalankan perintah berikut untuk mengubah jenis kolom.

```bash
ubuntu@lemp-belajarlinux:/usr/share/nginx/nextcloud$ sudo -u www-data php occ db:convert-filecache-bigint
Nextcloud is in maintenance mode - no apps have been loaded

All tables already up to date!
ubuntu@lemp-belajarlinux:/usr/share/nginx/nextcloud$
```

Setelah selesai, disable mode **_maintenance_**.

```bash
ubuntu@lemp-belajarlinux:/usr/share/nginx/nextcloud$ sudo -u www-data php occ maintenance:mode --off
```

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/nextc-co6.png)

Selanjutnya silakan refrest kembali page *settings >> overview* pastikan sudah tidak ada warning kembali seperti gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/nextc-co7.png)

Sampai disini Anda sudah berhasil menerapkan konfigurasi dasar di nextcloud Anda. 

Selamat mencoba 😁