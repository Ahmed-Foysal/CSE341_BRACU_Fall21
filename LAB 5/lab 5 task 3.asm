.MODEL SMALL

.STACK 100H

.DATA

a db 5 <?> 
       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX

; enter your code here

mov cx,5
mov bx,offset a

input: 
mov ah,1
int 21h
mov [bx],al 

inc bx 

loop input

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h


mov cx,5
dec cx

loop1:

mov bx,cx
mov si,0

compare:
mov al,a[si]
mov dl,a[si+1]
cmp al,dl 
jc  loop2 

mov a[si],dl
mov a[si+1],al
loop2:
inc si 
dec bx 
jnz compare
 
loop loop1

mov cx,5
lea si,a  

print:
mov ah,2
mov dl,[si]
int 21h
 
inc si 

loop print
 
;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN