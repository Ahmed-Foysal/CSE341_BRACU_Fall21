.MODEL SMALL
 
.STACK 100H

.DATA 

A db 'ENTER FIRST HEX DIGIT:$'   
B db 'ENTER SECOND HEX DIGIT: $'
C db 'IN DECIMAL SUBTRACTION IS  $'

.CODE 
MAIN PROC 

;iniitialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here 

mov ah,9
lea dx,A
int 21h
    
mov ah,1
int 21h
mov bl,al     
sub bl,17d    

    
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

mov ah,9
lea dx,B
int 21h
    
mov ah,1
int 21h
mov cl,al     
    
sub cl,17d
sub bl,cl


mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h
    
mov ah,9
lea dx,C
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
  