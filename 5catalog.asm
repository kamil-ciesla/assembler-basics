
; Program creating new catalog, which name is chosen by the user.

.model tiny
.stack 256
.data
    bufor db 9, 0, "xxxxxxxxxxx", 0
    msg1 db "Enter name of catalog: ", '$'
    msg2 db 13, 10, "Catalog ", '$'
    msg3 db " has been created.", '$'
.code
START:
    ; display msg1
    mov bx, seg msg1
    mov ds, bx
    mov dx, offset msg1
    mov ah, 9
    int 21h
    ; ask user for input
    mov bx, seg bufor
    mov ds, bx
    mov dx, offset bufor

    mov ah, 0Ah
    int 21h

    mov bx, seg bufor
    mov ds, bx

    mov dx, offset bufor
    mov bx, dx

    add bx, 1
    mov cx, ds:[bx]
    sub bx, 1
    mov ch, 0

    add bx, cx
    add bx, 2
    add dx, 2
    mov ds:[bx], 0

    mov ah, 39h
    int 21h

    ;display msg2
    mov bx, seg msg2
    mov ds, bx
    mov dx, offset msg2
    mov ah, 9
    int 21h

    mov bx, seg bufor
    mov ds, bx
    mov dx, offset bufor
    mov bx, dx

    add bx, 1
    mov cx, ds:[bx]
    sub bx, 1
    mov ch, 0

    add bx, cx
    add bx, 2
    add dx, 2
    mov ds:[bx], 36

    mov ah, 9
    int 21h
    ;display msg3
    mov bx, seg msg3
    mov ds, bx
    mov dx, offset msg3
    
    mov ah, 9
    int 21h
    ; call function ending program
    mov ah, 4ch
    int 21h
END START
end
    