section .data
    etoile: db '*'
    prompt db 'Entrer un chiffre : '
    len: equ $-prompt
    buffer db 0         ;Définit une variable buffer de taille 1 
    i db 0
section .text
    global _start
_start:
    saisi:
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

    debut_for:
        mov al,[buffer]     ; Charge le caractère saisi depuis le buffer dans le registre al.
        sub al,48          ;convetir le caractere en entier (48 valeur ascii de 0)
        cmp byte[i], al
        jge fin_for
        mov eax, 4
        mov ebx, 1
        mov ecx,etoile
        mov edx, 1
        int 80h
        inc byte[i]
        jmp debut_for
    fin_for:
        mov eax, 1
        mov ebx, 0
        int 80h



;Le registre al (Accumulator Low) est un registre de 8 bits du processeur x86. Il fait partie du registre eax (Accumulator), qui est un registre de 32 bits. al correspond aux bits de poids faible (0-7) de eax.

;Le registre al est couramment utilisé pour stocker des données de 8 bits telles que des caractères ASCII, des entiers de petite taille ou d'autres données où seul le byte de poids faible est pertinent.