.MODEL SMALL
 
.STACK 100H

.DATA 

;Month days 

A DB "!st input: $ " 
B DB "2nd input:$ " 
C DB "Divisible$"
D DB "Not divisible$"

x DB 2 
y DB 5

.CODE 
MAIN PROC 

;iniitialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here 

MOV AH,9
LEA DX,A   
INT 21h

MOV AH,1
INT 21h
MOV BL,AL
SUB BL,30h 
 
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h 
 
MOV AH,9
LEA DX,B
INT 21h
 
MOV AH,1
INT 21h
MOV CL,AL
SUB CL,30h  
 
MOV AH,2      
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h 
 
MOV AL,BL
MUL CL  
ADD AX,6h
MOV BX,AX

DIV x       
SUB AX,2h
 
CMP AH,0
 
;L5 to check if it is also divisible by 5
 
JE L5
 
;L3 to check whether it is divisble by 5
JG L3 

L3:
MOV AX,BX
Sub AX,6h
DIV y      
 
CMP AH,0
JE L1 

JG L2

JMP EXIT
 
L1:
MOV AH,9
LEA DX,C
INT 21h 
 
JMP EXIT
 
L2:
MOV AH,9
LEA DX,D
INT 21h

JMP EXIT
 
L5:
MOV AX,BX
DIV y        
SUB AX,31h
 
CMP AH,0

;If divisible by both 2 and 5, Printing "Not divisible"
JE L2

;Not divisible by 5, only divisible by 2 so printing "Divisible" 
JG L1
 
JMP EXIT 
  
EXIT:       

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  