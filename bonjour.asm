section .data
message: db 'Bonjour', 10
longueur: equ $-message
message2: db 'chez vous ', 10
longueur2: equ $-message2
section .text
global _start
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, longueur
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, message2
    mov edx, longueur2
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h

