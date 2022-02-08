.MODEL SMALL
 
.STACK 100H

.DATA 

;Month days 

A DB "ENTER A DIGIT FROM 1-6: $ " 
;declaring the numbers as string for easier printing
X DB "28$" 
Y DB "30$"
Z DB "31$"
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
 
MOV AH,2      
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h

CMP BL,'1'
JE Day31 
 
CMP BL,'2'
JE Day28 

CMP BL,'3'
JE Day31 

CMP BL,'4'
JE Day30 

CMP BL,'5'
JE Day31 

CMP BL,'6'
JE Day30 

;Dividing all the month on three categories

Day28:

MOV AH,9
LEA DX,x
INT 21h

JMP EXIT

Day30:

MOV AH,9
LEA DX,y
INT 21h

JMP EXIT 

Day31:

MOV AH,9
LEA DX,z
INT 21h

JMP EXIT
  
EXIT:       

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  