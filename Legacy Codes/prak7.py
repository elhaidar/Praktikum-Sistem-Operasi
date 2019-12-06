from os import getpid
from time import time, sleep
from multiprocessing import Pool, Process

print("Input :")

def modulus(angka):
	global angka_bagi

	if angka % angka_bagi == 0:
		print(angka*angka,"ID proses", getpid())
	else:
		print(angka, "ID proses", getpid())
	sleep(1)

if __name__ == '__main__':
	awal = 1
	angka_bagi = int(input())
	akhir = int(input())
	akhir = akhir*akhir
    
	print("\nEksekusi Sekuensial")
	sekuensial_awal = time()

	for i in range(awal, akhir+1):
		modulus(i)

	sekuensial_akhir= time()
    
	print("\nEksekusi Process")
	kumpulan_proses = []

	process_awal = time()

	for i in range(awal, akhir+1):
		p = Process(target=modulus, args=(i,))
		kumpulan_proses.append(p)
		p.start()

	for i in kumpulan_proses:
		p.join()

	process_akhir = time()
    
	print("\nEksekusi Pool")
	pool_awal = time()
	
	pool = Pool()
	pool.map(modulus, range(awal,akhir+1))
	pool.close()

	pool_akhir = time()
    
print("\nWaktu eksekusi dengan pemrograman sekuensial : ", sekuensial_akhir-sekuensial_awal, "detik")
print("Waktu eksekusi dengan process : ", process_akhir-process_awal, "detik")
print("Waktu eksekusi dengan pool : ", pool_akhir-pool_awal, "detik")
