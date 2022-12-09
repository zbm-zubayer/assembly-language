.MODEL SMALL
.STACK 100H
.DATA
M1 DB "Welcome To My Calculator!!$"
M2 DB 0AH, 0DH, "Please User Enter A Hex Digit (A-F):$"
M3 DB 0AH, 0DH, "In Decimal it is: $"
M4 DB 0AH, 0DH, "Thank You for using my Calculator$"
M5 DB 0AH, 0DH, "Have a good day$"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    CALL TASK
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP

TASK PROC
    MOV AH, 9
    LEA DX, M1
    INT 21H
    
    LEA DX, M2
    INT 21H
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    MOV AH, 9
    LEA DX, M3
    INT 21H
    
    MOV AH, 2
    
    CMP BL, 41H
    JAE AND_
    JMP EXIT
    
    AND_:
    CMP BL, 46H
    JBE THEN
    JMP EXIT
    
    THEN:
    MOV DL, 31H
    INT 21H
    SUB BL, 11H
    MOV DL, BL
    INT 21H
       
    MOV AH, 9
    LEA DX, M4
    INT 21H
    
    LEA DX, M5
    INT  21H
    
    RET   
    TASK ENDP
END MAIN