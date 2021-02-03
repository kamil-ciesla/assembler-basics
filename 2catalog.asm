
; Program creating a new catalog named "ABCD".

.model tiny
.stack 256
.data
    file_name db "ABCD", 0
    ; 0 - signals end of catalog name, (asciz code)
.code
START:
    mov bx, seg file_name
    mov ds, bx
    mov dx, offset file_name

    mov ah, 39h
    int 21h
    ; call function ending program
    mov ah, 4ch
    int 21h
END START
end
