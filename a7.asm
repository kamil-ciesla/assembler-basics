.model tiny
.stack 256
.data
    kom1 db 'Sumowanie liczb jednocyfrowych', '$'
    kom2 db 13, 10, 'Podaj pierwsza liczbe: ','$'
    kom3 db 13, 10, 'Podaj druga liczbe: ','$'
    kom4 db 13, 10, 'Suma to: ', '$'
    sum db 2, 0, "  $"

.code
START:
    ; display kom1
    mov bx, seg kom1
    mov ds, bx
    mov dx, offset kom1
    mov ah, 9
    int 21h
    ; display kom2
    mov bx, seg kom2
    mov ds, bx
    mov dx, offset kom2
    mov ah, 9
    int 21h
    ; ask for keyboard input
    mov bx, seg sum
    mov ds, bx
    mov dx, offset sum
    mov ah, 0Ah
    int 21h
    ; get number from input cl
    mov bx, dx
    add bx, 2
    mov cl, ds:[bx]
    and cl, 0fh
    ; display kom3
    mov bx, seg kom3
    mov ds, bx
    mov dx, offset kom3
    mov ah, 9
    int 21h
    ; ask for keyboard input
    mov bx, seg sum
    mov ds, bx
    mov dx, offset sum
    mov ah, 0Ah
    int 21h
    ; get number from input into al
    mov bx, dx
    add bx, 2
    mov al, ds:[bx]
    and al, 0fh
    ; sum up two numbers (cl and al)
    add cl, al
    ; convert summed numbers into ascii
    add cl, 48
    ; move summed numbers into sum
    mov ds:[bx], cl
    ; display kom4
    mov bx, seg kom4
    mov ds, bx
    mov dx, offset kom4
    mov ah, 9
    int 21h
    ; display sum
    mov bx, seg sum
    mov ds, bx
    mov dx, offset sum
    add dx, 2
    mov ah, 9
    int 21h
    ; end program
    mov ah, 4ch
    int 21h
END START
end