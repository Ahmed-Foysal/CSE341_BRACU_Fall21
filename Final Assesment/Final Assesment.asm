.MODEL SMALL
 
.STACK 100H

.DATA 

A db 'Hi! Enter 1 to Load Profile, 2 to Update Profile, 3 to Make New Friends, 4 to Like a Celebrity, 5 to Show Liked celebrities$'
B db 'Name: Foysal Ahmed$'
C db 'Age: $'
D db 'Friends: $'
E db 'Updated Age: $'
F db 'Updated Number of Friends: $'
G db 'Who Does not love celebrities? lets Like three celebrities. Enter 1 to like Rick, 2 to like Morty, 3 to like JohnSnow, 4 to like Rock, 5 to like Aurthohin$ '
H db 'You have entered an invalid number. you will be returned to main menu. Please try again$'
I db 'Your desired 3 celebrities have been liked$'
J db 'Your Liked celebrities are: $'
rick db 'Rick$'
morty db 'Morty$'
johnSnow db 'JohnSnow$'
rock db 'Rock$'
aurthohin db 'Aurthohin$'
x db 3 dup ('$')  
Age dw 23d
Friends dw 0d
.CODE 
MAIN PROC 

;iniitialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

;printing welcome message
MOV AH,9
LEA DX,A
INT 21h

MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h 

loop:

;Taking input for procedures
MOV AH,1
INT 21h

CMP AL,31h
JE Loop1

CMP AL,32h
JE Loop2 

CMP AL,33h
JE Loop3

CMP AL,34h
JE Loop4

CMP AL,35h
JE Loop5
JNE wrong_input



JMP loop



Loop1:
CALL Load_profile
JMP loop

Loop2:
CALL Update_Profile_Age
JMP loop 

Loop3:
CALL Make_New_Friends
JMP loop

Loop4:
CALL Like_celebrity
JMP loop

loop5:
CALL Show_celebrity
JMP loop

Load_profile:

;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h

;Printing Name
MOV AH,9
LEA DX,B
INT 21h 

;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h 

;Printing Age
MOV AH,9
LEA DX,C
INT 21h

;Two digit Numbers are represented by diving
MOV BH,10

;MOV AX,CX
MOV AX,Age
DIV BH

MOV BH,AH
MOV AH,2
LEA DL,AL
Add Dl,30h 
INT 21h

MOV AH,2
LEA DL,BH
Add Dl,30h 
INT 21h

;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h

;Printing friends
MOV AH,9
LEA DX,D
INT 21h

;Two digit Numbers are represented by diving
MOV BH,10

;MOV AX,CX
MOV AX,Friends
DIV BH

MOV BH,AH
MOV AH,2
LEA DL,AL
Add Dl,30h 
INT 21h

MOV AH,2
LEA DL,BH
Add Dl,30h 
INT 21h

;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h

MOV AL,0

Ret



Update_Profile_Age:

;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h

;Printing Age
MOV AH,9
LEA DX,E
INT 21h

;Two digit Numbers are represented by diving
ADD Age,5
MOV BH,10
MOV AX,Age
DIV BH

MOV BH,AH
MOV AH,2
LEA DL,AL
Add Dl,30h 
INT 21h

MOV AH,2
LEA DL,BH
Add Dl,30h 
INT 21h

;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h 

ret



Make_New_Friends:

;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h

;Printing Updated number of friends
MOV AH,9
LEA DX,F
INT 21h

;Two digit Numbers are represented by diving
ADD Friends,1
MOV BH,10
MOV AX,friends
DIV BH

MOV BH,AH
MOV AH,2
LEA DL,AL
Add Dl,30h 
INT 21h

MOV AH,2
LEA DL,BH
Add Dl,30h 
INT 21h


;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h 

ret

Like_celebrity:
;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h 

;Printing Name of Celebrities
MOV AH,9
LEA DX,G
INT 21h





mov cx,3
mov si, offset x

input:
;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h
 
mov ah,1
int 21h
mov [si],AL
inc si 
loop input
jmp celeb_added


celeb_added:
;line break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h 

;Celebs added
MOV AH,9
LEA DX,I
INT 21h

;line break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h

RET

Show_celebrity:
;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h

;Printing Name
MOV AH,9
LEA DX,j
INT 21h 

;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h 
 
mov cx,0d
mov si,offset x
MOV AH,9
print:
CMP cx,33h
JE Loop

CMP [si],31h
JE l1


CMP [si],32h
JE l2


CMP [si],33h
JE l3


CMP [si],34h
JE l4


CMP [si],35h
JE l5



RET

l1:
MOV AH,9
LEA DX,rick
int 21h

;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h

add si,1
inc cx
jmp print
l2:
MOV AH,9
LEA DX,morty
int 21h

;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h

add si,1
inc cx
jmp print
l3:
MOV AH,9
LEA DX,johnsnow
int 21h

;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h

add si,1
inc cx
jmp print
l4:
MOV AH,9
LEA DX,rock
int 21h

;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h

add si,1
inc cx
jmp print
l5:
MOV AH,9
LEA DX,aurthohin
int 21h

;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h
add si,1
inc cx
jmp print
 


wrong_input:
;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h

MOV AH,9
LEA DX,H
INT 21h

;Line Break
MOV AH,2     
MOV DL,0DH
INT 21h
MOV DL,0AH
INT 21h
jmp loop
;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  