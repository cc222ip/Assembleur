            .globl main             #Factorielle récursive
            .text
n:          .double 5.0
res:        .double 0.0

main:       push n
            call Facto
            pop res
            ret

Facto:      fldl 8(%rsp)            #st(0) = n
            fldz                    #st(0) = 0.0; st(1) = n
            fcomi %st(1)            #Compare 0 et n
            jnz recursion           #Si n != 0 -> recursion
            faddp %st(0)            #dépile
            faddp %st(0)            #dépile
            fld1                    #st(0) = 1
            fstpl 8(%rsp)           #st(0) = (rsp + 8)
            ret

recursion:  faddp %st(0)            #st(0) = n
            fld1                    #st(0) = 1.0; st(1) = n
            fsubrp %st(0), %st(1)   #st(0) = n - 1.0
            subq $8, %rsp           #Empile une valeur indéterminée
            fstpl (%rsp)            #st(0) = (%rsp) (Push %st(0))
            call Facto
            fldl (%rsp)             #st(0) = (n - 1)!
            addq $8, %rsp           #équivalent d'un "pop"
            fldl 8(%rsp)            #st(0) = n; st(1) = (n - 1)!
            fmulp %st(0), %st(1)     #st(0) = n * (n - 1)!
            fstpl 8(%rsp)           #Valeur de retour
            ret
