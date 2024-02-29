section .data
nombre db '7','9','1','2','7'
L equ $ - nombre
shift db 0

section .text
    global _start

_start:
    mov edx,0
    mov al ,[nombre]

    next:
        inc edx
        cmp al, [nombre + edx]
        jae test
        mov al,[nombre + edx]
        mov byte [shift] ,al

    test:
    cmp edx,L
    jb next
    mov eax,4
    mov ebx,1
    mov edx,[shift]
    mov ecx,nombre
    mov ecx,[nombre+edx]
    mov edx,1
    int 80h

    mov eax,1
    mov ebx,0
    int 80h