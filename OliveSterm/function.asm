section .data

section .text
global _start
addTwo:
    add eax, ebx
    ret
_start:
    mov eax, 4
    mov ebx, 1
    call addTwo
    mov ecx, eax
    mov eax, 1
    mov ebx, 0
    int 80h
