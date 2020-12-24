---
title: Cara Menggunakan S3 menggunakan PHP AWS-SDK
description: SDK adalah perpustakaan PHP open source yang modern, yang memudahkan untuk mengintegrasikan aplikasi PHP Anda dengan layanan AWS seperti Amazon S3, Amazon Glacier, dan Amazon DynamoDB.
lang: id_ID
layout: post
date: 2020-12-24 20:00 +0700
featured: true
author: leon
image: https://cdn-blinux.s3-id-jkt-1.kilatstorage.id/post/leon/PHP-AWS-SDK.png
categories: [ php, s3, centos, ubuntu ]
---

Mulai secara cepat menggunakan AWS dengan SDK AWS untuk PHP. SDK adalah perpustakaan PHP open source yang modern, yang memudahkan untuk mengintegrasikan aplikasi PHP Anda dengan layanan AWS seperti Amazon S3, Amazon Glacier, dan Amazon DynamoDB.

Pada post ini saya ingin berbagi source code yang biasanya saya gunakan untuk melakukan integrasi S3 dengan PHP AWS-SDK.

Terdapat beberapa code dasar yang ingin saya bagikan yaitu:

> - Koneksi S3
> - Create Bucket
> - Listing Bucket
> - Upload Object
> - Delete Object
> - Contoh Full Code

Sebelum kita mulai ke topik pembahasan, silakan untuk dipersiapkan dulu requirement untuk menjalankan S3 PHP SDK ini:

- PHP >=7.0 
- composer ( https://getcomposer.org/download/ )
- Module aws-sdk-php ( https://docs.aws.amazon.com/sdk-for-php/v3/developer-guide/getting-started_installation.html )

Anda bisa melakukan instalasi PHP menggunakan panduan yang telah kami sediakan berikut ini:

- [**Install PHP 8 pada Ubuntu Server 20.04 LTS**](https://belajarlinux.id/install-php-8-pada-ubuntu-server-20-04-lts/)
- [**CentOS: Cara Install PHP 8 di CentOS 7**](https://belajarlinux.id/cara-install-php-8-di-centos-7/)
- [**CentOS: Cara Install PHP 8 di CentOS 8**](https://belajarlinux.id/cara-install-php-8-di-centos-8/)

Perlu dicatat untuk melakukan define composer autoloader pada code yang dibuat:

```
require'vendor/autoload.php';
use Aws\S3\S3Client;
use Aws\S3\Exception\S3Exception;
```

## Koneksi S3

Berikut adalah code untuk koneksi PHP ke layanan S3 :

```php
$client = S3Client::factory([
    'version' => 'latest',
    'region'  => 'id-jkt-1',
    'endpoint' => 'http://ENDPOINT-S3-ANDA',
    'credentials' => [
        'key'    => "KEY-S3-ANDA",
        'secret' => "SECRET-KEY-S3-ANDA"
    ]
 ]);
```

## Create Bucket

Berikut adalah contoh code untuk melakukan create bucket menggunakan PHP SDK:

```php
try {
    $result = $client->createBucket([
	'Bucket' => 'BERI-NAMA-BUCKET-DISINI',
    ]);
} catch (S3Exception $e) {
    echo $e->getMessage();
}
```

## Listing Bucket

Berikut adalah contoh code untuk melakukan listing semua bucket yang berada pada layanan S3 menggunakan PHP SDK:

```php
try {
    $buckets = $client->listBuckets();
    foreach ($buckets['Buckets'] as $bucket) {
	echo $bucket['Name'] . "\n";
	}
} catch (S3Exception $e) {
    echo $e->getMessage();
}
```

## Upload Object

Berikut adalah contoh code untuk melakukan upload object dari device Anda ke layanan S3 menggunakan PHP SDK:

```php
try {
    $client->putObject([
        'Bucket'     =>'NAMA-BUCKET-ANDA',
        'Key'        => 'NAMA-OBJEK-YANG-AKAN-DITERAPKAN',
        'ContentType' => 'image/png', // menyesuaikan dengan konten yang ingin diupload
        'SourceFile' => 'LOKASI-FILE',    // like /var/www/vhosts/mysite/file.csv
        'ACL'        => 'public-read', //public-read atau private
    ]);
} catch (S3Exception $e) {
    // Catch an S3 specific exception.
    echo $e->getMessage();
}
```

## Delete Object

Berikut adalah contoh code untuk melakukan delete object yang berada pada layanan S3 menggunakan PHP SDK:

```php
try {
    $result = $client->deleteObject([
        'Bucket' => 'NAMA-BUCKET-ANDA',
        'Key' => 'NAMA-OBJEK-ANDA',
    ]);
} catch (S3Exception $e) {
    echo $e->getMessage();
}
```

## Contoh Full Code

Kurang lengkap rasanya jika tidak memberikan contoh full dari code yang sudah saya bagikan diatas, berikut adalah contoh penggunaan PHP SDK sebagai uploader menggunakan HTML:

```php
<?php
require'vendor/autoload.php';
use Aws\S3\S3Client;
use Aws\S3\Exception\S3Exception;

if(isset($_FILES['image'])){
        $file_name = $_FILES['image']['name'];
        $temp_file_location = $_FILES['image']['tmp_name'];

$client = S3Client::factory([
    'version' => 'latest',
    'region'  => 'id-jkt-1',
    'endpoint' => 'http://ENDPOINT-S3-ANDA',
    'credentials' => [
        'key'    => "KEY-S3-ANDA",
        'secret' => "SECRET-KEY-S3-ANDA"
    ]
 ]);

try {
    $client->putObject([
        'Bucket'     =>'NAMA-BUCKET-ANDA',
        'Key'        => $file_name,
        'ContentType' => 'image/png',
        'SourceFile' => $temp_file_location,    // like /var/www/vhosts/mysite/file.csv
        'ACL'        => 'public-read',
    ]);
} catch (S3Exception $e) {
    // Catch an S3 specific exception.
    echo $e->getMessage();
}
}
?>
<html>
<form action="" method="POST" enctype="multipart/form-data">
<input type="file" name="image" />
<input type="submit"/>
</form>
</html>
```

## Selesai

Selamat mencoba dan semoga bermanfaat.

