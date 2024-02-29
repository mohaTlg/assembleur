section .data
    prompt db 'Entrez un caractère : ', 0
    len: equ $-prompt
    buffer db 1

    message: db 'Vous avez entrer : ', 0
    longueur2: equ $-message

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

    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, len
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 1
    int 80h


    mov eax, 1
    mov ebx, 0
    int 80h