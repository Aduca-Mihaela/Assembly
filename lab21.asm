lab 2
;2. Se dau doua cuvinte A si B. Sa se obtina cuvântul C:

;- bitii 0-2 si bitul 10 ai lui C au valoarea 0
;- bitii 3-6 ai lui C coincid cu bitii 5-8 ai lui A
;- bitii 7-9 ai lui C coincid cu bitii 0-2 ai lui B
;- bitii 11-15 ai lui C coincid cu bitii 5-9 ai lui B

;a : 0000.1010.1111.1100
;b : 1110 0001 0101 1100

;c : 01010 :b(5-9) / 0 / 100 :b(0-2) / 0111: a(5-8) / 000
   

assume cs:code, ds:data
data segment
  a dw 0000101011111100b
  b dw 1110000101011100b
  c dw ?
data ends

code segment
start:
  mov ax, data 
  mov ds, ax

mov bx, 0; in cx se va calcula rezultatul
mov ax, a; ax=0000101/0111/11100b/ punem in ax valoarea lui a
shl ax, 7; ax=0111/111000000000b deplaseaza spre stanga toti bitii cu
				; 7 pozitii, si completeaza cu 0 poz ramase
shr ax, 12; ax = 000000000000/0111b deplaseaza spre dreapta toti bitii cu 12 poz
		;si pune 0 in rest
rol ax, 3; ax =000000000/0111/000b; rotim la stanga cu 3 pozitii
or bx, ax; cx=000000000/0111/000b punem in cx, bitii 5-8 ai lui a pe pozitiile 3-6
mov ax, b; ax=111000/01010/11/100/b; punem in ax valoarea lui b
shl ax, 6; ax=/01010/11/100/000000b deplaseaza spre stanga toti bitii cu
			; 6 pozitii, si completeaza cu 0 poz ramase
rol ax, 1; ax=1010/11/100/000000/0b se roteste la stanga cu o pozitie;
or bx, ax; cx=101011/100/0111/000b se pune in cx bitii 0-2 ai lui B, pe poz 7-9
ror ax, 1; ax=/01010/11/100/000000b se roteste ax spre dreapta cu o pozitie
rol ax, 5; ax=11/100/000000/01010b apoi se roteste ax ul cu 5 poz la stanga

shl ax, 11; ax=01010/00000000000b  se rotesc bitii cu 11 pozitii spre stanga si se introd.
	;pe poz ramase libere valoarea din cf
shl bx,6; cx=100/0111/000/000000b deplaseaza spre stanga toti bitii cu
				; 7 pozitii, si completeaza cu 0 poz ramase
ror bx, 6; cx=000000/100/0111/000b se roteste cx cu 6 pozitii la dreapta
or bx, ax; cx=01010/0/100/0111/000b se adauga in cx bitii 5-9 ai lui B pe poz 11-15
mov c, bx

  mov ax, 4c00h ; terminam programul
  int 21h
code ends
end start
 