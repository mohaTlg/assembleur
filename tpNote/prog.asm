section .data
menu: db 10,'-----------------Menu-----------------',10,'1 Enregistrer du personnel', 10, '2 Lister des personnes enregistrées',10, '3 Afficher des personnes spécifiques', 10, '4 Afficher la personne la plus âgée', 10, '5 Quitter le programme', 10,'--------------------------------------', 10, 'Entrer votre choix: '
longueurMenu: equ $-menu
msgEnregistrement: db 'Enregistrement des personnes',10,'Entrer le nom et age de la personne'
longueurMsgEnreg: equ $-msgEnregistrement
msgListeEnre: db 'Liste des personnes enregistrés:',10
longueurMsgListeEnr: equ $-msgListeEnre
msgChoixInco: db 10,'Choix inconnue, Reessayez !', 10
lenChoixInco: equ $-msgChoixInco
choix db 0
choix1 db 0


section .text
global _start
_start:
    affichageMenu:
        mov eax, 4
        mov ebx, 1
        mov ecx, menu
        mov edx, longueurMenu
        int 80h

        ;Faire le choix
        mov eax, 3
        mov ebx, 0
        mov ecx, choix
        mov edx, 1
        int 80h


        ;comparaison pour le choix
        mov al, [choix]
        sub al, 49
        cmp byte[choix1], al
        je enregistrement

        

        mov al, [choix]
        sub al, 50
        cmp byte[choix1], al
        je affichageEnregistrement

        mov al, [choix]
        sub al, 53
        cmp byte[choix1], al 
        je quitter

        mov al, [choix]
        sub al, 54
        cmp byte[choix1], al 
        jle choixInconue

        mov al, [choix]
        sub al, 48
        cmp byte[choix1], al 
        jb affichageMenu

   
        

    enregistrement:
        mov eax, 4
        mov ebx, 1
        mov ecx, msgEnregistrement
        mov edx, longueurMsgEnreg
        int 80h
        jmp affichageMenu
        
     affichageEnregistrement:
        mov eax, 4
        mov ebx, 1
        mov ecx, msgListeEnre
        mov edx, longueurMsgListeEnr
        int 80h
        jmp affichageMenu

    choixInconue:
        mov eax, 4
        mov ebx, 1
        mov ecx, msgChoixInco
        mov edx, lenChoixInco
        int 80h
        jmp affichageMenu
        

    quitter:
        mov eax, 1
        mov ebx, 0
        int 80h