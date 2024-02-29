section .data
    pathname DD "./createdfile.txt"
    toWrite DD "Created file by asm", 0AH, 0DH, "$"
section .text
global _start
_start:
    mov eax, 5
    mov ebx, pathname
    mov ecx, 101o       
    mov edx, 700o       ;les droits en octal
    int 80h

    mov ebx, eax
    mov eax, 4
    mov ecx, toWrite
    mov edx, 21         ;taille à ecrire
    int 80h

    mov eax,1
    mov ebx,0
    int 80h