assume cs:code, ds:data

data segment
s db 35, ?, 35 dup(?)
ls dw ?
d db 35 dup(?)
simbol db '%'
newline db 10, 13, '$'


data ends

code segment
start:
mov ax, data
mov ds, ax

mov ah, 0ah
mov dx, offset s
int 21h

mov ah, 09h
mov dx, offset newline
int 21h

mov bl, byte ptr s[1]
mov bh, 0
mov ls, bx
add ls, 2
mov cx, ls
mov si, 2
mov di, 1
repeta:
	mov bl, byte ptr s[si]
	;sub bl, '0'
	
	mov al, bl
	cmp al, '0'
	jae compara9
	jb next
		compara9:
			cmp al, '9'
			 jbe modifica
			 ja next
				modifica:
					mov bl, simbol
					mov byte ptr d[di], bl
					inc di
					inc si
				jmp myendif
				next:
					mov byte ptr d[di], al
					inc si
					inc di
				myendif:
loop repeta



mov al, '$'		 
mov byte ptr d[di], al
inc di
mov ah, 09h
mov dx, offset d
int 21h


mov ax, 4c00h
int 21h

code ends
end start