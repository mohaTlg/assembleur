section .data

section .text
global _start


addTwo:
    push ebp
    mov ebp, esp
    mov eax,[ebp+8]
    mov ebx, [ebp+12]
    add eax, ebx
    pop ebp
    ret
_start:
    push 4
    push 1
    call addTwo
    mov ecx, eax
    
    mov eax, 1
    mov ebx, 0
    int 80h