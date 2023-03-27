;7. Se da un sir de octeti S in segmentul de date. Sa se afiseze pe ecran diferenta lor.
;Exemplu:
;S: 12, 3, 4, 6
;rezultat: -1

assume cs:code, ds:data

data segment

     sir db 12,3,4,6
     lens equ $-sir
     rezultat db ?
     zece dw 10
     minusunu dw -1
     numar dw ?

data ends

code segment

afisare_numar proc
      mov cx,0
      cmp ax,0
      jl negativ
      jge cifre

negativ:
      mov numar,ax
      mov dl,'-'
      mov ah,02h
      int 21h
      mov ax,numar
      imul minusunu

cifre:
     mov dx,0
     div zece
     push dx
     inc cx
     cmp ax,0
     jne cifre

afisare:
     pop dx
     add al,'0'
     mov ah,02h
     int 21h

   loop afisare

ret
afisare_numar endp

start:
   mov ax,data
   mov ds,ax
   mov si,0

construieste_sir:
     mov al,sir[si]
     sub al,sir[si+1]
     mov rezultat,al
     inc si
 loop construieste_sir
mov si,0
afisare_sir:

mov al,rezultat
call afisare_numar

loop afisare_sir



mov ax,4C00h
int 21h
code ends
end start

