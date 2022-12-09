.MODEL SMALL
.STACK 100H
.DATA
M1 DB "Welcome User!!$"
M2 DB 0AH, 0DH, "Please User Enter Letter 1:$"
M3 DB 0AH, 0DH, "Please User Enter Letter 2:$"
M4 DB 0AH, 0DH, "Please User Enter Letter 3:$"
LETTER1 DB ?
LETTER2 DB ?
LETTER3 DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, M1
    INT 21H
    
    LEA DX, M2
    CALL TASK
    MOV LETTER1, AL
    
    LEA DX, M3
    CALL TASK
    MOV LETTER2, AL
    
    LEA DX, M4
    CALL TASK
    MOV LETTER3, AL
    
    CALL NEWLINE
    
    MOV DL, LETTER1
    INT 21H
    CALL NEWLINE
    
    MOV DL, LETTER2
    INT 21H
    CALL NEWLINE
    
    MOV DL, LETTER3
    INT 21H
    
    EXIT:
    MOV AH, 4
    INT 21H
    MAIN ENDP
TASK PROC
    INT 21H
    CALL NEWLINE
    MOV AH, 1
    INT 21H
    MOV AH, 9
    RET
    TASK ENDP
NEWLINE PROC
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    RET
END MAIN