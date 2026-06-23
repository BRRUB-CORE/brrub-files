[BITS 16]
[ORG 0x7c00]

CALL PointerBuffer
CALL ReadString
CALL PointerStringBuf
CALL PrintString
CALL JumpLine

CALL PointerString
CALL PrintString

CALL Loading

JMP $

HelloWorld:
    MOV ah, 0eh
    MOV al, 48h
    int 10h
    MOV al, 65h
    int 10h
    MOV al, 6ch
    int 10h
    MOV al, 6ch
    int 10h
    MOV al, 6fh
    int 10h
    MOV al, 20h
    int 10h
    MOV al, 57h
    int 10h
    MOV al, 6fh
    int 10h
    MOV al, 72h
    int 10h
    MOV al, 6ch
    int 10h
    MOV al,64h
    int 10h
    RET

JumpLine:
    MOV ah, 0eh
    MOV al, 0ah
    int 10h
    MOV al, 0dh
    int 10h
    RET

PointerString:
    MOV si, iniciando
    RET

PrintString:
    MOV ah, 0eh
    MOV al, [si]
    print:
        int 10h
        INC si
        MOV al, [si]
        CMP al, 0
        JNE print
    RET

PointerBuffer:
    MOV di, buffer
    RET

PointerStringBuf:
    MOV si, buffer
    RET

ReadString:
    MOV ah, 00h
    int 16h
    MOV ah, 0eh
    int 10h
    MOV [di], al
    inc di
    CMP al, 0dh
    JNE ReadString
    MOV ah, 0eh
    MOV al, 0ah
    int 10h
    RET

Loading:
    MOV ah, 0eh
    MOV al, 2eh
    int 10h
    MOV al, 2eh
    int 10h
    MOV al, 2eh
    int 10h
    RET
    
iniciando db "Iniciando BootLoader BRRUB", 13,10,0
buffer times 20 db 0

times 510 - ($-$$) db 0
dw 0xAA55