[BITS 16]
[ORG 7C00h]

CALL PointerString
CALL PrintString
CALL Loading
CALL LoadSystem

MOV [boot_drive], dl

JMP 0800h:0000h

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

Loading:
    MOV ah, 0eh
    MOV al, 2eh
    int 10h
    MOV al, 2eh
    int 10h
    MOV al, 2eh
    int 10h
    RET

LoadSystem:
    MOV ah, 02h
    MOV al, 1
    MOV ch, 0
    MOV cl, 2
    MOV dh, 0
    MOV dl, [boot_drive]
    MOV bx, 0800h
    MOV es, bx
    MOV bx, 0000h
    INT 13h
    RET

Delay:
    MOV ah, 86h        ; Função da BIOS para Esperar
    MOV cx, 001Eh      ; Parte alta de 2.000.000 em hex
    MOV dx, 8480h      ; Parte baixa de 2.000.000 em hex
    INT 15h            
    RET

boot_drive db 0
iniciando db "Iniciando BootLoader BRRUB", 13,10,0
times 510 - ($-$$) db 0
dw 0xAA55