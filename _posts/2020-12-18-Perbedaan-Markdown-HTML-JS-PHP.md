---
title: Perbedaan Markdown HTML JS PHP
description: Hanya percobaan saja
date: '2020-12-18 02:54:38'
author: nurhamim
image: 'assets/images/test-template-docker.png'
featured: true
categories: [ centos, ubuntu ]
---

Menggunakan JS

```javascript
function test() { 
    console.log("look ma’, no spaces");}
```

Menggunakan PHP

```php
<?php
class GO_Example_Model_Thing extends GO_Base_Db_ActiveRecord {
```

Menggunakan HTML

<table><tr><td>
<pre>
**Hello**,

_world_.
</pre>
</td></tr></table>

Membuat Heading

Heading atau judul di markdown dapat dibuat dengan tanda pagar #.

Contoh:

# Heading 1
## Heading 2
### Heading 3

Maka akan menghasilkan:

<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>

Heading ini sampai level 6 seperti pada HTML. Jumlah tanda pagar di depannya menandakan levelnya.

Selain menggunakan tanda pagar, ada juga yang menggunakan simbol minus (-) dan samadengan (=) seperti ini:

Ini Headeing Level 1
====================

ini paragraf, bla bla bla...

Ini heading level 2
-------------------

ini paragraf, bla bla bla...

Format Teks

Jika kamu ingin menulis teks tebal, miring, dan strikeline, maka bisa dilakukan seperti ini:

**Tebal**
*miring*
~~strikeline~~

Selain menggunakan tanda bintang, untuk teks tebal dan miring bisa juga menggunakan garis bawah (underscore) seperti ini:

__teks tebal__
_teks miring_

Membuat Link

Link dapat kita buat dengan tanda kurung seperti ini:

[link ke petanikode](https://www.petanikode.com/)

Hasilnya:

link ke petanikode

Kita juga bisa menambahkan title untuk tooltips:

[link ke petanikode](https://www.petanikode.com/ "Pergi ke petanikode.com")


Menyisipkan Gambar

Caranya hampir sama dengan membuat link. Kita tinggal tambahkan tanda seru (!) di depannya.

Contoh:

![Gambar teks editor VS Code](https://www.petanikode.com/img/markdown/markdown-vscode.png)

List dapat kita buat seperti ini:

* Milk
* Bread
    * Wholegrain
* Butter


1. Tidy the kitchen
2. Prepare ingredients
3. Cook delicious things


Untuk unordered list, kita bisa menggunakan tanda bintang (*) dan juga minus (-).

Contoh:

- item 1
- item 2
- item 3

Membuat Todo List atau Checklist

Sebenarnya ini pengembangan dari markdown. Tidak semua editor mendukung fitur ini.

Contoh:

**Tugas hari ini:**

- [x] Menulis artikel tentang markdown
- [ ] Belajar Git di Petanikode
- [ ] Belajar Bahasa pemrograman Rust
- [x] Membuat template blog dengan bootstrap
