.MODEL SMALL
 
.STACK 100H

.DATA 

;Find Maximum
A db '1st input: $'   
B db '2nd input: $'
C db '3rd input:  $' 
out1 DB "$"

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
 
MOV AH,9
LEA DX,B
INT 21h
 
MOV AH,1
INT 21h
MOV CL,AL  
 
MOV AH,2      
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h 
 
MOV AH,9
LEA DX,C
INT 21h
  
MOV AH,1
INT 21h 
MOV BH,AL
 
CMP BL,CL  
  
MOV AH,2      
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h   
  
JG l2  
CMP BH,CL  
JG l1
 
MOV AH,2
LEA DL,CL 
INT 21h   
 
JMP EXIT
 
l1:

MOV AH,2
LEA DL,BH 
INT 21h
 
JMP EXIT       
 
l2:

CMP BH,BL
  
JG l3 
CMP CL,BH
JG l4
 
 
MOV AH,2
LEA DL,BL 
INT 21h 
 
JMP EXIT 
 
l3:

MOV AH,2
LEA DL,BH 
INT 21h
 
JMP EXIT
 
l4:

MOV AH,2
LEA DL,BL 
INT 21h 

EXIT:      

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  