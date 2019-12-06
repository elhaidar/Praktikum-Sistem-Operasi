#!/bin/bash

pilihan=1;
while [ $pilihan -ne 2 ];
do
echo "1. Menu Kalkulator Loop";
echo "2. Exit";
echo "Pilihan : ";
read pilihan;
if [ $pilihan -eq 1 ]
then
echo "Masukkan Bilangan acuan : ";
read bil;
echo "Masukkan batasan loop : ";
read loop;
echo "Penjumlahan";
 for ((i=1; i<=$loop; i=i+1))
  do
   jumlah=0;
   let jumlah=$bil+$i;
   echo "$bil + $i = $jumlah";
 done
echo "Pengurangan";
 for ((i=1; i<=$loop; i=i+1))
  do
   jumlah=0;
   let jumlah=$bil-$i;
   echo "$bil - $i = $jumlah";
 done
echo "Pembagian";
 for ((i=1; i<=$loop; i=i+1))
  do
   jumlah=0;
   let jumlah=$bil/$i;
   echo "$bil / $i = $jumlah";
 done
echo "Perkalian";
 for ((i=1; i<=$loop; i=i+1))
  do
   jumlah=0;
   let jumlah=$bil*$i;
   echo "$bil x $i = $jumlah";
 done
fi
done
