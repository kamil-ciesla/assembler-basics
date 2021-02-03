
; Program that sums up two one-digit numbers entered by user, and displays the sum.
; note 1: Program doesn't display msg4, only sum is displayed
; note 2: program works properly only if the sum is not greater than 9. 
; Otherwise, the sum isn't displayed correctly.

.model tiny
.stack 256
.data
    msg1 db 'Summing two one-digit numbers', '$'
    msg2 db 13, 10, 'Enter first number: ','$'
    msg3 db 13, 10, 'Enter second number: ','$'
    msg4 db 13, 10, 'Sum: ', '$'
    sum db 2, 0, "  $"

.code
START:
    ; display msg1
    mov bx, seg msg1
    mov ds, bx
    mov dx, offset msg1
    mov ah, 9
    int 21h
    ; display msg2
    mov bx, seg msg2
    mov ds, bx
    mov dx, offset msg2
    mov ah, 9
    int 21h
    ; ask for keyboard input
    mov bx, seg sum
    mov ds, bx
    mov dx, offset sum
    mov ah, 0Ah
    int 21h
    ; get number from input into cl
    mov bx, dx
    add bx, 2
    mov cl, ds:[bx]
    and cl, 0fh
    ; display msg3
    mov bx, seg msg3
    mov ds, bx
    mov dx, offset msg3
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
    ; display msg4
    mov bx, seg msg4
    mov ds, bx
    mov dx, offset msg4
    mov ah, 9
    int 21h
    ; display sum
    mov bx, seg sum
    mov ds, bx
    mov dx, offset sum
    add dx, 2
    mov ah, 9
    int 21h
    ; call function ending program
    mov ah, 4ch
    int 21h
END START
end