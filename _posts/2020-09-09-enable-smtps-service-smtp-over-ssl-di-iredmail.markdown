---
author: nurhamim
layout: post
title: Enable SMTPS service (SMTP over SSL) di iRedMail
description: 'Send Mail Transfer Protokol atau sering disebut dengan SMTP secara default untuk SMPT sudah enable di iRedMail namun untuk SMTPS secara default di disable dengan alasan deprecated sesuai informasi dari wikipedia.org'
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/c16.png'
featured: true
date: '2020-09-09 20:51:23'
categories:
- centos
- mail-server
---

_Send Mail Transfer Protokol_ atau sering disebut dengan SMTP secara default untuk SMPT sudah enable di iRedMail namun untuk _SMTPS_ secara default di disable dengan alasan deprecated sesuai informasi dari [wikipedia.org](http://en.wikipedia.org/wiki/SMTPS)

> _Originally, in early 1997, the Internet Assigned Numbers Authority registered 465 for SMTPS. By the end of 1998, this was revoked when STARTTLS has been specified. With STARTTLS, the same port can be used with or without TLS. SMTP was seen as particularly important, because clients of this protocol are often other mail servers, which can not know whether a server they wish to communicate with will have a separate port for TLS. The port 465 is now registered for Source-Specific Multicast audio and video._

Pertanyaan yang sering timbul kenapa harus mengaktifkan SMTPS?

Sangat banyak dan bahkan bisa di bilang rata – rata mail client yang digunakan yaitu Microsoft Outlook dimana Microsoft Outlook tidak support SMTP over STARTTLS dengan port 587 dan Microsoft Outlook membutuhkan SMTPS yang berjalan di port 465 berikut

> _Even in 2013, there are still services that continue to offer the deprecated SMTPS interface on port 465 in addition to (or instead of!) the RFC-compliant message submission interface on the port 587 defined by RFC 6409. Service providers that maintain port 465 do so because older Microsoft applications (including Entourage v10.0) do not support STARTTLS, and thus not the smtp-submission standard (ESMTPS on port 587). The only way for service providers to offer those clients an encrypted connection is to maintain port 465._

Dan satu alasan kenapa harus mengaktifkan SMTPS karena banyak ISP Internet melakukan block terhadap SMTP port 25.

Jadi untuk mengaktifkan SMTPS di iRedMail perlu di lakukan secara manual dengan beberapa tahapan berikut.

Pertama buka konfigurasi master postfix iredmail

    [root@mail ~]#
    [root@mail ~]# vim /etc/postfix/master.cf

Tambahkan rule SMTPS di baris paling akhir

    465 inet n - n - - smtpd
      -o syslog_name=postfix/smtps
      -o smtpd_tls_wrappermode=yes
      -o smtpd_sasl_auth_enable=yes
      -o smtpd_client_restrictions=permit_sasl_authenticated,reject
      -o content_filter=smtp-amavis:[127.0.0.1]:10026

Menambahkan rule smtps di sisi firewalld

    [root@mail ~]#
    [root@mail ~]# vim /etc/firewalld/services/smtps.xml

Berikut rule smtps nya

    <?xml version="1.0" encoding="utf-8"?>
    <service>
      <short>Enable SMTPS</short>
      <description>Enable SMTPS.</description>
      <port protocol="tcp" port="465"/>
    </service>

Deklarasi smtps di zone firewalld iredmail

    [root@mail ~]#
    [root@mail ~]# vim /etc/firewalld/zones/iredmail.xml

Menjadi seperti berikut

    <?xml version="1.0" encoding="utf-8"?>
    <zone>
        <short>Mail services</short>
        <description>Allow access to mail services from external network.</description>
        <service name="http"/>
        <service name="https"/>
        <service name="smtp"/>
        <service name="smtps"/>
        <service name="smtp-submission"/>
        <service name="pop3"/>
        <service name="pop3s"/>
        <service name="imap"/>
        <service name="imaps"/>
        <service name="ssh"/>
    </zone>

Jika sudah silakan reload firewalld

    [root@mail ~]#
    [root@mail ~]# firewall-cmd --complete-reload
    success
    [root@mail ~]#

Test port 465 sudah allow public dengan menggunakan cara telnet ke IP atau host mail server contohnya

<figure class="wp-block-image size-large"><img loading="lazy" width="719" height="129" src="/content/images/wordpress/2020/09/test.png" alt="" class="wp-image-521" srcset="/content/images/wordpress/2020/09/test.png 719w, /content/images/wordpress/2020/09/test-300x54.png 300w" sizes="(max-width: 719px) 100vw, 719px"></figure>

Selamat mencoba 😁