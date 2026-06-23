[BITS 16]
[ORG 0000h]

JMP OSMain

BackWidth db 0
BackHeight db 0
Pagination db 0

Welcome db "Bem-Vindo ao BRRUB-OS!",0

OSMain:
    CALL ConfigSegment
    CALL ConfigStack
    CALL TEXT.setVideoMode
    JMP ShowString

ShowString:
    MOV dh, 3
    MOV dl, 2
    CALL MoveCursor
    MOV si, Welcome
    CALL PrintString
    JMP END
    
ConfigSegment:
    MOV ax, es
    MOV ds, ax
RET

ConfigStack:
    MOV ax, 7D00h
    MOV ss, ax    ; 7D00h:03FEh
    MOV sp, 03FEh
RET

TEXT.setVideoMode:
    MOV ah, 00h
    MOV al, 03h
    INT 10h
    MOV BYTE[BackWidth], 80
    MOV BYTE[BackHeight], 20
RET

PrintString:
    MOV ah, 09h
    MOV bh, [Pagination]
    MOV bl, 40
    MOV cx, 1
    MOV al, [si]
    print:
        INT 10h
        INC si
        CALL MoveCursor
        MOV ah, 09h
        MOV al, [si]
        CMP al, 0
        JNE print
RET

MoveCursor:
    MOV ah, 02h
    MOV bh, [Pagination]
    INC dl
    INT 10h
RET

END:
    JMP $