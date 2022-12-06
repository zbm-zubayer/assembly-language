; Suppose AL and BL contain extended ASCII characters.
; Display the one that comes first in the character sequence.
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AH, 2
    
    MOV AL, 'A'
    MOV BL, 'B'
    
    CMP AL, BL
    JAE THEN
    MOV DL, AL
    INT 21H
    JMP EXIT
    
    THEN:
    MOV DL, BL
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN