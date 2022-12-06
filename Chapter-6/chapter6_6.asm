; Read a character and if it's an uppercase letter, display it.
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AH, 1
    INT 21H
    
    CMP AL, 'A'
    JAE AND_
    JMP EXIT
    
    AND_:
    CMP AL, 'Z'
    JNBE EXIT
    MOV AH, 2
    MOV DL, AL
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN