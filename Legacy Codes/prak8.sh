#!/bin/bash

declare -a nama; declare -a jurusan;
declare -a npm; declare -a semester;
declare -a sisop; declare -a belneg;
declare -a pemlan; declare -a statkom;
declare -a rata;

n=0;
i=0;
j=0;
mhs() {
	read -p "Nama : " nama[$n];
	read -p "NPM : " npm[$n];
	read -p "Jurusan : " jurusan[$n];
	read -p "Semester : " semester[$n];
}

nilai() {
	read -p "Sistem Operasi : " sisop[$j];
	read -p "Pemrograman Lanjut : " pemlan[$j];
	read -p "Bela Negara : " belneg[$j];
	read -p "Statkom : " statkom[$j];
}

view() {
	let data=$i+1;
	echo "==Data Mhs Ke-$data";
	echo "Nama : ${nama[i]}";
	echo "NPM : ${npm[i]}";
	echo "Jurusan : ${jurusan[i]}";
	echo "Semester : ${semester[i]}";
	echo "Sistem Operasi : ${sisop[i]}";
	echo "Pemrograman Lanjut : ${pemlan[i]}";
	echo "Bela Negara : ${belneg[i]}";
	echo "Statkom : ${statkom[i]}";
}

ipk() {
	let rata[i]=${sisop[i]}+${pemlan[i]}+${belneg[i]}+${statkom[i]};
}

calc() {
	awk "BEGIN{print $*}";
}

pilihan=1;

while [ $pilihan -ne 5 ];
do
echo "1. Input Data Mhs";
echo "2. Input Data Nilai MK Mhs";
echo "3. View Data Mhs";
echo "4. Nilai IP Mhs";
echo "5. Exit"
echo "Pilihan : ";
read pilihan;

if [ $pilihan -eq 1 ]
then
	mhs
	n=$n+1;
fi

if [ $pilihan -eq 2 ]
then
ketemu=0;
read -p "Masukkan NPM yang ingin diinput nilainya : " search;
	for ((j=0; j<$n; j++))
	do
		if [ $search -eq ${npm[j]} ]
		then
		echo "Nilai MK atas nama : ${nama[j]}";
		nilai
		ketemu=1;
		fi
	done
	if [ $ketemu -ne 1 ]
	then
	echo "Data tidak ditemukan";
	fi
fi

if [ $pilihan -eq 3 ]
then
	for((i=0; i<$n; i++))
	do
	view
	done
fi

if [ $pilihan -eq 4 ]
then
	for((i=0; i<$n; i++))
	do
	ipk
	done
	for((i=0; i<$n; i++))
	do
	let data=$i+1;
	echo "==Data Mhs Ke-$data";
	echo "Rata rata IP Mahasiswa : ";calc ${rata[i]}/4;
	done
fi
done
