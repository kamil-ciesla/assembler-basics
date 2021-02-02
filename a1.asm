.model tiny
.stack 100h
.data
    komunikat db 'Dzien dobry', 13, 10, '$'
.code
START:
    ;WYŚWIETL KOMUNIKAT
    mov bx, seg komunikat
    mov ds, bx
    mov dx, offset komunikat
    mov ah, 9
    int 21h
    ;POKAŻ PIERWSZY ZNAK KOMUNIKATU
    ;mov dx, offset komunikat
    ;mov bx, dx
    mov bx, offset komunikat
    mov dl, ds:[bx]
    mov ah, 2
    int 21h
    ;ZAKOŃCZ PROGRAM
    mov ah, 4ch
    int 21h
END START
end
