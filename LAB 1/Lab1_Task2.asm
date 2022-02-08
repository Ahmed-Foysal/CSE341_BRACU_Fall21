
.STACK 100H

.DATA 
;Variables 

;D = A - (C - A) + D

;Declaring variables and Assigning random values
A db 10
C db 6
D db 2

.CODE 
MAIN PROC 



MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here 

;Moving the values in register
mov ah, A
mov ch, C
mov dh, D

sub ch , ah
;(C-A)

sub ah , Ch
;A-(C-A)

add ah , Dh
;A-(C-A)+D
;final value is in ah

mov D,ah
;storing the final result in D




 

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  

