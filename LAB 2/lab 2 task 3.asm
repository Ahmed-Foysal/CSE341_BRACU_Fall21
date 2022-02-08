.MODEL SMALL
 
.STACK 100H

.DATA 

A db 'Enter First Initial: $'    ;defining variable
B db 'Enter Second Initial: $'
C db 'Enter Third Initial: $'

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
mov bh,al
    
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h 
    

    
mov ah,9
lea dx,C        
int 21h
    
mov ah,1
int 21h
mov cl,al
    
mov ah,2
mov dl,0dh       
int 21h
mov dl,0ah
int 21h
    
mov ah,9
lea dx,C        
int 21h
    
mov ah,1
int 21h
mov ch,al
    
mov ah,2
mov dl,0dh       
int 21h
mov dl,0ah
int 21h
    
mov dl,bl
int 21h
  
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h
    
    
mov dl,bh
int 21h

mov dl,cl
int 21h
    
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h
    
    
mov dl,ch
int 21h

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  