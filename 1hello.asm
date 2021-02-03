
; Program displaying message "Hello World" and the first character of message.

.model tiny
.stack 100h
.data
    msg db 'Hello world', 13, 10, '$'
    ; 13 - carriage return
    ; 10 - new line/line feed
    ; '$' - end of string 
.code
START:
    ; display message
    mov bx, seg msg
    mov ds, bx
    mov dx, offset msg

    mov ah, 9
    int 21h
    ; display first character of message 
    mov bx, offset msg
    mov dl, ds:[bx]
    
    mov ah, 2
    int 21h
    ; call function ending program
    mov ah, 4ch
    int 21h
END START
end
