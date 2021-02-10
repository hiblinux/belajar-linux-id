---
title: Install Zimbra Mail Server di Ubuntu 18.04 LTS
description: 'Instalasi Zimbra dapat dilakukan di single server atau multi server. Sebelum masuk ke tahapan instalasi Zimbra pastikan Anda sudah memenuhi persyaratan yang dibutuhkan untuk instalasi Zimbra pada link berikut'
lang: id_ID
date: 2021-02-10 20:26 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/install%20zimbra.png
categories:
 - Zimbra
 - mail-server
---

[Belajar Linux ID](https://belajarlinux.id) - Untuk mengikuti tutorial instalasi Zimbra Mail Server ada baiknya Anda mempelajari tentang apa itu Zimbra yang dapat Anda lihat pada link berikut: [Pengenalan Zimbra](https://belajarlinux.id/pengenalan-zimbra/). 

Instalasi Zimbra dapat dilakukan di single server atau multi server. Sebelum masuk ke tahapan instalasi Zimbra pastikan Anda sudah memenuhi persyaratan yang dibutuhkan untuk instalasi Zimbra pada link berikut: [Installation Prerequisites](https://wiki.zimbra.com/wiki/Zimbra_Releases/8.7.0/Single_Server_Installation).

Berikut tahapan instalasi Zimbra Mail Server di Ubuntu 18.04 LTS: 

Langkah pertama yang harus dilakukan yaitu login ke VM atau VPS yang Anda gunakan. Selanjutnya atur hostname VM/VPS Anda menggunakan `command` berikut: 

```bash
root@hamim-mail:~# hostnamectl set-hostname mail.nurhamim.my.id
root@hamim-mail:~#
```

*Keterangan: Silakan sesuaikan dengan hostname yang Anda inginkan, disini kami menggunakan domain nurhamim.my.id, pastikan hostname yang digunakan FQDN (Full Qualified Domain Name).*

Cek hostname yang sudah di konfigurasi

```bash
root@mail:~# hostnamectl
   Static hostname: mail.nurhamim.my.id
         Icon name: computer-vm
           Chassis: vm
        Machine ID: 6e146c4bbcb54fb19b1c08934e40e0ed
           Boot ID: 4abab84866b844219a6d787273077004
    Virtualization: kvm
  Operating System: Ubuntu 18.04 LTS
            Kernel: Linux 4.15.0-23-generic
      Architecture: x86-64
root@mail:~#
```

Menambahkan `hosts` untuk memetakan IP VM/VPS dengan hostname yang diatas

```bash
root@mail:~# vim /etc/hosts

127.0.0.1 localhost
103.xx.xx.154 mail.nurhamim.my.id
```

Update sistem operasi Ubuntu 18.04 LTS Anda. 

```bash
root@mail:~# apt update
```

Unduh file Zimbra melalui link berikut: [Zimbra Collaboration – Open Source Edition](https://www.zimbra.com/downloads/zimbra-collaboration-open-source/archives/)

Atau Anda dapat menggunakan command `wget` berikut: 

```bash
root@mail:~# wget https://files.zimbra.com/downloads/8.8.15_GA/zcs-8.8.15_GA_3869.UBUNTU18_64.20190918004220.tgz
--2021-01-20 12:48:02--  https://files.zimbra.com/downloads/8.8.15_GA/zcs-8.8.15_GA_3869.UBUNTU18_64.20190918004220.tgz
Resolving files.zimbra.com (files.zimbra.com)... 13.226.57.200
Connecting to files.zimbra.com (files.zimbra.com)|13.226.57.200|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 244166518 (233M) [binary/octet-stream]
Saving to: ‘zcs-8.8.15_GA_3869.UBUNTU18_64.20190918004220.tgz’

zcs-8.8.15_GA_3869.UBUNTU18_64.2019 100%[================================================================>] 232.85M  21.9MB/s    in 12s

2021-01-20 12:48:14 (19.8 MB/s) - ‘zcs-8.8.15_GA_3869.UBUNTU18_64.20190918004220.tgz’ saved [244166518/244166518]

root@mail:~#
```

*Keterangan: Disini kami menggunakan Zimbra Edisi Open Source dan versi yang digunakan yaitu 8.8.15*

Ekstrack file Zimbra yang sudah di unduh sebelumnya

```bash
root@mail:~#
root@mail:~# tar xfz zcs-8.8.15_GA_3869.UBUNTU18_64.20190918004220.tgz
```

Ubah nama folder Zimbra menggunakan perintah `mv`

```bash
root@mail:~#
root@mail:~# mv zcs-8.8.12_GA_3794.UBUNTU18_64.20190329045002 zimbra
```

Pindah ke direktori `zimbra` 

```bash
root@mail:~# cd zimbra/
root@mail:~/zimbra#
```

Untuk instalasi zimbra jalankan perintah berikut: 

```bash
root@mail:~/zimbra#
root@mail:~/zimbra# ./install.sh --platform-override
```

Selanjutnya akan ada pertanyaan apakah Anda menyetujui  agremeent license zimbra, ketikan perintah `y` 

```bash
Do you agree with the terms of the software license agreement? [N] y

Use Zimbra's package repository [Y]

Warning: apt-key output should not be parsed (stdout is not a terminal)
Importing Zimbra GPG key

Configuring package repository

Checking for installable packages

Found zimbra-core (local)
Found zimbra-ldap (local)
Found zimbra-logger (local)
Found zimbra-mta (local)
Found zimbra-dnscache (local)
Found zimbra-snmp (local)
Found zimbra-store (local)
Found zimbra-apache (local)
Found zimbra-spell (local)
Found zimbra-memcached (repo)
Found zimbra-proxy (local)
Found zimbra-drive (repo)
Found zimbra-imapd (local)
Found zimbra-patch (repo)
Found zimbra-mta-patch (repo)
Found zimbra-proxy-patch (repo)


Select the packages to install

Install zimbra-ldap [Y]

Install zimbra-logger [Y]

Install zimbra-mta [Y]

Install zimbra-dnscache [Y] n

Install zimbra-snmp [Y]

Install zimbra-store [Y]

Install zimbra-apache [Y]

Install zimbra-spell [Y]

Install zimbra-memcached [Y]

Install zimbra-proxy [Y]

Install zimbra-drive [Y]

Install zimbra-imapd (BETA - for evaluation only) [N] y

Install zimbra-chat [Y]
Checking required space for zimbra-core
Checking space for zimbra-store
Checking required packages for zimbra-store
zimbra-store package check complete.

Installing:
    zimbra-core
    zimbra-ldap
    zimbra-logger
    zimbra-mta
    zimbra-snmp
    zimbra-store
    zimbra-apache
    zimbra-spell
    zimbra-memcached
    zimbra-proxy
    zimbra-drive
    zimbra-imapd
    zimbra-patch
    zimbra-mta-patch
    zimbra-proxy-patch
    zimbra-chat
```

Selanjutnya klik `y,` untuk melanjutkan instalasi. 

```bash
The system will be modified.  Continue? [N] y

Running Post Installation Configuration:
Operations logged to /tmp/zmsetup.20210120-125708.log
Installing LDAP configuration database...done.
Setting defaults...
```

Selanjutnya, apabila Anda menemukan `ERROR DNS` pastikan sudah menambahkan hosts dengan benar, dan silakan input nama domain yang ingin Anda gunakan, disini kami menggunakan domain `nurhamim.my.id` untuk instalasi mail server Zimbra. 

```bash
DNS ERROR resolving MX for mail.nurhamim.my.id
It is suggested that the domain name have an MX record configured in DNS
Change domain name? [Yes] Yes
Create domain: [mail.nurhamim.my.id] nurhamim.my.id
        MX: mail.nurhamim.my.id (103.89.2.154)
        MX: mail.nurhamim.my.id (10.36.36.17)

        Interface: 127.0.0.1
        Interface: ::1
        Interface: 10.36.36.17
done.
Checking for port conflicts

Main menu

   1) Common Configuration:
   2) zimbra-ldap:                             Enabled
   3) zimbra-logger:                           Enabled
   4) zimbra-mta:                              Enabled
   5) zimbra-snmp:                             Enabled
   6) zimbra-store:                            Enabled
        +Create Admin User:                    yes
        +Admin user to create:                 admin@nurhamim.my.id
******* +Admin Password                        UNSET
        +Anti-virus quarantine user:           virus-quarantine.rptyn7wau@nurhamim.my.id
        +Enable automated spam training:       yes
        +Spam training user:                   spam.qkaikzzo@nurhamim.my.id
        +Non-spam(Ham) training user:          ham.ngphx8up@nurhamim.my.id
        +SMTP host:                            mail.nurhamim.my.id
        +Web server HTTP port:                 8080
        +Web server HTTPS port:                8443
        +Web server mode:                      https
        +IMAP server port:                     7143
        +IMAP server SSL port:                 7993
        +POP server port:                      7110
        +POP server SSL port:                  7995
        +Use spell check server:               yes
        +Spell server URL:                     http://mail.nurhamim.my.id:7780/aspell.php
        +Enable version update checks:         TRUE
        +Enable version update notifications:  TRUE
        +Version update notification email:    admin@nurhamim.my.id
        +Version update source email:          admin@nurhamim.my.id
        +Install mailstore (service webapp):   yes
        +Install UI (zimbra,zimbraAdmin webapps): yes

   7) zimbra-spell:                            Enabled
   8) zimbra-proxy:                            Enabled
   9) zimbra-imapd:                            Enabled
  10) Default Class of Service Configuration:
   s) Save config to file
   x) Expand menu
   q) Quit

Address unconfigured (**) items  (? - help)
```

Selanjutnya konfigurasi password admin Zimbra, pilih nomor `6`

```bash
Address unconfigured (**) items  (? - help) 6


Store configuration

   1) Status:                                  Enabled
   2) Create Admin User:                       yes
   3) Admin user to create:                    admin@nurhamim.my.id
** 4) Admin Password                           UNSET
   5) Anti-virus quarantine user:              virus-quarantine.rptyn7wau@nurhamim.my.id
   6) Enable automated spam training:          yes
   7) Spam training user:                      spam.qkaikzzo@nurhamim.my.id
   8) Non-spam(Ham) training user:             ham.ngphx8up@nurhamim.my.id
   9) SMTP host:                               mail.nurhamim.my.id
  10) Web server HTTP port:                    8080
  11) Web server HTTPS port:                   8443
  12) Web server mode:                         https
  13) IMAP server port:                        7143
  14) IMAP server SSL port:                    7993
  15) POP server port:                         7110
  16) POP server SSL port:                     7995
  17) Use spell check server:                  yes
  18) Spell server URL:                        http://mail.nurhamim.my.id:7780/aspell.php
  19) Enable version update checks:            TRUE
  20) Enable version update notifications:     TRUE
  21) Version update notification email:       admin@nurhamim.my.id
  22) Version update source email:             admin@nurhamim.my.id
  23) Install mailstore (service webapp):      yes
  24) Install UI (zimbra,zimbraAdmin webapps): yes
```

Lalu pilih nomor `4`

```bash
Select, or 'r' for previous menu [r] 4

Password for admin@nurhamim.my.id (min 6 characters): [At0x22cY3] INPUT_PASSWORD_ADMIN_ZIMBRA
Store configuration

   1) Status:                                  Enabled
   2) Create Admin User:                       yes
   3) Admin user to create:                    admin@nurhamim.my.id
   4) Admin Password                           set
   5) Anti-virus quarantine user:              virus-quarantine.rptyn7wau@nurhamim.my.id
   6) Enable automated spam training:          yes
   7) Spam training user:                      spam.qkaikzzo@nurhamim.my.id
   8) Non-spam(Ham) training user:             ham.ngphx8up@nurhamim.my.id
   9) SMTP host:                               mail.nurhamim.my.id
  10) Web server HTTP port:                    8080
  11) Web server HTTPS port:                   8443
  12) Web server mode:                         https
  13) IMAP server port:                        7143
  14) IMAP server SSL port:                    7993
  15) POP server port:                         7110
  16) POP server SSL port:                     7995
  17) Use spell check server:                  yes
  18) Spell server URL:                        http://mail.nurhamim.my.id:7780/aspell.php
  19) Enable version update checks:            TRUE
  20) Enable version update notifications:     TRUE
  21) Version update notification email:       admin@nurhamim.my.id
  22) Version update source email:             admin@nurhamim.my.id
  23) Install mailstore (service webapp):      yes
  24) Install UI (zimbra,zimbraAdmin webapps): yes
```

Pindah ke menu sebelumnya ketikan perintah `r` dan ketikan perintah `a` untuka apply konfigurasinya

```bash
Select, or 'r' for previous menu [r] r

Main menu

   1) Common Configuration:
   2) zimbra-ldap:                             Enabled
   3) zimbra-logger:                           Enabled
   4) zimbra-mta:                              Enabled
   5) zimbra-snmp:                             Enabled
   6) zimbra-store:                            Enabled
   7) zimbra-spell:                            Enabled
   8) zimbra-proxy:                            Enabled
   9) zimbra-imapd:                            Enabled
  10) Default Class of Service Configuration:
   s) Save config to file
   x) Expand menu
   q) Quit

*** CONFIGURATION COMPLETE - press 'a' to apply
Select from menu, or press 'a' to apply config (? - help) a
Save configuration data to a file? [Yes] Yes

*** CONFIGURATION COMPLETE - press 'a' to apply
Select from menu, or press 'a' to apply config (? - help) a
Save configuration data to a file? [Yes] Yes
Save config in file: [/opt/zimbra/config.13346]
Saving config in /opt/zimbra/config.13346...done.
The system will be modified - continue? [No] Yes
Operations logged to /tmp/zmsetup.20210120-125708.log
Setting local config values...done.
Initializing core config...Setting up CA...done.
Deploying CA to /opt/zimbra/conf/ca ...done.
Creating SSL zimbra-imapd certificate...done.
Creating new zimbra-store SSL certificate...done.
Creating new zimbra-ldap SSL certificate...done.
Creating new zimbra-mta SSL certificate...done.
Creating new zimbra-proxy SSL certificate...done.
Installing mailboxd SSL certificates...done.
Installing imapd SSL certificates...done.
Installing MTA SSL certificates...done.
Installing LDAP SSL certificate...done.
Installing Proxy SSL certificate...done.
Initializing ldap...done.
Setting replication password...done.
Setting Postfix password...done.
Setting amavis password...done.
Setting nginx password...done.
Setting BES searcher password...done.
Creating server entry for mail.nurhamim.my.id...done.
Setting Zimbra IP Mode...done.
Saving CA in ldap...done.
Saving SSL Certificate in ldap...done.
Setting spell check URL...done.
Setting service ports on mail.nurhamim.my.id...done.
Setting zimbraFeatureTasksEnabled=TRUE...done.
Setting zimbraFeatureBriefcasesEnabled=TRUE...done.
Checking current setting of zimbraReverseProxyAvailableLookupTargets
Querying LDAP for other mailstores
Searching LDAP for reverseProxyLookupTargets...done.
Adding mail.nurhamim.my.id to zimbraReverseProxyAvailableLookupTargets
Updating zimbraLDAPSchemaVersion to version '1557224584'
Setting TimeZone Preference...done.
Disabling strict server name enforcement on mail.nurhamim.my.id...done.
Initializing mta config...done.
Setting services on mail.nurhamim.my.id...done.
Adding mail.nurhamim.my.id to zimbraMailHostPool in default COS...done.
Creating domain nurhamim.my.id...done.
Setting default domain name...done.
Creating domain nurhamim.my.id...already exists.
Creating admin account admin@nurhamim.my.id...done.
Creating root alias...done.
Creating postmaster alias...done.
Creating user spam.qkaikzzo@nurhamim.my.id...done.
Creating user ham.ngphx8up@nurhamim.my.id...done.
Creating user virus-quarantine.rptyn7wau@nurhamim.my.id...done.
Setting spam training and Anti-virus quarantine accounts...done.
Initializing store sql database...done.
Setting zimbraSmtpHostname for mail.nurhamim.my.id...done.
Configuring SNMP...done.
Setting up syslog.conf...done.
Enabling IMAP protocol for zimbra-imapd service...done.
Enabling IMAPS protocol for zimbra-imapd service...done.
Starting servers...done.
Installing common zimlets...
        com_zimbra_proxy_config...done.
        com_zimbra_attachmail...done.
        com_zimbra_url...done.
        com_zimbra_bulkprovision...done.
        com_zimbra_cert_manager...done.
        com_zimbra_viewmail...done.
        com_zimbra_email...done.
        com_zimbra_mailarchive...done.
        com_zimbra_webex...done.
        com_zimbra_srchhighlighter...done.
        com_zextras_chat_open...done.
        com_zimbra_date...done.
        com_zimbra_ymemoticons...done.
        com_zimbra_attachcontacts...done.
        com_zimbra_phone...done.
        com_zimbra_clientuploader...done.
        com_zimbra_adminversioncheck...done.
        com_zimbra_tooltip...done.
        com_zextras_drive_open...done.
Finished installing common zimlets.
Restarting mailboxd...done.
Creating galsync account for default domain...done.

You have the option of notifying Zimbra of your installation.
This helps us to track the uptake of the Zimbra Collaboration Server.
The only information that will be transmitted is:
        The VERSION of zcs installed (8.8.15_GA_3869_UBUNTU18_64)
        The ADMIN EMAIL ADDRESS created (admin@nurhamim.my.id)

Notify Zimbra of your installation? [Yes] no
Notification skipped
Checking if the NG started running...done.
Setting up zimbra crontab...done.

Moving /tmp/zmsetup.20210120-125708.log to /opt/zimbra/log

Configuration complete - press return to exit
```

Saat ini instalasi Zimbra mail server sudah selesai dilakukan. Selanjutnya pastikan domain `nurhamim.my.id` sudah diarahkan ke IP VM/VPS untuk mengarahkannya Anda hanya perlu menambahkan A record saja contoh

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/z1.png)

Akses Zimbra melalui browser menggunakan port `7071` untuk username menggunakan `admin@nurhamim.my.id` dan untuk password input password yang sudah diinput set sebelumnya pada saat instalasi

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/z2.png)

Berikut tampilan administrator Zimbra Mail Server. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/z3.png)

Berikut service-service yang terinstall di Zimbra Mail Server

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/z4.png)

Sekian untuk instalasi Zimbra Mail Server di Ubuntu 18.04 LTS. Apabila terdapat kendala atau pertanyaan dapat disampaikan melalui kolom komentar. 

Selamat mencoba 😁