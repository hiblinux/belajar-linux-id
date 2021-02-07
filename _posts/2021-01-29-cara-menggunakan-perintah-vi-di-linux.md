---
title: Cara Menggunakan Editor Vi di Linux
description: 'Editor default yang disertakan dengan sistem operasi UNIX disebut vi (editor visual). Dengan menggunakan editor vi, kita dapat mengedit file yang ada atau membuat file baru dari awal. kami juga dapat menggunakan editor ini untuk hanya membaca file teks'
lang: id_ID
date: 2021-01-29 17:00 +0700
layout: post
featured: true
author: nurhamim
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/editor-vi.png
categories:
 - linux
---

[Belajar Linux ID](https://belajarlinux.id) -  Editor default yang disertakan dengan sistem operasi UNIX disebut `vi (editor visual)`. Dengan menggunakan editor `vi`, kita dapat mengedit file yang ada atau membuat file baru dari awal. kami juga dapat menggunakan editor ini untuk hanya membaca file teks.

### Sintak

```bash
$ vi filename
```

**Input**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/vi1.png)

**Output**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/vi2.png)

Di editor vi terdapat tiga *Mode Operasi* yaitu: 

*1. Command Mode*
*2. Escape Mode*
*3. Insert Mode*

Alurnya dari tiga *mode operasi* diatas seperti berikut

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/Vieditor.jpg)

Berikut penjelasan masing-masing mode operasi diatas:

- **Command Mode:** Saat `vi` dijalankan, `vi` berada dalam Mode Perintah. Mode ini adalah tempat `vi` menafsirkan karakter apa pun yang kita ketik sebagai perintah dan karenanya tidak menampilkannya di jendela. Mode ini memungkinkan kita untuk memindahkan file *(move file)*, dan untuk menghapus *(delete file)*, menyalin *(copy file)*, atau menempelkan teks *(paste file)*.

  Untuk masuk ke Mode Perintah dari mode lain, perlu menekan tombol **[Esc]**. Jika kita menekan **[Esc]** ketika kita sudah dalam *Command Mode*, maka `vi` akan berbunyi bip atau flash layar.

- **Insert mode:** Mode ini memungkinkan Anda memasukkan teks ke dalam file. Semua yang diketik dalam mode ini diinterpretasikan sebagai masukan dan akhirnya dimasukkan ke dalam file. `Vi` selalu dimulai dalam mode perintah. Untuk memasukkan teks, Anda harus berada dalam *insert mode*. Untuk masuk ke mode insert Anda cukup mengetik **i**. Untuk keluar dari mode insert, tekan tombol **Esc**, yang akan mengembalikan Anda ke mode perintah *(Command Mode)*.

- **Last Line Mode(Escape Mode):** Mode Baris dipanggil dengan mengetik titik dua [:], sedangkan `vi` dalam Mode Perintah. Kursor akan melompat ke baris terakhir layar dan `vi` akan menunggu perintah. Mode ini memungkinkan Anda untuk melakukan tugas seperti menyimpan file, menjalankan perintah.

### Memulai Menggunakan Vi

Berikut beberapa command untuk memulai menggunakan `vi`:

**Perintah (command) beserta deskripsi**:

- **vi filename**: Membuat file baru jika sudah tidak ada, jika tidak membuka file yang sudah ada.
- **vi -R filename**: Membuka file yang ada dalam mode *read only (hanya baca)*.
- **view filename**: Membuka file yang ada dalam mode *read only (hanya baca)*.

**Navigasi di vi**:

Untuk berpindah-pindah di dalam file tanpa mempengaruhi teks harus dalam mode command (tekan Esc dua kali). Berikut adalah beberapa perintah yang dapat digunakan untuk berpindah karakter satu per satu.

- **k:** Memindahkan kursor ke atas satu baris.
-  **j:** Memindahkan kursor ke bawah satu baris.
- **h:** Memindahkan kursor ke posisi satu karakter kiri.
- **l:** Memindahkan kursor ke posisi satu karakter kanan.
- **0** atau **|** : Menempatkan kursor di awal baris.
- **$:** Menempatkan kursor di akhir baris.
- **W:** Menempatkan kursor ke kata berikutnya.
- **B:** Menempatkan kursor ke kata sebelumnya.
- **(:** Menempatkan kursor ke awal kalimat saat ini.
- **):** Menempatkan kursor ke awal kalimat berikutnya.
- **H:** Pindah ke atas layar.
- **nH:** Pindah ke baris ke n dari atas layar.
- **M:** Pindah ke tengah layar.
- **L:** Pindah ke bawah layar.
- **nL:** Pindah ke baris n dari bagian bawah layar.
- **colon along with x:** Titik dua diikuti dengan angka akan menempatkan kursor pada nomor baris yang diwakili oleh x.

**Control Commands(Scrolling):** Ada perintah yang berguna dan dapat digunakan secara bersama dengan *Control Key*:

- **CTRL + d:** Maju 1/2 layar.
- **CTRL + f:** Maju satu layar penuh.
- **CTRL + u:** Pindah ke belakang 1/2 layar.
- **CTRL + b:** Mundur satu layar penuh.
- **CTRL + e:** Memindahkan layar satu baris ke atas.
- **CTRL + y:** Memindahkan layar ke bawah satu baris.
- **CTRL + u:** Memindahkan layar ke atas 1/2 halaman.
- **CTRL + d:** Memindahkan layar ke bawah 1/2 halaman.
- **CTRL + b:** Pindah layar satu halaman.
- **CTRL + f:** Memindahkan layar ke bawah satu halaman.
- **CTRL + I:** *Redraws screen* *(gambar ulang layar)*.

**Editing and inserting in Files(Entering and Replacing Text):** Untuk mengedit file, kita harus berada dalam mode insert. Ada banyak cara untuk masuk ke mode penyisipan *(mode from)* dari mode perintah.

- **i:** Menyisipkan teks sebelum lokasi kursor saat ini.
- **I:** Menyisipkan teks di awal baris saat ini.
- **a:** Menyisipkan teks setelah lokasi kursor saat ini.
- **A:** Menyisipkan teks di akhir baris saat ini.
- **o:** Membuat baris baru untuk entri teks di bawah lokasi kursor.
- **O:** Membuat baris baru untuk entri teks di atas lokasi kursor.
- **r:** Mengganti karakter tunggal di bawah kursor dengan karakter berikutnya yang diketik.
- **R:** Mengganti teks dari kursor ke kanan.
- **s:** Mengganti satu karakter di bawah kursor dengan sejumlah karakter.
- **S:** Mengganti seluruh baris.

**Deleting Characters:** Berikut adalah daftar perintah penting yang dapat digunakan untuk menghapus karakter dan baris dalam file yang dibuka.

- **X Huruf Besar:** Menghapus karakter sebelum lokasi kursor.
- **x Huruf kecil:** Menghapus karakter di lokasi kursor.
- **Dw:** Menghapus dari lokasi kursor saat ini ke kata berikutnya.
- **d ^:** Menghapus dari posisi kursor saat ini ke awal baris.
- **d $:** Menghapus dari posisi kursor saat ini ke akhir baris.
- **Dd:** Menghapus garis tempat kursor berada.

**Copy and Past Commands:** Salin baris atau kata dari satu tempat dan tempelkan di tempat lain dengan menggunakan perintah berikut ini.

- **Yy:** Menyalin baris saat ini.
- **9yy:** Yank baris saat ini dan 9 baris di bawahnya.
- **p:** Menempatkan teks yang disalin setelah kursor.
- **P:** Menempatkan teks yang ditarik sebelum kursor.

**Save and Exit Commands of the ex Mode:** Perlu menekan tombol **[Esc]** diikuti oleh titik dua **(:)** sebelum mengetik perintah berikut:

- **q:** quit *(Berhenti)*
- **q!:** Keluar tanpa menyimpan perubahan, yaitu membuang perubahan.
- **r fileName**: Membaca data dari file bernama fileName.
- **wq:** Menulis dan keluar (simpan dan keluar).
- **w fileName:** Menulis ke file bernama fileName (simpan sebagai).
- **w! fileName:** Menimpa file bernama fileName (simpan sebagai paksa).
- **!cmd:** Menjalankan perintah shell dan kembali ke mode Command.

**Searching and Replacing in  (ex Mode):** **vi** juga memiliki kemampuan mencari dan mengganti. Sintaks formal untuk pencarian adalah:

````bash
:s/string
````

Misalnya, kita ingin mencari beberapa teks untuk string "Belajar" Ketik berikut ini dan tekan ENTER:

**Input:**

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/vi3.png)

**Output:** 

![](https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/hamim/vi4.png)

Sintaks untuk mengubah satu string dengan string lain di baris saat ini adalah

```bash
:s/pattern/replace/ 
```

Di sini "pattern" mewakili string lama dan "replace" mewakili string baru. 

Sintaks untuk mengubah setiap kemunculan string di seluruh teks serupa. Satu-satunya perbedaan adalah penambahan "%" di depan "s": 

```bash
:%s/pattern/replace/ 
```

Itulah beberapa command dan perintah dalam penggunaan editor vi. 

Selamat mencoba 😊

Referensi: http://www.linfo.org/vi/
