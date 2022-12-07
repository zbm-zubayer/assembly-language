; Write a program that to that has three procedures named MAIN,  Second and Third.
; Print one greetings from each of the procedures. 

.MODEL SMALL
.STACK 100H
.DATA
M1 DB "Hi, I am from Main Procedure$"
M2 DB 0AH, 0DH, "Hi, I am from Second Procedure$"
M3 DB 0AH, 0DH, "Hi, I am from Third Procedure$"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, M1
    INT 21H
    
    CALL SECOND
    CALL THIRD
     
    EXIT:
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP

SECOND PROC
        LEA DX, M2
        INT 21H
        RET
        SECOND ENDP
THIRD PROC
        LEA DX, M3
        INT 21H
        RET
        THIRD ENDP
END MAIN