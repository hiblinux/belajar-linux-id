---
title: Cara Aktifkan Video Acceleration (VAAPI) di Firefox
description: Ketika menggunakan video acceleration, beban penggunaan cpu saat menonton video menjadi lebih rendah  
lang: id_ID
date: 2021-09-02 20:22 +0700
layout: post
featured: true
author: Radhitya
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/radhitya/photo_2021-09-02_09-01-33.jpg
categories:
- linux
- debian
---

Ketika menggunakan video acceleration, beban penggunaan cpu saat menonton video menjadi lebih rendah dan mengurangi kebisingan kipas. Terkadang menonton video di youtube, tiba tiba cpu usage menjadi lebih tinggi sehingga menyebabkan laptop jadi panas. Bisa jadi karena anda belum mengaktifkan video acceleration. Hari ini kita akan praktek cara aktifkan video acceleration atau vaapi di Firefox 91.

## Mengaktifkan Video Acceleration atau VAAPI di Firefox 91
1. Pertama kita rubah `media.ffmpeg.vaapi.enabled` menjadi `true`.
2. Kemudian ganti `media.ffvpx.enabled` menjadi `false`. Tahap ini akan menonaktifkan decoder VP8/VP9.
3. Selanjutnya ubah `media.navigator.mediadatadecoder_vpx_enabled` menjadi `true`. Cuman bagian ini berpengaruh ketika menggunakan aplikasi konferensi video. Jika bermasalah, silahkan ubah seperti semula.
4. Terakhir, ganti `media.rdd-vpx.enabled` menjadi `false`.

Jangan lupa restart firefox untuk perubahan. Kalau anda pengguna iGPU bisa mendownload `intel-gpu-tools` di repositori, cara menjalankannya dengan perintah `sudo intel_gpu_top`. Jika bar `Video/0` diatas 0%, maka video acceleration berhasil dijalankan
