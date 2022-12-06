.model small
.stack 100h
.data
msg db "Hello world$"
.code
main proc
    mov ax, @data ; Load variables from data segment to code segment
    mov ds, ax
    
    mov ah, 1 ; Input
    int 21h
    mov bx, ax
    
    ; New Line code
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov ah, 2 ; Single character output
    mov dx, bx
    int 21h
    
    mov ah, 9 ; String output
    lea dx, msg
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main