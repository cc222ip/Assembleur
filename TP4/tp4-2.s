            .globl main         #Factorielle récursive
            .text

main:       push $5
            call Facto          #Appel de la fonction "Facto" pour faire la factorielle de 5
            pop %rax            #%rax = 1 * ... * n-1 * n où n représente le paramètre de la fonction
            push $1000
            call Facto          #Appel de la fonction "Facto" pour faire la factorielle de 1000
            pop %rax            #%rax = 0 si n ! > 2^64 - 1 / Si débordement
            ret                 #Fin de programme

Facto:      cmp $1, 8(%rsp)     #n
            je FIN
            subq $1, 8(%rsp)    #n = n - 1
            push 8(%rsp)        #n - 1
            call Facto          #!(n - 1) -> Au sommet de la pile
            pop %rax            #rax = n - 1
            addq $1, 8(%rsp)
            mulq 8(%rsp)        #n * (n-1)! -> rax
            cmp $0, %rdx
            je PresqueFini
            movq $0, %rax       #Débordement


PresqueFini:movq %rax, 8(%rsp)

FIN:        ret
