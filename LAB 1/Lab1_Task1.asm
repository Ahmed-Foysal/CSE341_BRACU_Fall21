
.STACK 100H

.DATA 


.CODE 
MAIN PROC 



MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here 
sub bh,bh
;making sure the register is empty

add bh,5
;adding first random value for swap

sub bl,bl
;making sure the register is empty

add bl,6
;adding second random value for swap

sub dh,dh
;making sure the register is empty

add dh,bh
;using dh as temp

sub bh,bh
;emptying the first regiter to store seond value
 
add bh,bl
;swaping second value

sub bl,bl
;emptying the second regiter to store first value

add bl,dh 
;adding first value from temp
;swap is done 

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  

