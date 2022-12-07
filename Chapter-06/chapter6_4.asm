; If AX contains a negative number, put -1 in BX, if AX conatains 0 put 0 in BX, if AX contains a positive number, put 1 in BX.
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX, -5
    
    CMP AX, 0
    JL NEGATIVE
    JE ZERO
    JG POSITIVE
    
    NEGATIVE:
    MOV BX, -1
    JMP EXIT   
    
    ZERO:
    MOV BX, 0
    JMP EXIT
    
    POSITIVE:
    MOV BX, 1
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN