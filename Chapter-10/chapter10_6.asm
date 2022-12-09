; Write a program to convert small letter into capital letter.
; Hint: Use 2 Procedures MAIN and TASK

.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    CALL TASK
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
TASK PROC
    MOV AH, 1
    INT 21H
    
    CMP AL, 61H
    JB EXIT
    CMP AL, 7AH
    JA EXIT
    
    AND AL, 11011111B
    MOV AH, 2
    MOV DL, AL
    INT 21H
    
    RET
    TASK ENDP
END MAIN
