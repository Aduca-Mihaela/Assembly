assume ds:data,cs:code
data segment
     	s dd 1, 2, 3
	ls equ ($-s)/4
	d dw ls*2 dup(?)
data ends
code segment
start:
     mov ax,data
     mov ds,ax
     mov si, ls*4-4
     mov di, 0
     mov cx, ls
     repeta:
	mov ax, word ptr s[si]
	mov dx, word ptr s[si+2]
	mov word ptr d[di], ax
	mov word ptr d[di+2], dx
	sub si, 4
	add di, 4
     loop repeta
    	

     mov ax,4C00h
     int 21h
code ends
end start
