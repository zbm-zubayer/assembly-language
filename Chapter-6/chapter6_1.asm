; Suppose AX and BX contain signed numbers. Write some code to put the biggest one in CX.
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX, -5
    MOV BX, -6
    MOV CX, AX

    CMP CX, BX
    JGE EXIT
    MOV CX, BX
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN