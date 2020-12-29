---
title: Penerapan VPN Site to Site dengan Mikrotik CHR
description: Menghubungkan jaringan antara kantor utama dengan beberapa kantor cabang bisa menggunakan jaringan private sebagai cara untuk menggunakan jaringan yang lebih aman.
lang: id_ID
date: 2020-12-27 22:51 +0700
layout: post
featured: true
author: Imron
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/Cover-art/vpn-site-to-site.png
categories: [ VPN, Mikrotik, CHR, Site-to-Site ]
---

Menghubungkan jaringan antara kantor utama dengan beberapa kantor cabang bisa menggunakan jaringan private sebagai cara untuk menggunakan jaringan yang lebih aman. Banyak perusahaan yang sudah menerapkan VPN Site to Site untuk menggunakan akses trafik jaringan tersebut. 

Perusahaan yang menerapkan VPN Site to Site ini adalah kantor cabang yang secara letak geografisnya berbeda dengan kantor yang lain dan membutuhkan akses jaringan perusahaan secara berkelanjutan. Manfaatnya perusahaan bisa menggunakan jaringan lebih aman dan bisa berbagi resource dengan satu jaringan. 

## Prasyarat
Adapun beberapa syarat yang diperlukan untuk menerapkan VPN Site to Site ini bisa dilihat lengkapnya pada topologi berikut ini. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/Topologi%20Jaringan.png
)

1. Sediakan tiga buat VPS yang sudah terinstall CHR
2. Koneksi internet 
3. IP Private masing-masing VPS 

## Konfigurasi 
Sebelum melakukan konfigurasi, silakan login ke masing-masing CHR, dan pilih menu IP > Services, jika Anda belum mengetahui cara login ke CHR bisa melihat post sebelumnya pada tautan [berikut](https://belajarlinux.id/Install-Cloud-Hosted-Router(CHR)-pada-VPS-Ubuntu-20.04-LTS/). 
Untuk menjaga keamanan, non-aktifkan akses SSH dan telnet. 
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/6.%20Login%20Winbox.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/7.%20Disable%20service.png)


1. Login ke CHR mikrotik gateway terlebih dahulu, aktifkan service **L2TP** pada menu PPP > L2TP Server. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/8.%20LPTP%20Server.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/9.%20Enable%20LPTP%20Server.png)

**Keterangan**: 
- Enabled: Ceklis pada pilihan ini. 
- Use IPsec: Pilih yes 
- IPsec Secret: Isikan password dan mohon diingat dikarenakan password ini nanti akan digunakan untuk konfigurasi dari sisi client. 

{:start="2"}
2. Selanjutnya penambahan IP Pool Address sebagai IP Tunneling, pergi ke menu IP > Pool. Klik pada button (+) untuk membuat IP Pool. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/10.%20Add%20pool.png)

**Keterangan**: 
- Name: Isikan nama IP Pool 
- Addresses: Tentukan range IP Pool yang akan digunakan. 

{:start="3"}
3. Kemudian membuat akun untuk koneksi dari VPN client ke VPN server, pergi ke menu PPP > Secrets > Add. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/11.%20Secret.png)

- Membuat user untuk instance mikrotik client A

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/12.%20Secreta.png)

- Membuat user untuk instance mikrotik client B 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/12.%20Secretb.png)

**Keterangan**: 
- Name: Isikan sesuai dengan nama keinginan Anda, misalnya mikrotik-client-A.
- Password: Password juga sesuai keinginan Anda 
- Service: Pilih Any 
- Profile: Pilih default 
- Local Address: Sesuaikan dengan keinginan Anda, IP ini akan digunakan untuk koneksi tunneling ke VPN Server
- Remote Address: Sesuaikan dengan keinginnan Anda juga, IP ini nantinya akan digunakan untuk koneksi tunneling ke VPN Client. 

Berikut hasilnya: 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/13.%20hasil%20secret.png)

{:start="4"}
4. Selanjutnya, membuat profile VPN melalui menu PPP > Profile. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/14.%20Profile.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/15.%20Profil%20vpn.png)

**Keterangan**: 
- Name: Isikan sesuai dengan keinginan Anda
- Local Address: Isikan IP Address sesuai dengan network pada konfigurasi sebelumnya
- Remote Access: Isi dengan nama IP  Pool yang telah dibuat sebelumnya. 

a. Konfigurasi VPN Client pada Mikrotik-Client-A
Selanjutnya melakukan konfigrasi VPN L2TP Client yang berada pada menu PPP > Interface > Add > L2TP Client 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/17.%20Add%20vpn-client%20b.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/16.%20Add%20vpn-client%20A%282%29.png)

**Keterangan**: 
- Connect to: Isikan IP Public dari mikrotik gateway 
- User: Masukkan user yang telah dibuat pada mikrotik gateway sebelumnya
- Password: Masukkan password yang telah dibuat juga sebelumnya
- IPsec Secret: Masukkan IPsec Secret yang telah dibuat sebelumnya . 
Untuk menyimpannya, klik Apply dan Ok. Apabila ditunjukkan dengan simbol **R (Running)** maka koneksi antara VPN mikrotik-client-A dengan mikrotik gateway telah berhasil terhubung. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/16.%20Add%20vpn-client%20A%283%29.png)

b. Konfigurasi VPN Client pada Mikrotik-Client-B
Konfigurasi VPN Client pada mikrotik-client-B sama seperti halnya konfigurasi VPN Client pada mikrotik-client-A. Hanya saja untuk username dan password perlu disesuaikan. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/17.%20Add%20vpn-client%20b%282%29.png)

Apabila berhasil, maka akan ditandai huruf **R (Running)** yang berarti koneksi antara VPN mikrotik-client-B dengan mikrotik gateway benar-benar terhubung. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/17.%20Add%20vpn-client%20b%283%29.png)

{:start="5"}
5. Konfigurasi static routing setiap CHR 
Adapun fungsi dari static routing ini adalah untuk menghubungkan koneksi antara mikrotik-client-A dengan mikrotik-client-B beserta mikrotik gateway menggunakan IP Private. 

Konfigurasi static routing ini terdapat dua tahap, antara lain: 
I. Destination Address: Isi dengan IP Private dari setiap CHR 
II. Gateway: Isi dengan IP Address Tunneling VPN dari setiap CHR 

a. Menambahkan static routing pada mikrotik gateway
Sebelum menambahkan static routing, silakan cek terlebih dahulu IP Address tunneling yang digunakan oleh mikrotik-client-A dan mikrotik-client-B melalui menu IP > Addresses. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/18.%20IP%20Address%20GW.png)

Selanjutnya masuk ke menu IP > Routes. 
Saat ini sedang melakukan konfigurasi static routing dari mikrotik gateway ke mikrotik-client-A.  

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/19.%20dari%20gw%20ke%20A.png)

Sedangkan, sekarang konfigurasi static routing dari mikrotik gateway ke mikrotik-client-B. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/19.%20dari%20gw%20ke%20B.png)

b. Menambahkan static routing pada mikrotik-client-A
Adapun kali ini menambahkan static routing dari mikrotik-client-A ke mikrotik gateway dan ke mikrotik-client-B. Yang bertindak sebagai gateway adalah mikrotik gateway, sehingga IP tunnel yang digunakan adalah dari mikrotik gateway. 

- Tambahkan static routing dari mikrotik-client-A ke mikrotik gateway
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/20.%20dari%20A%20ke%20gw.png)

- Tambahkan static routing dari mikrotik-client-A ke mikrotik-client-B

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/21.%20dari%20A%20ke%20B.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/21.%20dari%20A%20ke%20B%282%29.png)

c. Menambahkan static routing pada mikrotik-client-B
Adapun saat ini menambahkan static routing dari mikrotik-client-B ke mikrotik gateway maupun ke mikrotik-client-A. Yang bertindak sebagai gateway adalah mikrotik gateway, sehingga IP tunnel yang digunakan adalah dari mikrotik gateway. 

- Tambahkan static routing dari mikrotik-client-B ke mikrotik gateway
![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/22.%20dari%20B%20ke%20GW.png)

- Tambahkan static routing dari mikrotik-client-B ke mikrotik-client-A

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/22.%20dari%20B%20ke%20A.png)

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/22.%20dari%20B%20ke%20GW%282%29.png)

## Verifikasi

Langkah yang terakhir, untuk melakukan verifikasi hasil penerapan VPN Site to Site dengan mikrotik adalah dengan test ping mulai dari mikrotik gateway ke IP Private mikrotik-client-A dan mikrotik-client-B. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/23.%20Test%20Ping%20GW.png)

Selanjutnya tes ping dari mikrotik-client-A ke IP Private mikrotik gateway dan mikrotik-client-B. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/23.%20Test%20Ping%20A.png)

Kemudian tes ping dari mikrotik-client-B ke IP Private mikrotik gateway dan mikrotik-client-A. 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/imron/KB/VPN%20Site%20to%20Site/23.%20Test%20Ping%20B.png)

Apabila hasil tes ping berjalan dengan lancar, berarti konfigurasi VPN Site to Site dengan mikrotik berhasil dengan sukses. 
Jika terdapat kekurangan dalam publish post kali ini, atau ada kritik dan saran bisa tulis dibawah kolom komentar yang disediakan dibawah ini. 

Follow terus FansPage Facebook dari [BelajarLinuxID](https://web.facebook.com/belajarlinuxid/) yaa .. 

Sekian dan terima kasih. 

Semoga bermanfaat dan barokah, aamiin :) 