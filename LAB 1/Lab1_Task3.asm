
.STACK 100H

.DATA 
;Variables

;X = (X * Z) / (Y * W) / (Z * X)
;declaring variables and assigning random values
W db 6
X db 2
Y db 10
Z db 4

.CODE 
MAIN PROC 



MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here 
mov al, x
mov bl, z
mul bl
;X*Z 

mov DX,AX
;Saving X*Z in DX

mov al, y
mov bl, w
mul bl 
;Y*W

mov CX,AX
;Saving Y*W in CX 

mov AX,DX
div Cl 
;(X*Z)/(Y*W)

mov Ah, 0
;removing remainder part

div Dl 
;(X*Z)/(Y*W)/(Z*X)

Mov X, Al
;Storing the vlue in X variable 

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  

