---
title: Cara Connect WiFi dengan wpa_supplicant di GNU/Linux
description: wpa_supplicant untuk connect wifi dikala netinstall
lang: id_ID
date: 2021-06-14 08:57 +0700
layout: post
featured: true
author: Radhitya
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-06-14_11-25-52.jpg
categories:
- linux
- wpa_supplicant
---

[Belajar Linux ID](https://belajarlinux.id) - Bagi pengguna yang suka install distro GNU/Linux secara netinstall alias manual semua, pasti gak asing dengan program wpa_supplicant. wpa_supplicant adalah daemon jaringan untuk mengelola koneksi yang berjalan di background.

## Cara Connect Wifi dengan WPA_Supplicant
wpa_Supplicant punya 2 cara, yaitu menggunakan wpa_cli atau wpa_passphrase. Tetapi saya lebih memilih wpa_cli karena.

Mula - mula kita membuat config di konfigurasi wpa_supplicant sebagai root.
```bash
# vim /etc/wpa_supplicant/wpa_supplicant.conf
update_config=1
```
Disini kita akan menjalankan service wpa_supplicant.
```bash
# wpa_supplicant -B -i nama-adapter -c /etc/wpa_supplicant/wpa_supplicant.conf
```
Setelah sukses menjalankan wpa_supplicant, saatnya menyambungkan.

### wpa_cli
Jalankan wpa_cli dengan perintah berikut.
```
# wpa_cli
```
Kita akan melakukan scanning wifi untuk melihat wifi yang tersedia dengan command **scan**.
```
> scan
OK
<3>CTRL-EVENT-SCAN-STARTED
```
Setelah scanning wifi, hasil bisa dilihat menggunakan command **scan-results**
```
> scan_results
bssid / frequency / signal level / flags / ssid
f4:b8:a7:d5:2f:74       2462    -72     [WPA-PSK-CCMP][WPA2-PSK-CCMP][WPS][ESS] FOSS
c4:ff:1f:c0:7b:08       2462    -75     [WPA-PSK-CCMP+TKIP][WPA2-PSK-CCMP+TKIP][ESS]    dyndim
48:f8:db:55:84:78       2462    -85     [WPA-PSK-CCMP+TKIP][WPA2-PSK-CCMP+TKIP][ESS]    AZEBA
```
Kita akan menambah network dengan perintah **add_network**
```
> add_network
0
```
Kenapa hasilnya 0? Karena sebelumnya kita tidak pernah menambahkannya. Selanjutnya kita akan membuat credentialnya dengan perintah **set_network**.
```
> set_network 0 ssid "FOSS"
OK
> set_network 0 psk "freeopensource"
OK
```
Kalau gak pakai password, kata psk bisa diganti dengan **key_mgmt NONE** seperti di bawah.
```
> set_network 0 key_mgmt NONE
```
Sekarang saatnya menyambungkan wifi nya, dengan cara **enable_network x** yang dimana x adalah **network id**
```
> enable_network 0
```
Jika kita ingin melihat daftar network yang pernah didaftarkan, bisa menjalankan **list_networks**.
```
> list_networks
network id / ssid / bssid / flags
0       FOSS      any     [CURRENT]
```
### wpa_passphrase
Selain wpa_cli, ada yang namanya wpa_passphrase. Di langkah ini, kita diharuskan login sebagai root (su).
```
# wpa_supplicant -B -i interface -c <(wpa_passphrase ssid passphrase)
```
