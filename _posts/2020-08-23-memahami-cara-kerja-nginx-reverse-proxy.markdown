---
author: nurhamim
layout: post
title: Memahami Cara Kerja Nginx Reverse Proxy
description: 'Reverse Proxy adalah salah satu jenis dari proxy, biasanya reverse proxy digunakan sebagai perantara antara client dengan web server'
image: 'https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/a20.png'
featured: true
date: '2020-08-23 20:23:13'
categories:
- apache
- centos
- nginx
---

## # Mengenal Reverse Proxy

Kalimat _ **Reverse Proxy** _ mungkin sudah tidak asing lagi terdengar khususnya orang yang menggeluti dunia web server.

Mari kita bahas tentang apa sih itu _reverse proxy?._

Sebelum kita lanjut ke pembahasan _reverse proxy_ ada kalanya kita tahu terlebih dahulu tentang _Server Proxy_.

> _Server proxy merupakan sebuah server yang menyediakan layanan perantara antara client host dengan server lain._

Lalu apa itu _Reverse Proxy?._

> _Reverse Proxy adalah salah satu jenis dari proxy, biasanya reverse proxy digunakan sebagai perantara antara client dengan web server._

## # Cara Kerja Nginx Reverse Proxy

Jika sebelumnya kita sudah mengetahui tentang apa itu _Reverse Proxy_ selanjutnya kita akan mencoba memahami cara kerja _Reverse Proxy Nginx,_ perhatikan gambar dibawah ini

<figure class="aligncenter size-large"><img loading="lazy" width="490" height="111" src="/content/images/wordpress/2020/08/Topologi-Reverse-proxy-Nginx.png" alt="" class="wp-image-186" srcset="/content/images/wordpress/2020/08/Topologi-Reverse-proxy-Nginx.png 490w, /content/images/wordpress/2020/08/Topologi-Reverse-proxy-Nginx-300x68.png 300w" sizes="(max-width: 490px) 100vw, 490px"></figure>

Seperti apa yang sudah disampaikan diatas bahwa _reverse proxy_ sendiri sebagai perantara, jika di lihat dari topologi diatas alurnya sebagai berikut

_Request :_

> _Client \>\> Nginx Reverse Proxy \>\> Web server Apache (Backend)_

_Respons:_

> _Web server Apache (Backend) \>\> Nginx Reverse Proxy \>\> Client_

Analogi sederhananya _Nginx Reverse Proxy_ bisa di ibaratkan sebagai _**(resepsionis)**_ yang akan meneruskan ke pihak terkait jika terdapat permintaan dari public atau customer.

Gambara diatas hanyalah gambaran sederhana dari alur kerja _Reverse Proxy_ yang berjalan dalam satu server _**(standanlone).**_

Berikut kami berikan contoh yang lebih kompleks, perhatikan gambar berikut ini.

<figure class="aligncenter size-large"><img loading="lazy" width="515" height="270" src="/content/images/wordpress/2020/08/Nginx-Reverse-Proxy-Multi-Server.png" alt="" class="wp-image-184" srcset="/content/images/wordpress/2020/08/Nginx-Reverse-Proxy-Multi-Server.png 515w, /content/images/wordpress/2020/08/Nginx-Reverse-Proxy-Multi-Server-300x157.png 300w" sizes="(max-width: 515px) 100vw, 515px"></figure>

Dari gambar topologi diatas kita bisa melihat dimana _Reverse Proxy_ dapat menangani satu atau lebih server web.

Konfigurasi reverse proxy yang umum digunakan adalah menempatkan Nginx di depan server web Apache. Menggunakan metode ini akan memungkinkan kedua server web untuk bekerja sama memungkinkan masing-masing untuk melakukan yang terbaik.

Silahkan ditentukan skenario Anda sesuai dengan kebutuhan Anda.

## # Keuntungan dan Fungsi Reverse Proxy

Dikutip dari situs resmi Nginx, terdapat 3 keuntungan yang akan Anda dapatkan jika menggunakan _Reverse Proxy Nginx_ diantaranya adalah

- **Load Balancing**

Reverse proxy dapat melakukan load balancing yang membantu mendistribusikan permintaan klien secara merata di seluruh server backend. Proses ini sangat membantu dalam menghindari skenario di mana server tertentu menjadi kelebihan beban (over load) karena lonjakan permintaan yang tiba-tiba. Penyeimbangan beban juga meningkatkan redundansi seolah-olah satu server mati, proxy akan bertugas merutekan atau meredirect traffik yang masuk ke backend yang lainnya.

- **Web Acceleration**

Reverse Proxy dapat mengkompress data “inbound” dan “outbound”, serta dapat menyimpan cache ataupun konten static dan tentunya dapat mempercepat koneksi antara client – server. Selain itu dengan menggunakan Reverse Proxy Anda dapat menerapkan Secure Sockets Layer (SSL).

- **Security dan Anonymity**

Dengan reverse proxy nginx permintaan (request) tidak langsung diarahkan ke sisi backend dan disini reverse proxy nginx juga melindungi identitas server backend dan menjadi salah satu pertahanan atau security serta yang menghandle semua request yang Ada tanpa membebani server backend.

_Referensi:_

- **_[Setting up an Nginx Reverse Proxy](https://www.keycdn.com/support/nginx-reverse-proxy)_**
- **_[What Is a Reverse Proxy Server?](https://www.nginx.com/resources/glossary/reverse-proxy-server/)_**

Itulah beberapa rangkuman singkat mengenai _Reverse Proxy Nginx_ semoga bermanfaat bagi kita semua.

Selamat mencoba 😊.
