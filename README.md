# SoalShiftSISOP20_modul1_E03
Soal Nomor 1
+ [soal1a.sh](https://github.com/stchffh/SoalShiftSISOP20_modul1_E03/blob/master/soal1/soal1a.sh)
+ [soal1b.sh](https://github.com/stchffh/SoalShiftSISOP20_modul1_E03/blob/master/soal1/soal1b.sh)
+ [soal1c.sh](https://github.com/stchffh/SoalShiftSISOP20_modul1_E03/blob/master/soal1/soal1c.sh)

Penjelasan :
1. Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”. Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :
a) Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit.
```
#!/bin/bash

echo "Region dengan profit paling sedikit adalah:"
awk -F '\t' 'NR > 1 {a[$13]+=$21} END {for(i in a) print i",",a[i]}' Sample-Superstore.tsv | sort -t $"," -n -$2 | awk -F, '{print $1}' | head -n 1
```
- `#!/bin/bash` digunakan agar perintah berikutnya harus dijalankan oleh bash
- `echo` digunakan untuk mencetak tulisan
- `awk` digunakan untuk memilih data yang diperlukan dari banyaknya data yang ada
- `-F '\t\'` digunakan untuk memberitahu awk bahwa pembatas yang dipakai adalah tab
- `NR > 1` Number Row digunakan untuk memberitahu bahwa row/baris yang kita perlukan dimulai dari baris ke-2 dan seterusnya
-`{a[$13]+=$21}` merupakan perintah yang melakukan proses penjumlahan pada kolom ke-21 (profit) dari array kolom ke-13 (region)
- `END {for(i in a) print i",",a[i]}` merupakan perintah untuk looping sebanyak index pada array a dan kemudian mencetak region sesuai dengan hasil penjumlahan pada perintah sebelumnya
- `Sample-Superstore.tsv` merupakan file input
- `sort` digunakan untuk mengurutkan output perintah sebelumnya dengan syarat :
  - `-t $","` merupakan pembatas kolom dengan menggunakan koma
  - `-n` digunakan untuk mengurutkan hasil berdasarkan nilai numerik
  - `$2` digunakan untuk memberitahu bahwa hasil diambil mulai dari kolom ke-2
- `awk -F, '{print $1}` digunakan untuk mencetak kolom pertama dari perintah-perintah sebelumnya
- `head -n 1` digunakan untuk mencetak urutan paling atas dari record hasil perintah sebelumnya
output :
```
oktarizka156@oktarizka156-VirtualBox:~/Documents/soal1$ bash soal1.sh
Central
```
b) Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a.
```
#!/bin/bash

echo "Dua state dengan profit paling kecil berdasarkan poin a adalah:"
awk -F '\t' '/Central/ NR >1 {a[$11]+=$21} END {for(i in a) print i",",a[i]}' Sample-Superstore.tsv | sort -t $"," -g -k2 | awk -F, '{print $1}'| head -2
```
- `#!/bin/bash` digunakan agar perintah berikutnya harus dijalankan oleh bash
- `echo` digunakan untuk mencetak tulisan
- `awk` digunakan untuk memilih data yang diperlukan dari banyaknya data yang ada
- `-F '\t\'` digunakan untuk memberitahu awk bahwa pembatas yang dipakai adalah tab
- `/Central/` merupakan perintah untuk mencari record yang memiliki string 'Central' (output poin a)
- `NR > 1` Number Row digunakan untuk memberitahu bahwa row/baris yang kita perlukan dimulai dari baris ke-2 dan seterusnya
- `{a[$11]+=$21}` merupakan perintah yang melakukan proses penjumlahan pada kolom ke-21 (profit) dari array kolom ke-11 (state)
- `END {for(i in a) print i",",a[i]}` merupakan perintah untuk looping sebanyak index pada array a dan kemudian mencetak region sesuai dengan hasil penjumlahan pada perintah sebelumnya
- `Sample-Superstore.tsv` merupakan file input
- `sort` digunakan untuk mengurutkan output perintah sebelumnya dengan syarat :
  - `-t $","` merupakan pembatas kolom dengan menggunakan koma
  - `-g` digunakan untuk mengurutkan hasil secara general
  - `k2` digunakan untuk memberitahu bahwa hasil diambil mulai dari kolom ke-2
- `awk -F, '{print $1}` digunakan untuk mencetak kolom pertama dari perintah-perintah sebelumnya
- `head -n 2` digunakan untuk mencetak dua urutan paling atas dari record hasil perintah sebelumnya
output :
```
oktarizka156@oktarizka156-VirtualBox:~/Documents/soal1$ bash soal1.sh
Texas
Illinois
```
c) Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b
```
#!/bin/bash

echo "Sepuluh produk yang memiliki profit paling sedikit berdasarkan poin b adalah:"
state1="Illinois"
state2="Texas"
awk -F '\t' -v state1="$state1" -v state2="$state2" '($11~state1) || ($11~state2) {a[$17]+=$21} END {for(i in a) print i";",a[i]}' Sample-Superstore.tsv | sort -t $";" -g -k2 | head -10
```
- `#!/bin/bash` digunakan agar perintah berikutnya harus dijalankan oleh bash
- `echo` digunakan untuk mencetak tulisan
- `awk` digunakan untuk memilih data yang diperlukan dari banyaknya data yang ada
- `-F '\t\'` digunakan untuk memberitahu awk bahwa pembatas yang dipakai adalah tab
- `state1="Illinois" state2="Texas"` digunakan untuk memberitahu sistem bahwa variabel state1 berisi Illinois dan variabel state2 berisi Texas (output dari poin b)
- `($11~state1) || ($11~state2)`digunakan agar record yang memiliki satu dari tiga variabel state ikut terambil
- `{a[$17]+=$21}` merupakan perintah yang melakukan proses penjumlahan pada kolom ke-21 (profit) dari array kolom ke-17 (product)
- `END {for(i in a) print i";",a[i]}` merupakan perintah untuk looping sebanyak index pada array a dan kemudian mencetak region sesuai dengan hasil penjumlahan pada perintah sebelumnya. Pembatas kali ini tidak menggunakan koma dikarenakan takut ada kesalahan dalam looping (product ada yang memiliki koma juga)
- `Sample-Superstore.tsv` merupakan file input
- `sort` digunakan untuk mengurutkan output perintah sebelumnya dengan syarat :
  - `-t $";"` merupakan pembatas kolom dengan menggunakan semicolon
  - `-g` digunakan untuk mengurutkan hasil secara general
  - `k2` digunakan untuk memberitahu bahwa hasil diambil mulai dari kolom ke-2
- `awk -F, '{print $1}` digunakan untuk mencetak kolom pertama dari perintah-perintah sebelumnya
- `head -10` digunakan untuk mencetak sepuluh urutan paling atas dari record hasil perintah sebelumnya
output :
```
oktarizka156@oktarizka156-VirtualBox:~/Documents/soal1$ bash soal1.sh
GBC DocuBind P400 Electric Binding System; -5552.84
Fellowes PB500 Electric Punch Plastic Comb Binding Machine with Manual Bind; -3431.67
Ibico EPK-21 Electric Binding System; -2929.48
Lexmark MX611dhe Monochrome Laser Printer; -1869.99
Ibico Hi-Tech Manual Binding System; -1601.2
GBC DocuBind TL300 Electric Binding System; -1480.03
3.6 Cubic Foot Counter Height Office Refrigerator; -1378.82
Hoover Upright Vacuum With Dirt Cup; -1181.28
GBC ProClick 150 Presentation Binding System; -1147.01
GBC Ibimaster 500 Manual ProClick Binding System; -1141.47
```
+ [soal2a.sh](https://github.com/stchffh/SoalShiftSISOP20_modul1_E03/blob/master/soal2/soal2a.sh)
+ [soal2b.sh](https://github.com/stchffh/SoalShiftSISOP20_modul1_E03/blob/master/soal2/soal2b.sh)
+ [soal2c.sh](https://github.com/stchffh/SoalShiftSISOP20_modul1_E03/blob/master/soal2/soal2c.sh)

Penjelasan :
2. Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan.
a) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka.
