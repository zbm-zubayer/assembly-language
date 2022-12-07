; Take an input character from user.
; Check it for letter and convert upper to lower or lower to upper using logical instructions.
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AH, 1
    INT 21H
    
    MOV AH, 2
    
    CMP AL, 61H
    JAE AND1
    CMP AL, 41H
    JAE AND2
    JMP EXIT
    
    AND1:
    CMP AL, 7AH
    JBE LOWER2UPPER
    JMP EXIT
    
    AND2:
    CMP AL, 5AH
    JBE UPPER2LOWER
    JMP EXIT
    
    LOWER2UPPER:
    AND AL, 11011111B ; MASK: AND AL, 00DFH [HEX FORMAT]
    MOV DL, AL
    INT 21H
    JMP EXIT
    
    UPPER2LOWER:
    OR AL, 00100000B ; MASK: OR AL, 0020H [HEX FORMAT]
    MOV DL, AL
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN