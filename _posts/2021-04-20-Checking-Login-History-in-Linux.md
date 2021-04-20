---
title: Checking Ligin History in Linux
description: How to check login history in linux
lang: id_ID
date: 2021-04-20 19:27 +0700
layout: post
featured: true
author: leon
image: https://s3-kita-com/gambar.png
categories: [ Linux, tutorial ]
---

### 1) Checking login history of all logged users in Linux

Jalankan command  **‘last’** tanpa argument apapun untuk melihat semua history login yang berhasil masuk.

Jika history nya banyak, gunakan command `less`  or  `more`untuk men shorting.

```
# last -3

root     pts/0        125.163.129.231  Mon Mar 15 18:38   still logged in   
root     pts/0        125.163.129.231  Mon Mar 15 17:25 - 17:25  (00:00)    
root     pts/0        125.163.129.231  Mon Mar 15 17:23 - 17:23  (00:00)    

wtmp begins Mon Mar  1 01:41:24 2021

```

### 2) Checking login history for a particular user

Jika ingin melihat history login user tertentu, gunakan command dibawah ini. Replace **'user_name'** dengan nama user yang ingin di cek.

```
# last root -5

root     pts/0        125.163.129.231  Mon Mar 15 18:38   still logged in   
root     pts/0        125.163.129.231  Mon Mar 15 17:25 - 17:25  (00:00)    
root     pts/0        125.163.129.231  Mon Mar 15 17:23 - 17:23  (00:00)    
root     pts/0        125.163.129.231  Mon Mar 15 17:22 - 17:23  (00:01)    
root     pts/0        36.90.63.242     Thu Mar 11 23:21 - 23:22  (00:01)    

wtmp begins Mon Mar  1 01:41:24 2021

```

### 3) How to check login history for a particular period in Linux?

Jika ingin memeriksa siapa yang telah login dalam jangka waktu tertentu, gunakan format berikut.

```
# last -F -5 | grep -E 'Mar ([ 1-9]|1[0-9]|2[0-9]|30)' | grep 2021

root     pts/0        125.163.129.231  Mon Mar 15 18:38:48 2021   still logged in                      
root     pts/0        125.163.129.231  Mon Mar 15 17:25:18 2021 - Mon Mar 15 17:25:23 2021  (00:00)    
root     pts/0        125.163.129.231  Mon Mar 15 17:23:23 2021 - Mon Mar 15 17:23:26 2021  (00:00)    
root     pts/0        125.163.129.231  Mon Mar 15 17:22:02 2021 - Mon Mar 15 17:23:20 2021  (00:01)    
root     pts/0        36.90.63.242     Thu Mar 11 23:21:18 2021 - Thu Mar 11 23:22:56 2021  (00:01)    
wtmp begins Mon Mar  1 01:41:24 2021
```
Jika ingin memeriksa suatu user yang telah login dalam jangka waktu tertentu, gunakan format berikut.

```
# last -F root -5 | grep -E 'Mar ([ 1-9]|1[0-9]|2[0-9]|30)' | grep 2021

root     pts/0        125.163.129.231  Mon Mar 15 18:38:48 2021   still logged in                      
root     pts/0        125.163.129.231  Mon Mar 15 17:25:18 2021 - Mon Mar 15 17:25:23 2021  (00:00)    
root     pts/0        125.163.129.231  Mon Mar 15 17:23:23 2021 - Mon Mar 15 17:23:26 2021  (00:00)    
root     pts/0        125.163.129.231  Mon Mar 15 17:22:02 2021 - Mon Mar 15 17:23:20 2021  (00:01)    
root     pts/0        36.90.63.242     Thu Mar 11 23:21:18 2021 - Thu Mar 11 23:22:56 2021  (00:01)    
wtmp begins Mon Mar  1 01:41:24 2021

```

### 4) Checking login history based on a terminal connected

Jika ingin memeriksa user berdasarkan terminal yang terhubung. Gunakan format berikut.

```
# last pts/0 -5

root     pts/0        125.163.129.231  Mon Mar 15 18:38   still logged in   
root     pts/0        125.163.129.231  Mon Mar 15 17:25 - 17:25  (00:00)    
root     pts/0        125.163.129.231  Mon Mar 15 17:23 - 17:23  (00:00)    
root     pts/0        125.163.129.231  Mon Mar 15 17:22 - 17:23  (00:01)    
root     pts/0        36.90.63.242     Thu Mar 11 23:21 - 23:22  (00:01)    

wtmp begins Mon Mar  1 01:41:24 2021

```

### 5) How to check bad login history in Linux?

Gunakan command **lastb** untuk memeriksa bad login.

```
# lastb -5

root     ssh:notty    120.28.109.188   Mon Mar 15 19:02 - 19:02  (00:00)    
mosquitt ssh:notty    103.10.87.54     Mon Mar 15 19:01 - 19:01  (00:00)    
mosquitt ssh:notty    103.10.87.54     Mon Mar 15 19:01 - 19:01  (00:00)    
software ssh:notty    120.28.109.188   Mon Mar 15 19:01 - 19:01  (00:00)    
software ssh:notty    120.28.109.188   Mon Mar 15 19:01 - 19:01  (00:00)    

btmp begins Mon Mar  1 00:52:28 2021
```

Jalankan command dibawah ini untuk menyembunyikan informasi hostname.

```
# last -5 -R

root     pts/0        Mon Mar 15 18:38   still logged in   
root     pts/0        Mon Mar 15 17:25 - 17:25  (00:00)    
root     pts/0        Mon Mar 15 17:23 - 17:23  (00:00)    
root     pts/0        Mon Mar 15 17:22 - 17:23  (00:01)    
root     pts/0        Thu Mar 11 23:21 - 23:22  (00:01)    

wtmp begins Mon Mar  1 01:41:24 2021

```
