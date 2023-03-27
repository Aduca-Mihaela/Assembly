;9. Se da un sir de dublucuvinte in segmentul de date. Sa se genereze sirul D 
;care sa contina toti octetii superiori ai word-urilor superioare care au ultima 
;cifra egala cu 5. Sa se afiseze sirul D (in baza 10) pe ecran. 
;In cazul in care nu exista niciun octet corespunzator, 
;sa se afiseze mesajul "Nu exista".
;s= 15AB3424h 25FERGHTh
; d = 15h, 25 h

assume cs:code, ds:data
data segment

s dd  15AB3424h, 251A2B3Ch, 1A2B3C4Dh
lens equ ($-s)/4
d db lens dup (0)
zece dw 10
cinci db 5
minus dw -1
numar dw ?

data ends

code segment
start:
  mov ax,data
  mov ds,ax

  mov si, 3
  mov di, 2
	repeta:
		mov al, byte ptr s[si]
		mov bl, al
		cbw
		idiv cinci
		cmp ah, 0
		je adauga
		jne repeta
			adauga:
			mov al, bl
			mov byte ptr d[di], al
			add si, 3
			inc di
				

mov si, 0
mov cx, 0
prelucrare:
	mov al, byte ptr d[si]
	;sub al, '0'
	mov ah, 0
	idiv zece
	push dx
	add cx, 1
	cmp al, 0
	je printeaza
	jne prelucrare
		printeaza:
			pop dx
			add dl, '0'
			mov ah, 02h
			int 21h
		loop printeaza



mov ax,4c00h
int 21h
code ends
end start




