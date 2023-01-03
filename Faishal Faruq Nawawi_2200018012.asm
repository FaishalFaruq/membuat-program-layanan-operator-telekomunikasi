.model small
.code
org 100h
start:
    jmp mulai
menu    db 13,10,'=============================================='
        db 13,10,'=               INFO OPERATOR                ='
        db 13,10,'=============================================='
        db 13,10,'=01 Cek Pulsa                                ='
        db 13,10,'=02 Internet 10Gb/30hr                       ='
        db 13,10,'=03 Internet 8Gb/30hr                        ='
        db 13,10,'=04 Internet 4Gb/30hr                        ='
        db 13,10,'=05 Cek Batas Akhir Sim Card                 ='
        db 13,10,'==============================================','$'

pilih_menu  db 13,10,'MASUKKAN KODE USSD : $'
success     db 13,10,'SILAHKAN CEK KEMBALI SMS ANDA $'
error       db 13,10,'KODE SALAH $'


mulai:
    mov ah,09h
    mov dx,offset menu
    int 21h
    jmp proses 
    jmp error_msg
error_msg:
    mov ah,09h
    mov dx,offset error
    int 21h
    int 20h
proses:
    mov ah,09h
    mov dx,offset pilih_menu
    int 21h

    mov ah,1
    int 21h
    mov bh,al
    mov ah,1
    int 21h
    mov bl,al
    cmp bh,'0'
    cmp bl,'1'
    je hasil1

    cmp bh,'0'
    cmp bl,'2'
    je hasil2

    cmp bh,'0'
    cmp bl,'3'
    je hasil3

    cmp bh,'0'
    cmp bl,'4'
    je hasil4

    cmp bh,'0'
    cmp bl,'5'
    je hasil5

    jne error_msg

hasil1:
    mov ah,09h
    mov dx,teks1
    int 21h
    int 20h

hasil2:
    mov ah,09h
    mov dx,teks2
    int 21h
    int 20h

hasil3:
    mov ah,09h
    mov dx,teks3
    int 21h
    int 20h

hasil4:
    mov ah,09h
    mov dx,teks4
    int 21h
    int 20h

hasil5:
    mov ah,09h
    mov dx,teks5
    int 21h
    int 20h


teks1:      db 13,10,''
            db 13,10,'=============================================='
            db 13,10,'=Sisa Pulsa Anda Rp.120.000.00 sd            ='
            db 13,10,'=03/03/2023                                  ='
            db 13,10,'============================================== $'

teks2:      db 13,10,''
            db 13,10,'=============================================='
            db 13,10,'=Internet 10Gb/30hr                          ='
            db 13,10,'=Dengan Harga Rp.100.000.00                  ='
            db 13,10,'============================================== $'

teks3:      db 13,10,''
            db 13,10,'=============================================='
            db 13,10,'=Internet 8Gb/30hr                           ='
            db 13,10,'=Dengan Harga Rp.80.000.00                   ='
            db 13,10,'============================================== $'

teks4:      db 13,10,''
            db 13,10,'=============================================='
            db 13,10,'=Internet 4Gb/30hr                           ='
            db 13,10,'=Dengan Harga Rp.40.000.00                   ='
            db 13,10,'============================================== $'

teks5:      db 13,10,''
            db 13,10,'=============================================='
            db 13,10,'=Batas Sim Card sd                           ='
	    db 13,10,'=22/03/2025                                  ='
	    db 13,10,'=						   ='
	    db 13,10,'=Silahkan Perpanjang Dengan Menambah Pulsa   ='
	    db 13,10,'=Atau Internet				   ='
            db 13,10,'============================================== $'

end start
