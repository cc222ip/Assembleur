            .data
m1:         .quad 3                     #nb colonnes
            .quad 2                     #nb lignes
            .double 1.0, 2.0, 3.0
            .double 4.0, 5.0, 6.0
m2:         .quad 2                     #nb colonnes
            .quad 3                     #nb lignes
            .double 1.0, 2.0
            .double 3.0, 4.0
            .double 5.0, 6.0
res:        .quad 2                     #nb colonnes
            .quad 2                     #nb lignes
            .float 0.0, 0.0
            .float 0.0, 0.0
            .globl main
            .text

main:       push $m1
            push $m2
            push $res
            call Produit
            ret

Produit:                                #Teste le produit scalaire de la 1ère ligne et la 1ère colonne
            push $m1+16                 #Adresse première ligne de m1
            push $m2+16                 #Adresse première colonne de m2
            push $3                     #nb de composantes
            push $16                    #Taille ligne m2
            call PScalaire
            movq $res+16, %rsi
            fstps (%rsi)
            ret

PScalaire:  movq $0, %rcx               #indice
            fldz                        #st(0) = 0.0 (somme)
            movq 24(%rsp), %rdi         #Début 1ère colonne de m2
            movq 32(%rsp), %rsi         #Début 1ère ligne de m1

Boucle:     fldl (%rsi)                 #st(0) = l[i], st(1) = somme
            fldl (%rdi)                 #st(0) = c[i], st(1) = l[i], st(2) = somme
            fmulp %st(0), %st(1)        #st(0) = c[i] * l[i], st(1) = somme
            faddp %st(0), %st(1)        #st(0) = somme + c[i] * l[i]
            addq $8, %rsi               #Elément suivant de ligne []
            addq 8(%rsp), %rdi          #Elément suivant de colone []
            addq $1, %rcx               #Compteur++
            cmpq 16(%rsp), %rcx         #Dernière composante
            jne Boucle
            ret $32
