
.model tiny
.stack 100h
.data
	tekst db "Programowanie w asemblerze$"
	;Dlaczego na koncu zmiennej "tekst" jest znak dolara "$"?
	licznik db 5
	;Dlaczego wartosc zmiennej to 5 a nie "5" lub "5$"?
	komunikat1 db "Zmienna tekstowa to: $"
	komunikat2 db 13, 10, "Licznik to: $"
	;Dlaczego na poczatku wartosci zmiennej sa liczby 13 i 10?
	;Sprawdz w Internecie co to sa kody CR (Carriage Return) i LF (Line feed)
	komunikat3 db 0Dh, 0Ah, "Znak numer $"
	;Dlaczego na poczatku wartosci zmiennej sa liczby 0Dh i 0Ah?
	komunikat4 db " to: $"
	
.code
START:
	;wyswietlenie komunikatu1
	mov bx, seg komunikat1
	mov ds, bx
	mov dx, offset komunikat1
	mov ah, 9
	int 21h

	;wyswietlenie zmiennej "tekst"
	mov bx, seg tekst
	mov ds, bx
	mov dx, offset tekst
	mov ah, 9
	int 21h

	;wyswietlenie komunikatu2
	mov bx, seg komunikat2
	mov ds, bx
	mov dx, offset komunikat2
	mov ah, 9
	int 21h

	;wyswietlenie zmiennej "licznik"
	mov bx, seg licznik
	mov ds, bx
	mov bx, offset licznik
	mov dl, ds:[bx]
	add dl, 48
	mov ah, 2
	int 21h

	;wyswietlenie komunikatu3
	mov bx, seg komunikat3
	mov ds, bx
	mov dx, offset komunikat3
	mov ah, 9
	int 21h
	;wyswietlenie zmiennej "licznik"
	mov bx, seg licznik
	mov ds, bx
	mov bx, offset licznik
	mov dl, ds:[bx]
	add dl, 48
	mov ah, 2
	int 21h

	;wyswietlenie komunikatu4
	mov bx, seg komunikat4
	mov ds, bx
	mov dx, offset komunikat4
	mov ah, 9
	int 21h

	;wyswietlenie ze zmiennej "tekst" znaku o indeksie "licznik"
	mov dx, offset tekst
	mov bx, 0
	mov bl, licznik
	add dx, bx
	mov bx, dx

	mov dl, ds:[bx]
	;Na jaka komorke pamieci wskazuje adres DS:[BX]?
	mov ah, 2
	int 21h

	;koniec programu
	mov ah, 4ch
	int 21h
END START
end