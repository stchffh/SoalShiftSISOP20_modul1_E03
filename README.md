# SoalShiftSISOP20_modul1_E03
Praktikum Sistem Operasi Modul 1
Kelompok E3
- Sitti Chofifah                  05111840000039
- Oktarizka Asviananda Nursanty   05111840000156

### Soal Nomor 1
+ [soal1a.sh](https://github.com/stchffh/SoalShiftSISOP20_modul1_E03/blob/master/soal1/soal1a.sh)
+ [soal1b.sh](https://github.com/stchffh/SoalShiftSISOP20_modul1_E03/blob/master/soal1/soal1b.sh)
+ [soal1c.sh](https://github.com/stchffh/SoalShiftSISOP20_modul1_E03/blob/master/soal1/soal1c.sh)

### Penjelasan :
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
Region dengan profit paling sedikit adalah:
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
Dua state dengan profit paling kecil berdasarkan poin a adalah:
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
Sepuluh produk yang memiliki profit paling sedikit berdasarkan poin b adalah:
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
### Soal Nomor 2
+ [soal2a.sh](https://github.com/stchffh/SoalShiftSISOP20_modul1_E03/blob/master/soal2/soal2a.sh)
+ [soal2b.sh](https://github.com/stchffh/SoalShiftSISOP20_modul1_E03/blob/master/soal2/soal2b.sh)
+ [soal2c.sh](https://github.com/stchffh/SoalShiftSISOP20_modul1_E03/blob/master/soal2/soal2c.sh)

### Penjelasan :
2. Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan.

a) Membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi.txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet.
```
#!/bin/bash

filename=$1
        if [ $# -eq 2 ]; 
        then length=$2
        else length=29
        fi
digits=({0..9})
lower=({a..z})
upper=({A..Z})
CharArray=(${digits[*]} ${lower[*]} ${upper[*]})
ArrayLength=${#CharArray[*]}

if [[ $1 =~ ^[a-zA-Z]+$ ]]
then
for i in `seq 2 $length`
do
        index=$(($RANDOM%$ArrayLength))
        char=${CharArray[$index]}
        password=${password}${char}
done 
echo $password >> /home/opi/$1.txt
else 
echo "error"
fi
```
- `filename=$1` digunakan untuk mendeklarasikan variabel file name yang berisi nilai pada kolom satu
- untuk membatasi panjang password :
```
if [ $# -eq 2 ]; 
        then length=$2
        else length=29
        fi` jika
``` 

- `if [[ $1 =~ ^[a-zA-Z]+$ ]]` kondisi untuk nama file yang diinputkan hanya bisa berupa huruf
- string untuk menampung angka dan alphabet :
```
digits=({0..9})
lower=({a..z})
upper=({A..Z})
```
- 

b) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b.)
```
#!/bin/bash

key=$(date +"%H")
filename=$1
file="${filename%.*}"

low=abcdefghijklmnopqrstuvwxyz
low=$low$low
upper=ABCDEFGHIJKLMNOPQRSTUVWXYZ
upper=$upper$upper

updatefile=`printf "$file"  | tr [${low:26}${upper:26}] [${low:$key:26}${upper:$key:26}]`

mv $file.txt $updatefile.txt
```
- `key=$(date +"%H")` variabel untuk menyimpan tanggal dan jam
- untuk memberikan nama file yang ingin disimpan
```
filename=$1
file="${filename%.*}"
```
- string untuk menampung karakter dan mengubah menjadi karakter baru saat enkripsi
```
low=abcdefghijklmnopqrstuvwxyz
low=$low$low
upper=ABCDEFGHIJKLMNOPQRSTUVWXYZ
upper=$upper$upper
```
- proses merubah huruf yang urutannya disesuaikan dengan jam dan dijumlah dengan nilai urutan huruf yang akan diubah
```
updatefile=`printf "$file"  | tr [${low:26}${upper:26}] [${low:$key:26}${upper:$key:26}]`
```
- `mv $file.txt $updatefile.txt` untuk memindahkan file dengan nama awal yang sudah diinput sebelumnya menjadi nama file yang sudah terenkripsi 

c) Untuk membuat dekripsinya supaya nama file bisa kembali.
```
#!/bin/bash

key=$(date +"%H")
filename=$1
file="${filename%.*}"


low=abcdefghijklmnopqrstuvwxyz
low=$low$low
upper=ABCDEFGHIJKLMNOPQRSTUVWXYZ
upper=$upper$upper

updatefile=`printf "$file"  | tr [${low:$key:26}${upper:$key:26}] [${low:26}${upper:26}]`

mv $file.txt $updatefile.txt
```
- proses perubahan huruf di file encrypt yang akan diubah menjadi normal 
```
`updatefile=`printf "$file"  | tr [${low:$key:26}${upper:$key:26}] [${low:26}${upper:26}]` 
```

### Soal Nomor 3
+ [soal3a.sh](https://github.com/stchffh/SoalShiftSISOP20_modul1_E03/blob/master/soal3/soal3a.sh)
+ [soal3b.sh](https://github.com/stchffh/SoalShiftSISOP20_modul1_E03/blob/master/soal3/soal3b.txt)
+ [soal3c.sh](https://github.com/stchffh/SoalShiftSISOP20_modul1_E03/blob/master/soal3/soal3a.sh)

### Penjelasan
3) 

a) Membuat script untuk mendownload 28 gambar dari
"https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file "wget.log". 
```
#!/bin/bash

for((i=1;i<29;i++))
do
wget -O pdkt_kusuma_$i https://loremflickr.com/320/240/cat --append-output wget.log >> wget.log
done
```
- proses diatas digunakan untuk mendownload gambar dengan menggunakan looping sebanyak 28 kali
- `wget -O pdkt_kusuma_$i` untuk memberi nama file 
- `--append-output wget.log >> wget.log` untuk menyimpan log message wget ke file wget.log

b) Script download gambar hanya
berjalan setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu
```
5 6-23/8 * * 1-5 opi/home/opi/soal3a.sh
```
Diberi crontab untuk setiap 8 jam dari jam 6.05 setiap hari kecuali hari Sabtu untuk scheduling download gambar.

c) Buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253). Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi
ekstensi ".log.bak".

```
