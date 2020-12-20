#!/bin/bash
# Maintener Yonz

export tanggal=`date +%F`

## New File

echo "Generate new post has been triggered~"

echo ""

read -p "Masukan Nama File (gunakan '-' sebagai pemisah): " file

touch /home/imonk/belajar-linux-id/_drafts/$tanggal-$file.md

echo "";

echo "Tersimpan pada /home/imonk/belajar-linux-id/_drafts/$tanggal-$file.md"

## Add Default Header

echo "---
title: Judul Mu
description: "Tulis deskripsi postingan"
lang: id_ID
layout: post
date: yyyy-mm-dd HH:MM +0700
author: Nama-Mu
image: https://s3-kita-com/gambar.png
categories: [ Jekyll, tutorial ]
---" > /home/imonk/belajar-linux-id/_drafts/$tanggal-$file.md