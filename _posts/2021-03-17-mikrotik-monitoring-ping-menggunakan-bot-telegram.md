---
title: "Mikrotik: Monitoring Ping Menggunakan Bot Telegram"
description: Kali ini kita akan belajar tentang cara Monitoring Ping Menggunakan Bot Telegram Langsung saja simak langkah-langkahnya di Belajar Linux ID.
lang: id_ID
date: 2021-03-17 17:40 +0700
layout: post
featured: true
author: leon
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/mikrotikcov.png
categories:
  - mikrotik
  - chr
  - bot
  - telegram
---

[Belajar Linux ID](https://belajarlinux.id) - Selain digunakan untuk router mikrotik juga memiliki fitur monitoring ICMP (Ping) yang berfungsi untuk memantau aktifitas ping ke server.

Fitur ini bernama Netwatch dan sudah mendukung integrasi dengan bot telegram sehingga memudahkan kita dalam memantau uptime pada server.

Kali ini kita akan belajar **Monitoring Ping Menggunakan Bot Telegram** Langsung saja simak langkah-langkahnya di [Belajar Linux ID](https://belajarlinux.id):

**1. Daftarkan Bot Telegram pada [**BotFather**](https://t.me/BotFather) untuk mendapatkan token.**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/mik-1.png)

**2. Simpan token yang didapatkan.**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/mik-2.png)

**3. Selanjutkan silakan terhubung ke mikrotik menggunakan Winbox**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/mik-3.png)

**4. Apabila sudah berhasil terhubung, buka menu Tools > Netwatch**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/mik-4.png)

**5. Klik tombol + untuk menambahkan IP Address server yang akan dimonitoring**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/mik-5.png)

**6. Pada bagian tab Up Silakan masukan command berikut ini :**

```
/tool fetch url="https://api.telegram.org/bot[TOKEN-KAMU]/sendMessage?chat_id=[CHAT-ID-KAMU]&text=Ping <b>Belajar Linux</b> terpantau UP&parse_mode=html" keep-result=no
```

**7. Pada bagian tab Down Silakan masukan command berikut ini :**

```
/tool fetch url="https://api.telegram.org/bot[TOKEN-KAMU]/sendMessage?chat_id=[CHAT-ID-KAMU]&text=Ping <b>Belajar Linux</b> terpantau DOWN&parse_mode=html" keep-result=no
```

Untuk mendapatkan CHAT-ID silakan mengakses tautan ini : https://api.telegram.org/bot[TOKEN-KAMU]/getupdates

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/mik-6.jpg)

**8. Selanjutnya silakan pastikan netwatch sudah terhubung ke Bot.**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/mik-7.png)

## Selesai

Sekian dulu artikel **Monitoring Ping Menggunakan Bot Telegram** kali ini, tunggu artikel selanjutnya 
