.model tiny
.stack 256
.data
    ;kod ASCIZ, dlateog '0' na końcu
    nazwa db "ABCD", 0
.code
START:
    mov bx, seg nazwa
    mov ds, bx
    mov dx, offset nazwa
    mov ah, 39h
    int 21h
    ;zakończ program
    mov ah, 4ch
    int 21h
END START
end
