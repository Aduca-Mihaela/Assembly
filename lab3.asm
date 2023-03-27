assume ds:data,cs:code
data segment
     s1 db 1 , 2, 3, 4    ;sirul initial
     s2 db 5, 6, 7
     ls1 equ $-s1
     ls2 equ $-s2	
     D db ls1+ls2 dup(?)	
data ends
code segment
start:
     mov ax,data
     mov ds,ax
     mov si, 0
     mov di, 0
     mov bp, 0
     cld
     repeta:
        mov al , byte ptr s1[si]
        mov byte ptr D[di], al
        add si, 1
        add di, 1
     loop repeta
     std
     repeta2:
	mov al, byte ptr s2[bp]
	mov byte ptr D[di], al
	add bp, 1
	add di, 1
     loop repeta2


     mov ax,4C00h
     int 21h
code ends
end start
