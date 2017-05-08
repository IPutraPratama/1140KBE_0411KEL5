
PREDICATES
nondeterm menu
nondeterm budget1(integer,integer,string,symbol)
nondeterm budget2(integer,integer,string,symbol)
nondeterm budget3(integer,integer,string,symbol)
nondeterm pilihan(char)
nondeterm sport
nondeterm futsal
nondeterm joging
nondeterm kerja
nondeterm casual
nondeterm kantor
nondeterm lapangan
nondeterm kuliah
nondeterm jalan
nondeterm pilih(char)
nondeterm pilihin(char)
nondeterm pilihin1(char)
nondeterm pilihin2(char)
nondeterm pilihin3(char)
nondeterm pilihin4(char)
nondeterm pilihin5(char)
nondeterm pilihkan(char)
nondeterm pilihaja(char)
nondeterm cariSport(integer,integer)
nondeterm cariKerja(integer,integer)
nondeterm cariCasual(integer,integer)

CLAUSES
budget1(1,30000,nike2,futsal).
budget1(1,40000,adidas,futsal).
budget1(1,50000,nike,futsal).
 
budget1(2,75000,specs1,joging).
budget1(2,95000,specs2,joging).

%cari yang terdekat


cariSport(P,X):-
P=1,budget1(1,_,_,futsal),X<30000,write("dana anda tidak mencukupi");
P=1,budget1(1,V,B,futsal),X-5000<=V,write(B);
P=1,budget1(1,_,_,futsal),X>50000,write("nike");
P=2,budget1(2,_,_,joging),X<75000,write("dana anda tidak mencukupi");
P=2,budget1(2,Z,B,joging),X-10000<=Z,write(B);
P=2,budget1(2,_,_,joging),X>100000,write("specs2")
.


budget2(1,50000,crocodile,kantor).
budget2(1,63000,jaguar,kantor).
budget2(2,87000,hommypad,lapangan).
budget2(2,45000,safety,lapangan).

cariKerja(P,X):-
P=1,budget2(1,_,_,kantor),X<50000,write("dana anda tidak mencukupi");
P=1,budget2(1,Z,B,kantor),X-6000<=Z,write(B);
P=1,budget2(1,_,_,kantor),X>65000,write("jaguar");
P=2,budget2(2,_,_,lapangan),X<45000,write("dana anda tidak mencukupi");
P=2,budget2(2,V,B,lapangan),X-21000<=V,write(B);
P=2,budget2(2,_,_,lapangan),X>87000,write("jaguar").



budget3(1,30000,wachout,kuliah).
budget3(1,89000,yezzy,kuliah).
budget3(2,77000,vans,jalan).
budget3(2,450000,circa,jalan).

cariCasual(P,X):-
P=1,budget3(1,_,_,kuliah),X<30000,write("dana anda tidak mencukupi");
P=1,budget3(1,Z,B,kuliah),X-29000<=Z,write(B);
P=1,budget3(1,_,_,kuliah),X>89000,write("yezzy");
P=2,budget3(2,_,_,jalan),X<77000,write("dana anda tidak mencukupi");
P=2,budget3(2,V,B,jalan),X-5000<=V,write(B);
P=2,budget3(2,_,_,kuliah),X>450000,write("circa").

menu:-
write("		==================================================================="),nl,
write("		Sistem Pendukung Keputusan Pemilihan Sepatu Laki-Laki Berdasarkan Kebutuhan"),nl,
write("		==================================================================="),nl,nl,
write("pilih sepatu yang anda anda butuhkan\n"),%kebutuhan(X),
write("1.Sepatu Sport\n"),nl,
write("2.Sepatu Kerja\n"),nl,
write("3.Sepatu Casual\n"),nl,
write("Pilihan :"),
readchar(X),pilihan(X).

pilihan(X):- X='1',sport.
pilihan(X):- X='2',kerja.
pilihan(X):- X='3',casual.
pilihan(_):-menu.


sport:-
write("\n-------------------------------------------------------\n"),nl,
write("Sepatu Sport apa yang anda butuhkan\n"),nl,
write("1.Untuk Bermain Futsal\n"),nl,
write("2.Untuk Joging\n"),nl,
write("Pilih : "),

readchar(C),pilih(C).

pilih(C):- C='1',futsal.
pilih(C):- C='2',joging.
pilih(_):-sport.


futsal:-
write("\n-------------------------------------------------------\n"),nl,
write("Masukan berapa harga sepatu yang anda inginkan?"),nl,readInt(X),nl,cariSport(1,X),nl,nl,
write("Apakah anda ingin memilih sepatu lagi ?\n"),nl,
write("1.kembali ke menu awal\n"),nl,
write("2.kembali ke sepatu sport\n"),nl,
write("Pilih : "),
readchar(C),pilihin(C).

pilihin(C):- C='1',menu.
pilihin(C):- C='2',sport.
pilihin(_):-futsal.

joging:-
write("\n-------------------------------------------------------\n"),nl,
write("Masukan berapa harga sepatu yang anda inginkan?"),nl,readInt(X),nl,cariSport(2,X),nl,nl,
write("Apakah anda ingin memilih sepatu lagi ?\n"),nl,
write("1.kembali ke menu awal\n"),nl,
write("2.kembali ke sepatu sport\n"),nl,
write("Pilih : "),
readchar(C),pilihin1(C).

pilihin1(C):- C='1',menu.
pilihin1(C):- C='2',sport.
pilihin1(_):-joging.

kerja:-
%write("buat kerja coy"),menu.
write("\n-------------------------------------------------------\n"),nl,
write("Sepatu Kerja apa yang anda butuhkan\n"),nl,
write("1.Untuk di dalam Kantor\n"),nl,
write("2.Untuk di Lapangan\n"),nl,
write("Pilih : "),

readchar(K),pilihkan(K).

pilihkan(K):- K='1',kantor.
pilihkan(K):- K='2',lapangan.
pilihkan(_):-kerja.
		
kantor:-
write("\n-------------------------------------------------------\n"),nl,
write("Masukan berapa harga sepatu yang anda inginkan ="),readInt(X),cariKerja(1,X),nl,nl,
write("Apakah anda ingin memilih sepatu lagi ?\n"),nl,
write("1.kembali ke menu awal\n"),nl,
write("2.kembali ke sepatu kantor\n"),nl,
write("Pilih : "),
readchar(C),pilihin2(C).

pilihin2(C):- C='1',menu.
pilihin2(C):- C='2',kerja.
pilihin2(_):-kantor.

lapangan:-
write("\n-------------------------------------------------------\n"),nl,
write("Masukan berapa harga sepatu yang anda inginkan ="),readInt(X),cariKerja(2,X),nl,nl,
write("Apakah anda ingin memilih sepatu lagi ?\n"),nl,
write("1.kembali ke menu awal\n"),nl,
write("2.kembali ke sepatu kantor\n"),nl,
write("Pilih : "),
readchar(C),pilihin3(C).

pilihin3(C):- C='1',menu.
pilihin3(C):- C='2',kerja.
pilihin3(_):-lapangan.



casual:-
%write("buat cari cewek coy"),menu.
write("\n-------------------------------------------------------\n"),nl,
write("Sepatu Casual apa yang anda butuhkan\n"),nl,
write("1.Untuk Kuliah\n"),nl,
write("2.Untuk sepatu jalan\n"),nl,
write("Pilih : "),

readchar(O),pilihaja(O).

pilihaja(O):- O='1',kuliah.
pilihaja(O):- O='2',jalan.
pilihaja(_):-casual.

kuliah:-
write("\n-------------------------------------------------------\n"),nl,
write("Masukan berapa harga sepatu yang anda inginkan ="),readInt(X),cariCasual(1,X),nl,nl,
write("Apakah anda ingin memilih sepatu lagi ?\n"),nl,
write("1.kembali ke menu awal\n"),nl,
write("2.kembali ke sepatu casual\n"),nl,
write("Pilih : "),
readchar(C),pilihin4(C).

pilihin4(C):- C='1',menu.
pilihin4(C):- C='2',casual.
pilihin4(_):-kuliah.

jalan:-
write("\n-------------------------------------------------------\n"),nl,
write("Masukan berapa harga sepatu yang anda inginkan ="),readInt(X),cariCasual(2,X),nl,nl,
write("Apakah anda ingin memilih sepatu lagi ?\n"),nl,
write("1.kembali ke menu awal\n"),nl,
write("2.kembali ke sepatu casual\n"),nl,
write("Pilih : "),
readchar(C),pilihin5(C).

pilihin5(C):- C='1',menu.
pilihin5(C):- C='2',casual.
pilihin5(_):-jalan.


GOAL
menu.