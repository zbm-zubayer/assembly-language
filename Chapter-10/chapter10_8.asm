.MODEL SMALL
.STACK 100H
.DATA
M1 DB "Welcome To My Calculator!!$"
M2 DB 0AH, 0DH, "Please User Enter Digit 1:$"
M3 DB 0AH, 0DH, "Please User Enter Digit 2:$"
M4 DB 0AH, 0DH, "Thank You for using my Calculator$"
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
    
    CALL NEWLINE
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    MOV AH, 9
    LEA DX, M3
    INT 21H
    
    CALL NEWLINE
    MOV AH, 1
    INT 21H
    MOV CL, AL
    
    SUB BL, CL
    ADD BL, 30H
    
    CALL NEWLINE
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    RET
    TASK ENDP

NEWLINE PROC
    MOV AH, 2
    MOV DL, 0AH
    INT 21H    
    MOV DL, 0DH
    INT 21H
    RET
    NEWLINE ENDP
END MAIN