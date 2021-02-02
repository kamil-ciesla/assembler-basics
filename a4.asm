.model tiny
.stack 100h
.data
    bufor db 21, 0, "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx$"
    komunikat1 db "Wprowadz tekst (max 20 znakow): $"
    komunikat2 db 13, 10, "Twoj tekst to: $"
    komunikat3 db 0Dh, 0Ah, "Ostatni znak to: $"
.code
START:
    ;wyświetl komunikatu1
    mov bx, seg komunikat1
    mov ds, bx
    mov dx, offset komunikat1
    mov ah, 9
    int 21h

    ;wprowadzenie tekstu z klawiatury
    mov bx, seg bufor
    mov ds, bx
    mov dx, offset bufor
    mov ah, 0Ah
    int 21h

    ;wyświetlenie komunikatu2
    mov bx, seg komunikat2
    mov ds, bx
    mov dx, offset komunikat2
    mov ah, 9
    int 21h

    ;wyświetlenie zmiennej bufor
    ;przejdź do segmentu danych bufor
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
    mov bx, seg komunikat3
    mov ds, bx
    mov dx, offset komunikat3
    mov ah, 9
    int 21h

    ;wyświetl ostatni znak tekstu
    mov bx, seg bufor
    mov ds, bx
    mov bx, 0
    add bx, cx
    add bx, 1
    mov dx, offset bufor
    add dx, bx
    mov bx, dx

    mov dl, ds:[bx]
    mov ah, 2
    int 21h

    ; zakończ program
    mov ah, 4ch
    int 21h
END START
end