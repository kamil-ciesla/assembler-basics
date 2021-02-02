.model tiny
.stack 256
.data
    bufor db 9, 0, "xxxxxxxxxxx", 0
    komunikat1 db "Podaj nazwe katalogu: ", '$'
    kom2 db 13, 10, "Katalog ", '$'
    kom3 db " zostal utworzony", '$'
.code
START:
     ;WYŚWIETL KOMUNIKAT
    mov bx, seg komunikat1
    mov ds, bx
    mov dx, offset komunikat1
    mov ah, 9
    int 21h
    ;wprowadź tekst
    ;wprowadzenie tekstu z klawiatury
    mov bx, seg bufor
    mov ds, bx
    mov dx, offset bufor
    mov ah, 0Ah
    int 21h
    ; ----------
    mov bx, seg bufor
    mov ds, bx
    ; zmien dx i bx na offset bufor
    mov dx, offset bufor
    mov bx, dx
    ;
    add bx, 1
    mov cx, ds:[bx]
    sub bx, 1
    mov ch, 0

    add bx, cx
    add bx, 2
    add dx, 2
    ;
    mov ds:[bx], 0
    mov ah, 39h
    int 21h

    ;wyswietl komunikat2
    mov bx, seg kom2
    mov ds, bx
    mov dx, offset kom2
    mov ah, 9
    int 21h
    ;
    mov bx, seg bufor
    mov ds, bx
    ; zmien dx i bx na offset bufor
    mov dx, offset bufor
    mov bx, dx
    ;
    add bx, 1
    mov cx, ds:[bx]
    sub bx, 1
    mov ch, 0

    add bx, cx
    add bx, 2
    add dx, 2
    ;
    mov ds:[bx], 36
    mov ah, 9
    int 21h

    ;wyswietl komunikat3
    mov bx, seg kom3
    mov ds, bx
    mov dx, offset kom3
    mov ah, 9
    int 21h

    ;zakończ program
    mov ah, 4ch
    int 21h

END START
end
    