.MODEL SMALL  
.STACK 100H  
.DATA
a db 4 dup(?)
c db 02h 
sum db 00h
.CODE
MAIN PROC
mov cx,4
lea SI,a
        
INPUT:
MOV AH,1
INT 21H
sub al,30h
MOV a[SI],AL
INC SI
LOOP INPUT 
        
        
mov bl, 2
mov cx,0
mov dx,0
sub si,4
  
odd:
mov ax,00h
mov al,[si]
div bl
cmp ah,0
          
jne addodd
jmp loop1      
        
        
addodd:
add dl,[si]
        
loop1:
        
cmp cx,4
je end
inc cx
inc si
jmp odd
end:
mov bl,dl
        
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h
        
mov dl,bl
add dl,30h      
mov ah,2
int 21h      

MOV AX, 4C00H
INT 21H
        
MAIN ENDP
END MAIN