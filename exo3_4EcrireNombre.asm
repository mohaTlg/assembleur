section .data
    prompt db 'Entrer un nombre entier: '
    len: equ $-promt
    buffer db 0

section .text
    global _start
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, len
    int 80h

    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 1
    int 80h

    