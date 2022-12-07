; If AL contains 1 or 3, display 'o'; if AL contains 2 or 4, display 'e'.
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AH, 2
    
    MOV AL, 3
    
    CMP AL, 1
    JE DISPLAYO
    CMP AL, 3
    JE DISPLAYO
    CMP AL, 2
    JE DISPLAYE
    CMP AL, 4
    JE DISPLAYE
    JMP EXIT    
    
    DISPLAYO:
    MOV DL, 'o'
    INT 21H
    JMP EXIT
    
    DISPLAYE:
    MOV DL, 'e'
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN