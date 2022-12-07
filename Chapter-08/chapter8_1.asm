; Take Binary input, show Binary output
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    XOR BX, BX ; Clearing BX
    MOV AH, 1
    INT 21H
    
    WHILE_INPUT:
    CMP AL, 0DH ; [ODH = Carriage Return]
    JE OUTPUT
    ; Converting character to Binary value
    AND AL, 0FH ; Or [AND AL, 00000001B]
    SHL BX, 1   ; Left shif BX
    OR BL, AL   ; Inserting value into LSB of BX
    INT 21H
    JMP WHILE_INPUT
    
    OUTPUT:
    MOV AH, 2
    MOV DX, 0AH
    INT 21H
    MOV DX, 0DH
    INT 21H
    
    MOV AH, 2
    MOV CX, 16 ; For 16 bits output
    FOR_LOOP:
    RCL BX, 1 ; Or [SHL BX, 1] e.g. Put MSB into CF
    JC DISPLAY_1
    JNC DISPLAY_0
    
    DISPLAY_0:
    MOV DX, 30H
    INT 21H
    JMP REPEAT
    
    DISPLAY_1:
    MOV DX, 31H
    INT 21H
    
    REPEAT:
    LOOP FOR_LOOP
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
