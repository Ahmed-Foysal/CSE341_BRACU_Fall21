.MODEL SMALL

.STACK 100H

.DATA

a db 11 <?>


       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA 
MOV DS,AX

; enter your code here
 
mov cx,11
lea si,a

input: 
mov ah,1
int 21h
mov [si],al 

inc si

loop input

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h


mov cx,11
lea si,a  

output:
mov dx,cx 
cmp dx,0
je  exit
mov dx,0

cmp [si],' '         
je  space 

cmp [si],90
jl  print_G


mov [si], 104
mov ah,2
mov dl,[si] 
int 21h
 
inc si
mov dx,0 

loop output  
jmp exit

space:
mov dl,' '
mov ah,2
int 21h
inc si
mov dx,0
loop output 

print_G:
mov [si],071
mov ah,2 
mov dl,[si]
int 21h
inc si 
mov dx,0
loop output  

exit:
;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN