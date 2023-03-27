;4. Sa se citeasca de la tastatura un sir de caractere si
; sa se afiseze pe ecran cate litere contine.
;Exemplu:
;S: "Ana are mere si pere."
;rezultat: 16

assume cs:code, ds:data
data segment
	
	sircitit db 27, ? , 27 dup (?)   
	ls equ $-sircitit-2               
	lit db ls dup (?)                 
	newline db 10, 13, '$'
        contor db 0                   

data ends
code segment
start:
	mov ax,data
	mov ds,ax
	; citire sir de la tastatura
	
	mov ah,0ah
	mov dx, offset sircitit       
	int 21h
	
	; afisarea sirului citit

	mov si, ls                  
	mov sircitit[si], '$'       
	
	mov ah, 09h
	mov dx, offset sircitit      
	int 21h

	; treci pe linie noua
	
	mov ah, 09h
	mov dx, offset newline
	int 21h

	; prelucrarea sirului
	mov si, 2                
	mov cx, ls               
	mov di, 0                
	repeta:
		mov al, sircitit[si]                     
		cmp al, 'a'                              
		JAE verifica                            
		JB nuelitera                             
			verifica:
				cmp al, 'z'             
				JA nuelitera             
				JBE elitera              
					elitera:                
						inc si                 
						add contor, 1
			jmp end_repeta  
			nuelitera:
				inc si    
		end_repeta:
	loop repeta
	
	;afisare contor

	mov al, contor   
	add al, '0'      
	mov ah, 02h      
	mov dl, al       
	int 21h

        
	
		 	
mov ax, 4c00h
int 21h
code ends
end start