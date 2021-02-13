---
title: Enable Fitur Forgot Password di Webmail Zimbra Mail Server
description: 'Zimbra adalah perangkat lunak open source (terbuka) untuk kolaborasi email yang sering digunakan untuk membangun sebuah mail server dan sangat terkemuka didunia.'
lang: id_ID
date: 2021-02-13 20:31 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/webmail-zimbra-1.png
categories:
 - Zimbra
 - mail-server
---

[Belajar Linux ID](https://belajarlinux.id) - Tutorial kali ini kami akan memberikan Anda cara bagaimana mengaktifkan fitur `forgot password` pada webmail Zimbra Mail Server.  Di Zimbra Mail Server edisi open source pada versi 8.8.15.GA.3869 Ubuntu 18.04 LTS untuk fitur ini tidak aktif dan perlu diaktifkan secara manual. 

*Baca juga:*

- **[Pengenalan Zimbra](https://belajarlinux.id/pengenalan-zimbra/)**
- **[Install Zimbra Mail Server di Ubuntu 18.04 LTS](https://belajarlinux.id/install-zimbra-di-ubuntu-18.04/)**
- **[Menambahkan DNS Record Zimbra Mail Server](https://belajarlinux.id/menambahkan-dns-record-zimbra-mail-server/)**
- **[Install SSL Letsencrypt di Zimbra Mail Server](https://belajarlinux.id/install-ssl-letsencrypt-di-zimbra-mail-server/)**
- **[Mengatasi Error Upstream di Zimbra Mail Server](https://belajarlinux.id/mengatasi-error-upstream-di-zimbra-mail-server/)**
- **[Membuat User Email di Zimbra Mail Server](https://belajarlinux.id/membuat-user-email-di-zimbra-mail-server/)**
- **[Membuat Multi Akun Email di Zimbra Mail Server](https://belajarlinux.id/membuat-multi-akun-email-di-zimbra-mail-server/)**
- **[Membuat User Administrator Read Only di Zimbra Mail Server](https://belajarlinux.id/membuat-user-administrator-readonly-di-zimbra-mail-server/)**
- **[Membuat Notifikasi User Gagal Login di Zimbra Mail Server](https://belajarlinux.id/membuat-notifikasi-user-gagal-login-di-zimbra-mail-server/)**
- **[Mengubah Ukuran Mailbox Email di Zimbra Mail Server](https://belajarlinux.id/mengubah-ukuran-mailbox-email-di-zimbra-mail-server/)**

Fitur `forgot password` sangat direkomendasikan untuk di enable karena dengan adanya fitur ini apabila terdapat user yang ingin melakukan reset password karena lupa dan sebagainya dapat dilakukan secara mandiri dan tidak perlu lagi menghubungi administrator zimbra untuk reset password-nya. 

Saat ini posisi webmail masih belum ada fitur `forgot password` , perhatikan gambar dibawah ini

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/ef1.png)

Berikut tahapan untuk enable fitur `forgot password`

Login ke server Zimbra dan buka file `login.jsp` yang berada di direktori `/opt/zimbra/jetty/webapps/zimbra/public/`

```bash
root@mail:~#
root@mail:~# vim /opt/zimbra/jetty/webapps/zimbra/public/login.jsp
```

*Catatan: Sebelum melakukan perubahan ada baiknya dilakukan backup konfigurasi tersebut*

Selanjutnya cari line berikut: 

```bash
<c:if test="${domainInfo.attrs.zimbraFeatureResetPasswordStatus eq 'enabled'}">
```

Pindahkan file tersebut ke bawah nya `<tr></tr>` seperti berikut:

***Sebelum***

```bash
<c:if test="${domainInfo.attrs.zimbraFeatureResetPasswordStatus eq 'enabled'}">
<tr>                                      
   <td></td>   
   <td class="submitTD">
       <a href="#" onclick="forgotPassword();" id="ZLoginForgotPassword" aria-controls="ZLoginForgotPassword" aria-expanded="false"><fmt:message key="forgotPassword"/></a>
   </td>
</tr>
```

***Sesudah***

```bash
<tr>                                      
   <td></td>
   <td class="submitTD">
       <a href="#" onclick="forgotPassword();" id="ZLoginForgotPassword" aria-controls="ZLoginForgotPassword" aria-expanded="false"><fmt:message key="forgotPassword"/></a>
   </td>
</tr>
<c:if test="${domainInfo.attrs.zimbraFeatureResetPasswordStatus eq 'enabled'}">
```

Login ke user zimbra

```bash
root@mail:~# su - zimbra
zimbra@mail:~$ 
```

Restart Mailbox

```bash
zimbra@mail:~$ zmmailboxdctl restart
Stopping mailboxd...done.
Starting mailboxd...done.
zimbra@mail:~$
```

Verifikasi dengan cara akses webmail zimbra mail server

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/ef2.png)

Saat ini Anda sudah berhasil enable fitur `Forgot Password`. 

Selamat mencoba 😁