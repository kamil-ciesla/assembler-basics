
; Program displaying text, counter,
; and character in text of 'counter' index.

.model tiny
.stack 100h
.data
	text db "Programming in assembler", '$'
	counter db 5
	msg1 db "Text variable: ", '$'
	msg2 db 13, 10, "counter: ", '$'
	msg3 db 0Dh, 0Ah, "character number ", '$'
	; "0Dh, 0Ah" is the same as "13, 10"
	msg4 db ": ", '$'
	
.code
START:
	;display msg1
	mov bx, seg msg1
	mov ds, bx
	mov dx, offset msg1

	mov ah, 9
	int 21h
	; display text
	mov bx, seg text
	mov ds, bx
	mov dx, offset text

	mov ah, 9
	int 21h
	; display msg2
	mov bx, seg msg2
	mov ds, bx
	mov dx, offset msg2

	mov ah, 9
	int 21h
	; display variable 'counter'
	mov bx, seg counter
	mov ds, bx
	mov bx, offset counter
	mov dl, ds:[bx]
	add dl, 48

	mov ah, 2
	int 21h
	; display msg3
	mov bx, seg msg3
	mov ds, bx
	mov dx, offset msg3
	
	mov ah, 9
	int 21h
	; display variable 'counter'
	mov bx, seg counter
	mov ds, bx
	mov bx, offset counter
	mov dl, ds:[bx]
	add dl, 48

	mov ah, 2
	int 21h
	; display msg4
	mov bx, seg msg4
	mov ds, bx
	mov dx, offset msg4

	mov ah, 9
	int 21h
	; display character that is in text variable, of 'counter' index.
	mov dx, offset text
	mov bx, 0
	mov bl, counter
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