---
title: Cara Install MariaDB di Linux Container (LXD)
description: 'MariaDB adalah sistem manajemen database relasional yang dikembangkan dari MySQL. MariaDB dikembangkan oleh komunitas pengembang yang  sebelumnya berkontribusi untuk database MySQL'
lang: id_ID
date: 2020-12-28 16:01 +0700
layout: post
featured: true
author: nurhamim
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/lxd/apache/cover/2.png'
categories:
 - LXC/LCD
 - Linux Container
 - database
---

[Belajar Linux ID](https://belajarlinux.id)  - MariaDB adalah sistem manajemen database relasional yang dikembangkan dari MySQL. MariaDB dikembangkan oleh komunitas pengembang yang  sebelumnya berkontribusi untuk database MySQL.

Mengapa pengembang MySQL membangun MariaDB? Salah satu alasannya,  MySQL telah diakuisisi oleh Oracle sehingga menyebabkan MySQL menjadi  produk yang berlisensi proprietary. Dengan diakuisisinya MySQL oleh  Oracle, maka pengembangan MySQL pun sudah tidak leluasa lagi. Hal ini  yang menyebabkan pengembang MySQL sebelumnya mulai membangun MariaDB.

Di linux container Anda dapat melakukan instalasi database MariaDB disini kami akan mencoba install MariaDB di linux container dengan images CentOS 8. 

Untuk mengikuti tutorial ini pastikan Anda sudah mempunyai linux container (LXD) jika belum Anda dapat merujuk pada tutorial berikut, untuk mengetahui tentang apa itu linux container:

- [Mengenal Tentang LXC/LXD](https://belajarlinux.id/pengenalan-lxc-atau-lxd/)
- [Cara Install LXDUI di Ubuntu 20.04 LTS](https://belajarlinux.id/cara-install-lxdui-di-ubuntu-20-04-lts/)
- [Perintah Dasar Linux Container (LXD)](https://belajarlinux.id/perintah-dasar-lxd/)

Buat linux container dengan images CentOS 8

```bash
ubuntu@lxd-belajarlinux:~$
ubuntu@lxd-belajarlinux:~$ lxc launch images:centos/8/amd64 database
Creating database
Starting database
ubuntu@lxd-belajarlinux:~$
```

Nama linux container-nya yaitu `database` silakan cek status linux container

```bash
ubuntu@lxd-belajarlinux:~$ lxc list
+----------+---------+-----------------------+-----------------------------------------------+-----------+-----------+
|   NAME   |  STATE  |         IPV4          |                     IPV6                      |   TYPE    | SNAPSHOTS |
+----------+---------+-----------------------+-----------------------------------------------+-----------+-----------+
| database | RUNNING | 10.171.248.86 (eth0)  | fd42:c106:7321:e7f9:216:3eff:fe61:cd72 (eth0) | CONTAINER | 0         |
+----------+---------+-----------------------+-----------------------------------------------+-----------+-----------+
| web      | RUNNING | 10.171.248.115 (eth0) | fd42:c106:7321:e7f9:216:3eff:fe44:c031 (eth0) | CONTAINER | 0         |
+----------+---------+-----------------------+-----------------------------------------------+-----------+-----------+
ubuntu@lxd-belajarlinux:~$
```

Saat ini linux container untuk database sudah running dan silakan login ke dalam linux container untuk memulai instalasi mariadb

```bash
ubuntu@lxd-belajarlinux:~$ lxc exec database bash
[root@database ~]#
[root@database ~]# dnf update -y
```

Install mariadb-server menggunakan command berikut

```bash
[root@database ~]#
[root@database ~]# dnf install mariadb-server
```

Instalasi mariadb-server di linux container hampir sama dengan install mariadb-server di VPS atau VM. Silakan reload dan enable mariadb server

```
[root@database ~]#
[root@database ~]# systemctl start mariadb
[root@database ~]# systemctl enable mariadb
[root@database ~]# systemctl status mariadb
● mariadb.service - MariaDB 10.3 database server
   Loaded: loaded (/usr/lib/systemd/system/mariadb.service; enabled; vendor preset: disabled)
   Active: active (running) since Mon 2020-12-28 05:02:56 UTC; 27s ago
     Docs: man:mysqld(8)
           https://mariadb.com/kb/en/library/systemd/
 Main PID: 339 (mysqld)
   Status: "Taking your SQL requests now..."
    Tasks: 30 (limit: 12505)
   Memory: 75.1M
   CGroup: /system.slice/mariadb.service
           └─339 /usr/libexec/mysqld --basedir=/usr

Dec 28 05:02:55 database mysql-prepare-db-dir[237]: See the MariaDB Knowledgebase at http://mariadb.com/kb or the
Dec 28 05:02:55 database mysql-prepare-db-dir[237]: MySQL manual for more instructions.
Dec 28 05:02:55 database mysql-prepare-db-dir[237]: Please report any problems at http://mariadb.org/jira
Dec 28 05:02:55 database mysql-prepare-db-dir[237]: The latest information about MariaDB is available at http://mariadb.org/.
Dec 28 05:02:55 database mysql-prepare-db-dir[237]: You can find additional information about the MySQL part at:
Dec 28 05:02:55 database mysql-prepare-db-dir[237]: http://dev.mysql.com
Dec 28 05:02:55 database mysql-prepare-db-dir[237]: Consider joining MariaDB's strong and vibrant community:
Dec 28 05:02:55 database mysql-prepare-db-dir[237]: https://mariadb.org/get-involved/
Dec 28 05:02:55 database mysqld[339]: 2020-12-28  5:02:55 0 [Note] /usr/libexec/mysqld (mysqld 10.3.17-MariaDB) starting as process 339 ...
Dec 28 05:02:56 database systemd[1]: Started MariaDB 10.3 database server.
[root@database ~]#
```

Jika sudah running Anda dapat set password root mariadb-server

```bash
[root@database ~]# mysql_secure_installation

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user.  If you've just installed MariaDB, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.

Enter current password for root (enter for none):
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into the MariaDB
root user without the proper authorisation.

Set root password? [Y/n]
New password: [ISI Password Root Mariadb Server]
Re-enter new password: [Konfirmasi Password Root Mariadb Server]
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n]
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n]
 ... Success!

By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n]
 - Dropping test database...
 ... Success!
 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n]
 ... Success!

Cleaning up...

All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
[root@database ~]#
```

Login ke root mariadb-server

```bash
[root@database ~]#
[root@database ~]# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 16
Server version: 10.3.17-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
3 rows in set (0.002 sec)
```

Test buat database di mariadb-server

```bash
MariaDB [(none)]> create database test_blinux;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| test_blinux        |
+--------------------+
4 rows in set (0.003 sec)
```

Jika ingin keluar dari shell mariadb-server ketikan perintah `exit`

```bash
MariaDB [(none)]> exit
Bye
[root@database ~]#
```

Itulah tahapan singkat instalsi mariadb-server di linux container yang sangat mudah sekali. 

Selamat mencoba 😁