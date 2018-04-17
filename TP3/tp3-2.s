            .data
s:          .string "Test"
            .globl main
            .text

main:       push $s
            call strlen
            pop %rax            #rax = strlen(s)
            ret

strlen:     movq 8(%rsp), %rsi  #Récupère $s au sommet de la pile+16.

            movq $0, %rax       #nbcaracteres = 0;
while:      addq $1, %rsi       #Caractère suivant.
            addq $1, %rax       #nbcaracteres++;
            cmpb $0, (%rsi)     #if((%rsi) == 0)
            jz end
            jmp while

end:        movq %rax , 8(%rsp) #Remplace $s dans la pile par strlen(s)
            ret
