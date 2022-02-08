
.STACK 100H

.DATA 
;Variables


.CODE 
MAIN PROC 



MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here 
mov al, 5
mov bl, 2
mul bl
;(5*2)

mov bl,4
sub bl,0
;(4-0) 

add al,bl
;(5*2)+(4-0)

mov ch,5
mov cl, 3
add cl,ch
add cl,2
;(5+3+2)

add al,cl
;(5*2)+(4-0)+(5+3+2)

mov dl,al

mov al,6
mov dh,2
div dh
;(6/2) 

sub dl,al 
;(5*2)+(4-0)+(5+3+2)-(6/2)
; final value is saved in dl register

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  

