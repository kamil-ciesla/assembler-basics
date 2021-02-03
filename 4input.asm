
; Program asks user to enter text, and then displays the text,
; and a last character of text.

.model tiny
.stack 100h
.data
    bufor db 21, 0, "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx$"
    msg1 db "Enter text (max 20 characters): $"
    msg2 db 13, 10, "Your text: $"
    msg3 db 0Dh, 0Ah, "Last character: $"
.code
START:
    ; display msg1
    mov bx, seg msg1
    mov ds, bx
    mov dx, offset msg1
    
    mov ah, 9
    int 21h
    ; ask for input
    mov bx, seg bufor
    mov ds, bx
    mov dx, offset bufor

    mov ah, 0Ah
    int 21h
    ; display msg2
    mov bx, seg msg2
    mov ds, bx
    mov dx, offset msg2

    mov ah, 9
    int 21h
    ;display variable 'bufor'
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
    ; display msg3
    mov bx, seg msg3
    mov ds, bx
    mov dx, offset msg3

    mov ah, 9
    int 21h
    ; display last character of text
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
    ; call function ending program
    mov ah, 4ch
    int 21h
END START
end