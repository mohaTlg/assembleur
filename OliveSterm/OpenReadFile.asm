section .data
    pathname DD "/home/mmdiallo5/M_mmdiallo5/assembleur/OliveSterm/database"
    buffer DD 0
section .text
global _start
_start:

    mov eax, 5
    mov ebx, pathname
    mov ecx, 0
    int 80h

    
    mov ebx, eax
    mov eax, 3
    mov ecx, buffer
    mov edx, 1024
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h