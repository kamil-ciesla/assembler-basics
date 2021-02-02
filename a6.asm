.model tiny
.stack 256
.data
    time db 13, 10, "xx:xx:xx",'$'
.code
START:
    ; HOUR --------------------------
    ; get numbers into ax
    mov ax, 0
    mov al, 4
    out 70h, al
    in al, 71h
    ; swtich registers to ds:dx of time
    mov bx, seg time
    mov ds, bx
    mov bx, offset time
    ; turn bcd digits into decimal in two parts in dl and al.
    mov dx, 0
    mov dx, ax
    shr dx, 4
    and al, 0fh
    ; turn decimal digits into ascii data
    add dx, 48
    add ax, 48
    ; adding digits into time
    add bx, 2
    mov ds:[bx], dl
    add bx, 1
    mov ds:[bx], al
    ; MINUTES ------------------------
    ; get numbers into ax
    mov ax, 0
    mov al, 2
    out 70h, al
    in al, 71h
    ; swtich registers to ds:dx of time
    mov bx, seg time
    mov ds, bx
    mov bx, offset time
    ; turn bcd digits into decimal in two parts in dl and al.
    mov dx, 0
    mov dx, ax
    shr dx, 4
    and al, 0fh
    ; turn decimal digits into ascii data
    add dx, 48
    add ax, 48
     ; adding digits into time
    add bx, 5
    mov ds:[bx], dl
    add bx, 1
    mov ds:[bx], al
    ; SECONDS --------------------------
    ;get numbers into ax
    mov ax, 0
    mov al, 0
    out 70h, al
    in al, 71h
    ; swtich registers to ds:dx of time
    mov bx, seg time
    mov ds, bx
    mov bx, offset time
    ; turn bcd digits into decimal in two parts in dl and al.
    mov dx, 0
    mov dx, ax
    shr dx, 4
    and al, 0fh
    ; turn decimal digits into ascii data
    add dx, 48
    add ax, 48
     ; adding digits into time
    add bx, 8
    mov ds:[bx], dl
    add bx, 1
    mov ds:[bx], al
    ; display time
    mov bx, seg time
    mov ds, bx
    mov dx, offset time
    mov ah, 9
    int 21h
    ; end program
    mov ah, 4ch
    int 21h
END START
end