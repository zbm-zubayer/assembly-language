; Take an input character from user.
; Check it for number and find whether it is odd or even using TEST instruction.
.MODEL SMALL
.STACK 100H
.DATA
M1 DB 0AH, 0DH, "EVEN$"
M2 DB 0AH, 0DH, "ODD$"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AH, 1
    INT 21H
    
    MOV AH, 9
    
    CMP AL, 30H
    JAE NUMBER_CHECK
    JMP EXIT
    
    NUMBER_CHECK:
    CMP AL, 39H
    JBE EVEN_ODD
    JMP EXIT
    
    EVEN_ODD:
    TEST AL, 1
    JZ DISPLAY_EVEN
    JNZ DISPLAY_ODD
    
    DISPLAY_EVEN:
    LEA DX, M1
    INT 21H
    JMP EXIT
    
    DISPLAY_ODD:
    LEA DX, M2
    INT 21H

    EXIT:
    MOV AH, 4
    INT 21H
    MAIN ENDP
END MAIN