---
title: Install SSL Letsencrypt di Zimbra Mail Server
description: 'Jika pada tutorial sebelumnya kita telah mengetahui tentang apa itu Zimbra Mail Server dan cara instalasinya, maka pada tutorial kali ini kita akan memasang sertifikat SSL Letsencrypt (gratis) di Zimbra Mail Server'
lang: id_ID
date: 2021-01-11 11:59 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/install ssl.png
categories:
 - Zimbra
 - mail-server
---

[Belajar Linux ID](https://belajarlinux.id) - Jika pada tutorial sebelumnya kita telah mengetahui tentang apa itu Zimbra Mail Server dan cara instalasinya, maka pada tutorial kali ini kita akan memasang sertifikat SSL Letsencrypt (gratis) di Zimbra Mail Server.

Untuk mengikuti tutorial ini pastikan Anda sudah melakukan instalasi Zimbra Mail Server. 

*Baca juga:*
*- [Pengenalan Zimbra](https://belajarlinux.id/pengenalan-zimbra/)*
*- [Install Zimbra Mail Server di Ubuntu 18.04 LTS](https://belajarlinux.id/install-zimbra-di-ubuntu-18.04/)*

SSL Letsencrypt disini menggunakan certbot, oleh karena itu mari install terlebih dahulu certbot, pada tutorial ini kami menggunakan sistem operasi Ubunut 18.04 LTS.

Tambahkan repository certbot

```bash
root@mail:~#
root@mail:~# apt install software-properties-common -y
root@mail:~# add-apt-repository universe
root@mail:~# add-apt-repository ppa:certbot/certbot
```

Update sistem operasi dan install certbot

```bash
root@mail:~# apt update
root@mail:~# apt install certbot -y
```

Selanjutnya masuk ke user zimbra 

```bash
root@mail:~#
root@mail:~# su zimbra
zimbra@mail:/root$
```

Stop terlebih dahulu service `proxy` dan `mailbox` zimbra menggunakan perintah berikut

```bash
zimbra@mail:/root$ zmproxyctl stop
Stopping proxy...done.
zimbra@mail:/root$ zmmailboxdctl stop
Stopping mailboxd...done.
zimbra@mail:/root$
zimbra@mail:/root$ exit
exit
root@mail:~#
```

Install SSL Letsencrypt menggunakan satu baris perintah berikut: 

```bash
root@mail:~#
root@mail:~# certbot certonly --standalone
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator standalone, Installer None
Enter email address (used for urgent renewal and security notices) (Enter 'c' to
cancel): admin@nurhamim.my.id

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Please read the Terms of Service at
https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf. You must
agree in order to register with the ACME server at
https://acme-v02.api.letsencrypt.org/directory
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(A)gree/(C)ancel: A

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Would you be willing to share your email address with the Electronic Frontier
Foundation, a founding partner of the Let's Encrypt project and the non-profit
organization that develops Certbot? We'd like to send you email about our work
encrypting the web, EFF news, campaigns, and ways to support digital freedom.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o: Y
Please enter in your domain name(s) (comma and/or space separated)  (Enter 'c'
to cancel): nurhamim.my.id
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for nurhamim.my.id
Waiting for verification...
Cleaning up challenges

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/nurhamim.my.id/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/nurhamim.my.id/privkey.pem
   Your cert will expire on 2021-04-20. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
 - Your account credentials have been saved in your Certbot
   configuration directory at /etc/letsencrypt. You should make a
   secure backup of this folder now. This configuration directory will
   also contain certificates and private keys obtained by Certbot so
   making regular backups of this folder is ideal.
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le

root@mail:~#
```

*Catatan: Silakan input email dan domain yang Anda gunakan untuk zimbra mail server, disini kami menggunakan domain nurhamim.my.id*

Untuk melihat file SSL Letsencrypt yang telah di generate sebelumnya dapat dilakukan seperti berikut

```bash
root@mail:~#
root@mail:~# cd /etc/letsencrypt/live/
root@mail:/etc/letsencrypt/live# ll
total 16
drwx------ 3 root root 4096 Jan 20 13:30 ./
drwxr-xr-x 9 root root 4096 Jan 20 13:30 ../
-rw-r--r-- 1 root root  740 Jan 20 13:30 README
drwxr-xr-x 2 root root 4096 Jan 20 13:30 nurhamim.my.id/
root@mail:/etc/letsencrypt/live#
```

Pindah ke direktori `nurhamim.my.id` dan buka file `chain.pem` dan tambahkan CA Intermediate letsencrypt yang dapat Anda unduh melalui link berikut: https://letsencrypt.org/certs/trustid-x3-root.pem.txt

```bash
root@mail:/etc/letsencrypt/live# cd nurhamim.my.id/
root@mail:/etc/letsencrypt/live/nurhamim.my.id#
root@mail:/etc/letsencrypt/live/nurhamim.my.id# vim chain.pem
```

Buat direktori lestencrypt di direktori zimbra SSL 

```bash
root@mail:/etc/letsencrypt/live/nurhamim.my.id# mkdir /opt/zimbra/ssl/letsencrypt
```

Copy semua file SSL `nurhamim.my.id` ke direktori diatas yang sudah dibuat menggunakan perintah `cp` dan berikan hak owner `zimbra` untuk direktori yang baru saja dibuat. 

```bash
root@mail:/etc/letsencrypt/live/nurhamim.my.id# cp /etc/letsencrypt/live/nurhamim.my.id/* /opt/zimbra/ssl/letsencrypt/
root@mail:/etc/letsencrypt/live/nurhamim.my.id# chown zimbra:zimbra /opt/zimbra/ssl/letsencrypt/*
root@mail:/etc/letsencrypt/live/nurhamim.my.id#
```

Selanjutnya login ke user `zimbra` dan pindah ke direktori letsencrypt. Pastikan file SSL sudah ada. 

```bash
root@mail:/etc/letsencrypt/live/nurhamim.my.id#
root@mail:/etc/letsencrypt/live/nurhamim.my.id# su zimbra
zimbra@mail:/etc/letsencrypt/live/nurhamim.my.id$ cd /opt/zimbra/ssl/letsencrypt/
zimbra@mail:~/ssl/letsencrypt$ ls
README  cert.pem  chain.pem  fullchain.pem  privkey.pem
zimbra@mail:~/ssl/letsencrypt$
```

Verifikasi SSL, pastikan semua hasilnya **OK**

```bash
zimbra@mail:~/ssl/letsencrypt$ /opt/zimbra/bin/zmcertmgr verifycrt comm privkey.pem cert.pem chain.pem
** Verifying 'cert.pem' against 'privkey.pem'
Certificate 'cert.pem' and private key 'privkey.pem' match.
** Verifying 'cert.pem' against 'chain.pem'
Valid certificate chain: cert.pem: OK
zimbra@mail:~/ssl/letsencrypt$
```

Selanjutnya copy file SSL letsencrypt ke direktori SSL zimbra

```bash
zimbra@mail:~/ssl/letsencrypt$
zimbra@mail:~/ssl/letsencrypt$ cp -a /opt/zimbra/ssl/zimbra /opt/zimbra/ssl/zimbra.$(date "+%Y%m%d")
zimbra@mail:~/ssl/letsencrypt$ cp /opt/zimbra/ssl/letsencrypt/privkey.pem /opt/zimbra/ssl/zimbra/commercial/commercial.key
```

Install SSL Zimbra 

```bash
zimbra@mail:~/ssl/letsencrypt$ /opt/zimbra/bin/zmcertmgr deploycrt comm cert.pem chain.pem
** Verifying 'cert.pem' against '/opt/zimbra/ssl/zimbra/commercial/commercial.key'
Certificate 'cert.pem' and private key '/opt/zimbra/ssl/zimbra/commercial/commercial.key' match.
** Verifying 'cert.pem' against 'chain.pem'
Valid certificate chain: cert.pem: OK
** Copying 'cert.pem' to '/opt/zimbra/ssl/zimbra/commercial/commercial.crt'
** Copying 'chain.pem' to '/opt/zimbra/ssl/zimbra/commercial/commercial_ca.crt'
** Appending ca chain 'chain.pem' to '/opt/zimbra/ssl/zimbra/commercial/commercial.crt'
** Importing cert '/opt/zimbra/ssl/zimbra/commercial/commercial_ca.crt' as 'zcs-user-commercial_ca' into cacerts '/opt/zimbra/common/lib/jvm/java/lib/security/cacerts'
** NOTE: restart mailboxd to use the imported certificate.
** Saving config key 'zimbraSSLCertificate' via zmprov modifyServer mail.nurhamim.my.id...ok
** Saving config key 'zimbraSSLPrivateKey' via zmprov modifyServer mail.nurhamim.my.id...ok
** Installing imapd certificate '/opt/zimbra/conf/imapd.crt' and key '/opt/zimbra/conf/imapd.key'
** Copying '/opt/zimbra/ssl/zimbra/commercial/commercial.crt' to '/opt/zimbra/conf/imapd.crt'
** Copying '/opt/zimbra/ssl/zimbra/commercial/commercial.key' to '/opt/zimbra/conf/imapd.key'
** Creating file '/opt/zimbra/ssl/zimbra/jetty.pkcs12'
** Creating keystore '/opt/zimbra/conf/imapd.keystore'
** Installing ldap certificate '/opt/zimbra/conf/slapd.crt' and key '/opt/zimbra/conf/slapd.key'
** Copying '/opt/zimbra/ssl/zimbra/commercial/commercial.crt' to '/opt/zimbra/conf/slapd.crt'
** Copying '/opt/zimbra/ssl/zimbra/commercial/commercial.key' to '/opt/zimbra/conf/slapd.key'
** Creating file '/opt/zimbra/ssl/zimbra/jetty.pkcs12'
** Creating keystore '/opt/zimbra/mailboxd/etc/keystore'
** Installing mta certificate '/opt/zimbra/conf/smtpd.crt' and key '/opt/zimbra/conf/smtpd.key'
** Copying '/opt/zimbra/ssl/zimbra/commercial/commercial.crt' to '/opt/zimbra/conf/smtpd.crt'
** Copying '/opt/zimbra/ssl/zimbra/commercial/commercial.key' to '/opt/zimbra/conf/smtpd.key'
** Installing proxy certificate '/opt/zimbra/conf/nginx.crt' and key '/opt/zimbra/conf/nginx.key'
** Copying '/opt/zimbra/ssl/zimbra/commercial/commercial.crt' to '/opt/zimbra/conf/nginx.crt'
** Copying '/opt/zimbra/ssl/zimbra/commercial/commercial.key' to '/opt/zimbra/conf/nginx.key'
** NOTE: restart services to use the new certificates.
** Cleaning up 3 files from '/opt/zimbra/conf/ca'
** Removing /opt/zimbra/conf/ca/ca.key
** Removing /opt/zimbra/conf/ca/ca.pem
** Removing /opt/zimbra/conf/ca/7544d7d8.0
** Copying CA to /opt/zimbra/conf/ca
** Copying '/opt/zimbra/ssl/zimbra/ca/ca.key' to '/opt/zimbra/conf/ca/ca.key'
** Copying '/opt/zimbra/ssl/zimbra/ca/ca.pem' to '/opt/zimbra/conf/ca/ca.pem'
** Creating CA hash symlink '7544d7d8.0' -> 'ca.pem'
** Creating /opt/zimbra/conf/ca/commercial_ca_1.crt
** Creating CA hash symlink '8d33f237.0' -> 'commercial_ca_1.crt'
** Creating /opt/zimbra/conf/ca/commercial_ca_2.crt
** Creating CA hash symlink '2e5ac55d.0' -> 'commercial_ca_2.crt'
zimbra@mail:~/ssl/letsencrypt$
```

Langkah selanjutnya restart service `zimbra`

```bash
zimbra@mail:~/ssl/letsencrypt$ zmcontrol restart
Host mail.nurhamim.my.id
        Stopping zmconfigd...Done.
        Stopping imapd...Done.
        Stopping zimlet webapp...Done.
        Stopping zimbraAdmin webapp...Done.
        Stopping zimbra webapp...Done.
        Stopping service webapp...Done.
        Stopping stats...Done.
        Stopping mta...Done.
        Stopping spell...Done.
        Stopping snmp...Done.
        Stopping cbpolicyd...Done.
        Stopping archiving...Done.
        Stopping opendkim...Done.
        Stopping amavis...Done.
        Stopping antivirus...Done.
        Stopping antispam...Done.
        Stopping proxy...Done.
        Stopping memcached...Done.
        Stopping mailbox...Done.
        Stopping logger...Done.
        Stopping dnscache...Done.
        Stopping ldap...Done.
Host mail.nurhamim.my.id
        Starting ldap...Done.
Unable to start TLS: hostname verification failed when connecting to ldap master.
zimbra@mail:~/ssl/letsencrypt$
```

Jika Anda mendapatkan pesan error `Unable to start TLS: hostname verification failed when connecting to ldap master.` Jalankan perintah berikut: 

```bash
zimbra@mail:~/ssl/letsencrypt$
zimbra@mail:~/ssl/letsencrypt$ zmlocalconfig -e ldap_starttls_required=false
zimbra@mail:~/ssl/letsencrypt$ zmlocalconfig -e ldap_starttls_supported=0
zimbra@mail:~/ssl/letsencrypt$
```

Kemudian, restart ulang service `zimbra` 

```bash
zimbra@mail:~/ssl/letsencrypt$ zmcontrol restart
Host mail.nurhamim.my.id
        Stopping zmconfigd...Done.
        Stopping imapd...Done.
        Stopping zimlet webapp...Done.
        Stopping zimbraAdmin webapp...Done.
        Stopping zimbra webapp...Done.
        Stopping service webapp...Done.
        Stopping stats...Done.
        Stopping mta...Done.
        Stopping spell...Done.
        Stopping snmp...Done.
        Stopping cbpolicyd...Done.
        Stopping archiving...Done.
        Stopping opendkim...Done.
        Stopping amavis...Done.
        Stopping antivirus...Done.
        Stopping antispam...Done.
        Stopping proxy...Done.
        Stopping memcached...Done.
        Stopping mailbox...Done.
        Stopping logger...Done.
        Stopping dnscache...Done.
        Stopping ldap...Done.
Host mail.nurhamim.my.id
        Starting ldap...Done.
        Starting zmconfigd...Done.
        Starting logger...Done.
        Starting mailbox...Done.
        Starting memcached...Done.
        Starting proxy...Done.
        Starting amavis...Done.
        Starting antispam...Done.
        Starting antivirus...Done.
        Starting opendkim...Done.
        Starting snmp...Done.
        Starting spell...Done.
        Starting mta...Done.
        Starting stats...Done.
        Starting service webapp...Done.
        Starting zimbra webapp...Done.
        Starting zimbraAdmin webapp...Done.
        Starting zimlet webapp...Done.
        Starting imapd...Done.
zimbra@mail:~/ssl/letsencrypt$
```

Sekarang silakan start kembali `proxy` dan `mailbox` zimbra

```bash
zimbra@mail:~/ssl/letsencrypt$ zmproxyctl start
Starting proxy...proxy is already running.
zimbra@mail:~/ssl/letsencrypt$ zmmailboxdctl start
mailboxd already running.
zimbra@mail:~/ssl/letsencrypt$
```

Keluar dari user zimbra

```bash
zimbra@mail:~/ssl/letsencrypt$ exit
exit
root@mail:/etc/letsencrypt/live/nurhamim.my.id#
```

Verifikasi SSL yang sudah diinstall melalui browser

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/zs1.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/zs2.png)

Terlihat gambar diatas saat ini Zimbra Mail Server Anda sudah terpasang sertifikat SSL Letsencrypt. 

Jika terdapat kendala dalam pemasangan sertifikat SSL silakan komentar dibawah ya. 

Selamat mencoba 😁