#!/bin/bash

declare -a idbrg; declare -a namabrg; declare -a hargabrg; declare -a jumlahbrg;
declare -a username; declare -a passwordadm; declare -a namaadm;
declare -a idmember; declare -a passwordmem; declare -a namamember;
pilihan=1;
q=0;
n=0;
m=0;
regadmin() {
	echo "Registrasi"
	read -p "Username : " username[$q];
	read -p "Password : " passwordadm[$q];
	read -p "Nama Lengkap : " namaadm[$q];
	echo "================================"
}
loginadmin() {
	echo "Login"
	read -p "Username : " usernameinput;
	read -p "Password : " passwordinput;
}
inputbrg() {
	echo "Input Data"
	read -p "ID Barang : " idbrg[$1];
	read -p "Nama Barang : " namabrg[$1];
	read -p "Harga Barang : " hargabrg[$1];
	read -p "Jumlah Barang : " jumlahbrg[$1];
}
viewbrg() {
	echo "ID Barang : ${idbrg[i]}"
	echo "Nama Barang : ${namabrg[i]}"
	echo "Harga Barang : ${hargabrg[i]}"
	echo "Jumlah Barang : ${jumlahbrg[i]}"
	echo "-------------------------------"
}
transaksi() {
		belilagi=1;
		totalharga=0;
		while [ $belilagi -ne 3 ]
		do
		if [ $belilagi -eq 1 ]
		then
		echo -e "\nID\tNama Barang\tHarga"
		for((i=0; i<$n; i++))
		do
			echo -e "${idbrg[i]}\t${namabrg[i]}\t${hargabrg[i]}"
		done
		echo ""
		read -p "Input ID Barang yang ingin dibeli : " beli
		read -p "Jumlah barang yang ingin dibeli : " jumlahbeli
		ketemu=0;
		for((i=0; i<$n; i++))
		do
		 if [[ ${beli,,} =~ ${idbrg[i]} ]]
		 then
			harga=0;
			let harga=${hargabrg[i]}*$jumlahbeli;
			let totalharga=$totalharga+$harga;
			echo "Sukses Menambah Belanjaan"
			ketemu=1;
		 fi
		done
		if [ $ketemu -eq 1 ]
		then
			echo -e "\n---------------------------------"
			echo "Total Belanjaan : $totalharga"
			echo "--------------------------------"
			read -p "Ingin membeli produk lain?(1.Ya 2.Tidak) : " belilagi
		else
			echo "Data tidak ditemukan"
		fi
		elif [ $belilagi -eq 2 ]
		then
		csmember=1;
			while [ $csmember -ne 2 ]
			do
			echo -e "\nApakah anda memiliki kartu member?(1.Ya 2.No) : "
			read csmember;
			ketemu=0;
			if [ $csmember -eq 1 ]
			then
				read -p "Masukkan ID Member anda : " memberinput
				for((i=0; i<$m; i++))
				do
				if [[ ${memberinput,,} =~ ${idmember[i]} ]]
				then
					ketemu=1;
				fi
				done
			if [ $ketemu -eq 1 ]
			then
				let diskon=$totalharga/10;
				pembayaran
				csmember=2;
				belilagi=3;
			else
				echo "ID Member Invalid"
			fi
			elif [ $csmember -eq 2 ]
			then
				diskon=0;
				pembayaran
				belilagi=3;
			fi
			done
		else
			echo "Invalid input"	
		fi
		done

}
pembayaran() {
	echo -e "\n---------------------------------------"
	echo "Total Belanjaan : Rp.$totalharga"
	echo "Diskon : Rp.$diskon"
	read -p "Input Jumlah Pembayaran : Rp." bayar
	let charge=$bayar-$totalharga+$diskon;
	echo "Charge : Rp.$charge"
	echo "Terima Kasih"
	echo "---------------------------------------"
}
member() {
	echo "Registrasi Member"
	read -p "ID Member : " idmember[$1]
	read -p "Password : " passwordmem[$i]
	read -p "Nama Member : " namamember[$1]
	echo "Sukses"
}
while [ $pilihan -ne 3 ]
do
	echo -e "\n============ Aplikasi Minimarket ============="
	echo "1. Register Admin"
	echo "2. Login Admin"
	echo "3. Exit"
	read -p "Masukkan pilihan : " pilihan;
	echo "============================="
	if [ $pilihan -eq 1 ]
	then
		regadmin
		let q=$q+1;
	elif [ $pilihan -eq 2 ]
	then
	 login=0;
	 while [ $login -ne 1 ]
	 do
		loginadmin
		if [ $q -eq 0 ]
		then
			echo "Belum ada data admin"
			pilihan=0;
			login=1;
		fi
		for ((i=0; i<$q; i++))
		do
			if [[ ${usernameinput,,} =~ ${username[i]} ]] && [[ ${passwordinput,,} =~ ${passwordadm[i]} ]]
			then
				login=1;
				echo "Sukses Login"
menu=0;
while [ $menu -ne 8 ]
do
	echo -e "\n=== Menu Aplikasi Minimarket Sederhana ==="
	echo "1. Input Data Barang"
	echo "2. View Data Barang"
	echo "3. Search Data Barang"
	echo "4. Update Data Barang"
	echo "5. Transaksi"
	echo "6. Daftar Member"
	echo "8. Log Out"
	read -p "Masukkan pilihan : " menu;
	if [ $menu -eq 1 ]
	then
		inputbrg $n
		let n=$n+1;
	elif [ $menu -eq 2 ]
	then
		banyak=0;
		for((i=0; i<$n; i++))
		do
			let banyak=$i+1;
			echo -e "\nData ke-$banyak"
			viewbrg
		done
	elif [ $menu -eq 3 ]
	then
		ketemu=0;
		echo ""
		read -p "Masukkan ID Barang : " cari
		for((i=0; i<$n; i++))
		do
		 if [[ ${cari,,} =~ ${idbrg[i]} ]]
		 then
			ketemu=1;
			echo -e "Data ditemukan!"
			viewbrg
		 fi
		 done
		if [ $ketemu -ne 1 ]
		then
			echo "Data tidak ditemukan!!"
		fi
	elif [ $menu -eq 4 ]
	then
		ketemu=0;
		echo ""
		read -p "Masukkan ID Barang : " cari
		for((i=0; i<$n; i++))
		do
		 if [[ ${cari,,} =~ ${idbrg[i]} ]]
		 then
			ketemu=1;
			echo -e "Data ditemukan!"
			viewbrg
			echo -e "Edit data"
			inputbrg $i

		 fi
		done
		if [ $ketemu -ne 1 ]
		then
			echo "Data tidak ditemukan!!"
		fi
	elif [ $menu -eq 5 ]
	then
		transaksi
	elif [ $menu -eq 6 ]
	then
		member $m
		let m=$m+1;
	elif [ $menu -eq 8 ]
	then
		echo ""
	else
		echo "Invalid Input"
	fi
done
pilihan=0;
			else
				echo "Username/Password Salah"
				login=1;
				pilihan=0;
			fi
		done
	 done
	elif [ $pilihan -eq 3 ]
	then
		echo "Terima Kasih :)"
	else
		echo "invalid input"
	fi
done
