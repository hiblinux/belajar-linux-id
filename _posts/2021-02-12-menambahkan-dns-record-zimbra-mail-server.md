---
title: Menambahkan DNS Record Zimbra Mail Server
description: 'Zimbra adalah perangkat lunak open source (terbuka) untuk kolaborasi email yang sering digunakan untuk membangun sebuah mail server dan sangat terkemuka didunia.'
lang: id_ID
date: 2021-02-12 17:20 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/record-zimbra.png
categories:
 - Zimbra
 - mail-server
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali merupakan lanjutan dari tutorial sebelumnya tentang zimbra mail server yang dapat Anda lihat pada link berikut: 

- [Pengenalan Zimbra](https://belajarlinux.id/pengenalan-zimbra/)
- [Install Zimbra Mail Server di Ubuntu 18.04 LTS](https://belajarlinux.id/install-zimbra-di-ubuntu-18.04/)
- [Install SSL Letsencrypt di Zimbra Mail Server](https://belajarlinux.id/install-ssl-letsencrypt-di-zimbra-mail-server/)

Setelah melakukan instalasi dan pemasangan SSL, Anda masih belum dapat menggunakan zimbra sebagai mail server tanpa adanya record-record DNS untuk mail server Zimbra. Oleh karena itu Anda perlu menambahkan record DNS untuk mail server. 

Berikut ini merupakan beberapa DNS Record yang sering digunakan untuk kebutuhan mail server

-  **_Record MX + Mail Priority_**
   *MX (Mail Exchanger) merupakan record routing email, untuk domain.  Dalam hal ini akan diarahkan ke mail.nurhamim.my.id sebagai host yang  ditunjuk sebagai mail exchanger akan memproses atau meneruskan mail  untuk domain (nurhamim.my.id). Pada MX tersebut terdapat priority atau  nilai preferensi (preference value) untuk menunjukkan tingkat prioritas  mail exchanger yang digunakan untuk memproses atau meneruskan mail yang  menuju domain (nurhamim.my.id). Standard priority atau nilai preferensi  MX yang sering digunakan yakni 10*.
- ***SPF (Sender Policy Framework)***
   *Merupakan sebuah record mail yang digunakan untuk memvalidasi email  yg didesain untuk mencegah spam dengan cara mendeteksi spoofing, dengan  memverifikasi alamat IP pengirim.*
- ***Record DKIM (DomainKeys Identified Mail)\***
   *Merupakan sebuah record mail yang bertujuan untuk dapat  memverifikasi apakah ini email yang valid yang berasal dari nama domain  tertentu. Fungsi utamanya yaitu untuk mencegah spoofing dan phising pada email.*
- ***Record PTR/rDNS\***
   *PTR/rDNS merupakan record mail yang digunakan untuk menyatakan pemetaan
   sebuah alamat IP ke domain (nurhamim.my.id) yang merupakan  reversed-address. Reverse Address ini sangat diperlukan jika kita  membuat mail server karena dengan adanya reverse IP Address ke alamat  domain, maka proses send/receive protocol SMTP pada vm/server mail  server Anda dapat berjalan normal. Tanpa adanya reverse Address, IP kita dianggap sebagai spam oleh vm/server smtp mail server lain karena tidak dikenali.*

Untuk penambahan record mail server dapat di lakukan di DNS  Management domain untuk mengetahuinya bisa dengan cara melihat name  server domain sebagai contoh domain nurhamim.my.id.

Untuk melihat name server bisa menggunakan whois contoh

![](https://belajarlinux.id/content/images/wordpress/2020/09/image-22.png)

Terlihat gambar diatas untuk domain nurhamim.my.id menggunakan name server dari CloudFlare dengan demikian untuk penambahan record DNS nya dapat melalui DNS Management CloudFlare. 

## Penambahan Record DKIM

Untuk mendapatkan record DKIM di Zimbra Mail Server, Anda dapat generate record-nya dengan menjalankan satu baris perintah berikut: 

```bash
zimbra@mail:/root$
zimbra@mail:/root$ /opt/zimbra/libexec/zmdkimkeyutil -a -d nurhamim.my.id
DKIM Data added to LDAP for domain nurhamim.my.id with selector D4BF48C0-5B29-11EB-9CF4-FAAC72934B51
Public signature to enter into DNS:
D4BF48C0-5B29-11EB-9CF4-FAAC72934B51._domainkey IN      TXT     ( "v=DKIM1; k=rsa; "
          "p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA423Vkiv8b1M/OISDnmfMqSXxIcdkbRtCA4XpTiYSRUnRJEu3EXXOcBh04c8z+quc+ZaPK1be+ndNACn4H+jwFMmB7RQ0AKOTTZfk62AnsYUcJcH0tD/fHp/wdS18WB93Y0TCkCOjWDCUIsiZG6ExOwckgmIHvYfEkzhi+/R7R/jyBBiDDnJXPxx/eXZSv4QxpGp+paJNXzFd9c"
          "PW9Eu6l3bvmGxzxxvGogfnPBsDLBeXe9SQAkYH7K+sXzFBasbq894X+6VaGwH5t/83kFVNhvu5P6XdVDX5nb6Wrky7k3TmDQRfNrcjS347qYX7Fi0DO3s4aS0cqQp9A+p6GB+RrQIDAQAB" )  ; ----- DKIM key D4BF48C0-5B29-11EB-9CF4-FAAC72934B51 for nurhamim.my.id
zimbra@mail:/root$
```

Gabungkan value record DKIM yang didapatkan diatas menjadi satu contoh:

```bash
v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1GCO3SPXo85zejbaGma4SPdhhz/S7/QNk06/FJzlasschKdebYG7gEo4cjWZaIy7uwkbYsY+WrPOZgameogF0RgEQvmvjCKP28whhkQE0VP/KcSxWDQvvuqQlVO3Vj6Ba63SlsEc5hFd14NH6/c7Gp4R7jShEyNHFYEN8gseqUdkq6W1Ko1kjHJrasjXnLbIsunahta6xhPmdzWZK8B+ek67PIL0L4UZuR80i6yhWIH6CJ8PIXjQqnYdzzkyW7ChZI8w32o0U38JRL7p99XEAlY4OZznMxlqEpUS16DaqudVjP7OpoBgBadwrO55lt8cVve0RZHxiNvJMeWMsDhNPwIDAQAB
```

Tambahkan record DKIM ke DNS Management, untuk record DKIM bisa menggunakan TXT, contoh

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/rc1.png)

Verifikasi record DKIM sudah menggunakan DKIM checker Anda dapat menggunakan [MXToolbox](https://mxtoolbox.com/dkim.aspx), contohnya

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/rc3.png)

## Penambahan Record SPF

Untuk penambahan record SPF sama seperti DKIM, berikut value yang digunakan untuk SPF record

```bash
v=spf1 +a +mx +ip4:103.89.2.154 ~all
```

*Catatan: Input IP VM/VPS Anda pada bagian +ip4:*

Contoh penambahan disisi DNS Management domain

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/spf-zimbra.png)

Verifikasi SPF record, untuk verisikasi bisa menggunakan [MXToolbox](https://mxtoolbox.com/spf.aspx) contohnya:

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/spf-zimbra-1.png)

## Penambahan PTR Record

Untuk PTR Record Anda dapat menghubungi pihak penyedia layanan VM/VPS/Cloud Computing Anda untuk ditambahkan PTR IP dari VM/VPS yang Anda gunakan sebagai mail zimbra. 

Untuk melakukan verisikasi PTR record pada IP Zimbra mail server dapat dilakukan menggunakan [MXToolbox](https://mxtoolbox.com/ReverseLookup.aspx), contohnya: 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/rc5.png)

Berikut sample full record DNS untuk membuat mail server Zimbra

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/rc4.png)

## Uji Coba Pengiriman Email dari Zimbra ke @gmail.com dan @yahoo.com

Dalam pengujian ini kami sudah menambahkan record-record DNS untuk mail server, berikut hasil pengujian pengiriman email dari akun email @nurhamim.my.id yang menggunakan Zimbra Mail Server ke akun @yahoo.com dan @gmail.com

**Penerimaan email di @yahoo.com**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/rc8.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/rc9.png)

**Penerimaan email di @gmail.com**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/rc6.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/rc7.png)

Itulah tahapan dan cara menambahkan record - record DNS untuk Mail Server Zimbra. 

Selamat mencoba 😁