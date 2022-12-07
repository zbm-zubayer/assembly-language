; Write a program that prompts the user to enter a character, and on subsequent lines prints its ASCII code in binary, and the number of 1 bit in its ASCII code. 
; Hint: Use 2 Procedures MAIN and TASK

.MODEL SMALL
.STACK 100H
.DATA
M1 DB "TYPE A CHARACTER: $"
M2 DB 0AH, 0DH, "THE ASCII CODE OF $"
M3 DB " IN BINARY IS: $"
M4 DB 0AH, 0DH, "THE NUMBER OF 1 BITS IS: $"
COUNT DB "0"
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
    
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    MOV AH, 9
    LEA DX, M2
    INT 21H
    
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    MOV AH, 9
    LEA DX, M3
    INT 21H
    
    MOV AH, 2
    MOV CX, 8
    
    FOR_LOOP:
    SHL BL, 1
    JC DISPLAY_1
    JNC DISPLAY_0
    
    DISPLAY_0:
    MOV DL, 30H
    INT 21H
    JMP REPEAT
    
    DISPLAY_1:
    MOV DL, 31H
    INT 21H
    INC COUNT
    
    REPEAT:
    LOOP FOR_LOOP
    
    MOV AH, 9
    LEA DX, M4
    INT 21H
    
    MOV AH, 2
    MOV DL, COUNT
    INT 21H
    
    RET
    TASK ENDP
END MAIN