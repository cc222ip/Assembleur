            .globl main         #Factorielle itérative
            .text

main:       push $5
            call Facto          #Appel de la fonction "Facto" pour faire la factorielle de 5
            pop %rax            #%rax = 1 * ... * n-1 * n où n représente le paramètre de la fonction
            push $1000
            call Facto          #Appel de la fonction "Facto" pour faire la factorielle de 1000
            pop %rax            #%rax = 0 si n ! > 2^64 - 1 / Si débordement
            ret                 #Fin de programme

Facto:      movq 8(%rsp), %rax  #%rax = paramètre n
                                #%rax sera aussi le résultat
            movq %rax, %rcx     #%rcx est le compteur de boucle

Boucle:     subq $1, %rcx       #%rcx = %rcx - 1
            cmp $1, %rcx        #Fin ?
            jbe FIN
            mulq %rcx           #%rdx : %rax = %rax * %rcx
            cmp $0, %rdx
            jne Debordement     #Résultat > 2^64 - 1
            jmp Boucle          #Valeur suivante

Debordement:movq $0, %rax       #!n = 0 => Débordement

FIN:        movq %rax, 8(%rsp)  #Remplace le paramètre par la valeur de retour
            ret                 #retour au main
