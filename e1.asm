;Se sa citeasca un sir de cifre a. 
;Sa se salveze in sirul b doar cifrele pare.
;Sa se afiseze sirul b pe ecran.

assume cs:code,ds:data
data segment
 
s db 10, ?, 10 dup(?)
d db 10 dup(?)
ls dw ?
sep db ' '
newline db 10, 13, '$'
doi db 2
aux db 0



data ends

code segment
start:
mov ax, data
mov ds, ax

mov ah, 0ah
mov dx, offset s
int 21h

mov bl, byte ptr s[1]
mov bh, 0
mov ls, bx
add ls, 2
mov cx, ls
mov si, 2
mov di, 0

repeta:
	mov bl, byte ptr s[si]
	sub bl, '0'
	mov bh, 0
	mov aux, bl
	mov ax, bx
	idiv doi; al=cat/ah=rest
	;inc si
	;mov aux, al
	mov al, ah
	cmp al, 0
	je adauga
	jne next
		adauga:
			mov al, aux
			mov byte ptr d[di], al
			inc di
			;inc si
	
		next:
			inc si
loop repeta

mov cx, di
mov si, 0
 afisare_sir:
	mov dl, byte ptr d[si]
	add dl, '0'
	mov ah, 02h
	int 21h

	mov dl, ' '
	mov ah, 02h
	int 21h
	inc si
	
	
loop afisare_sir
	
	

	

	
mov ax,4c00h
int 21h
code ends
end start