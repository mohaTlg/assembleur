section .data
    etoile: db '*'
    retourLigne: db 10
    longueur: equ $-etoile
    i db 0
    j db 1
    n db 5

section .text
global _start
_start:
    debut_for:
        mov al, [n]
        cmp byte[i], al
        jge fin_for
        mov eax, 4
        mov ebx, 1
        mov ecx, etoile
        mov edx, 1
        int 80h
        inc byte[i]
        jmp debut_for
    fin_for:
        mov eax, 4
        mov ebx, 1
        mov ecx, retourLigne
        mov edx, 1
        int 80h
        mov al, [n]
        cmp byte[j], al
        jge fin
        inc byte[j]
        mov byte[i], 0
        jmp debut_for

    fin:
        mov eax, 1
        mov ebx, 0
        int 80h