#!/bin/bash
md5sum  aerials/*.tiff >aerials_list.txt
md5sum  misc/*.tiff >misc_list.txt
md5sum  sequences/*.tiff >sequences_list.txt
md5sum  textures/*.tiff >textures_list.txt
cat aerials_list.txt misc_list.txt sequences_list.txt textures_list.txt | uniq -w32 --unique | cut -c 35- | wc -l
rm *.txt
