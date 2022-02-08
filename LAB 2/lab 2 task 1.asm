.MODEL SMALL
 
.STACK 100H

.DATA 

x db "The result is$"

.CODE 
MAIN PROC 

;iniitialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here 

mov ah,1  
int 21h   
sub al, 30h
mov bl,al
         
mov ah,2   
mov dl,0dh
int 21h
mov dl,0ah
int 21h
         
mov ah,1  
int 21h
sub al,30h  
mov cl,al


add bl,cl
  

         
mov ah,2   
mov dl,0dh
int 21h
mov dl,0ah
int 21h
lea dx,x

mov ah,9  
int 21h  

mov ah,2
mov dl,0dh 
int 21h
mov dl,0ah
int 21h

mov al,bl
mov ah,0
mov cl, 0Ah
div cl

mov bh, ah
mov bl,al


mov dl,bl
add dl,30h
mov ah, 2
int 21h


mov dl,bh
add dl,30h

int 21h 

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  