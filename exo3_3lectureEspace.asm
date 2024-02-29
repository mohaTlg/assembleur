section .data
    prompt db 'Lecture caractere jusqua espace: '
    len: equ $-prompt
    buffer db 0
    
    i db 0
    currentChar db 0
 

section .text
    global _start
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, len
    int 80h

    saisi:
        mov eax, 3
        mov ebx, 0
        mov ecx, buffer
        mov edx, 1
        int 80h

        cmp byte [buffer], 32
        je affichage

        mov al, byte [buffer]
        mov ebx, currentChar
        add bl, [i]
        mov byte [ebx], al
        inc byte [i]
        jmp saisi
       
        
    affichage:
        mov eax, 4
        mov ebx, 1
        mov ecx, currentChar
        mov edx, 0
        mov dl, [i]
        int 80h

    fin:
        mov eax, 1
        mov ebx, 0
        int 80h

        