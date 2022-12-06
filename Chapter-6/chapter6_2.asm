;Replace the number in AX by its absolute value
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX, -5
    CMP AX, 0
    JGE EXIT
    NEG AX
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN