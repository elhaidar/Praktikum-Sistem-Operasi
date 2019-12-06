#!/bin/bash

echo "Input Menit : ";

read menit;

let hari=$menit/1440;

let sisa=$menit%1440;

let jam=$sisa/60;

let sisa=$sisa%60;


if [ $hari -ge 1 ]

then

echo "$hari Hari"

	if [ $jam -ge 1 ]

	then

	echo "$jam Jam"

		if [ $sisa -ge 1 ]

		then

		echo "$sisa Menit"

		fi

	fi

elif [ $jam -ge 1 ]

then

echo "$jam Jam"

	if [ $sisa -ge 1 ]

	then

	echo "$sisa Menit"

	fi

elif [ $sisa -ge 1 ]

then

echo "$sisa Menit"

else

echo "Invalid"

fi



