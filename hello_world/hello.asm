org 0x100   ; indica que o programa começa no endereço 100h

section .text ; inicio do código

start:
    mov dx, msg ; coloca o endereço da mensagem no registrador dx
    mov ah, 0x09 ; função de escrever string na tela
    int 0x21

    mov ax, 0x4c00
    int 0x21

section .data
    msg db 'Ola GRRUB, assembly!$', 0;