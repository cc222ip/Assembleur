            .data
src:        .string "Hello"
            .string "........." #Espace réservé à s1 pour ajouter s2. 
dest:       .string " World"
            .globl main
            .text

main:       push $src
            push $dest
            call strcat
            pop %rax
            ret
                                
strcat:     movq $s1, %rsi      #rsi pointe sur le 1er caractère de $src
            movq $s2, %rdi      #rdi pointe sur le 1er caractère de $dest

while1:     addq $1, %rsi       #Caractère suivant.
            cmpb $0, (%rsi)     #if((%rsi) == 0)
            je while2
            jmp while1

while2:     movb (%rdi), %al    #Lettre dans %al
            movb %al, (%rsi)    #Lettre dans (%rsi)

            addq $1, %rsi       #Caractère suivant de s1
            addq $1, %rdi       #Caractère suivant de s2
            cmpb $0, (%rdi)     #if(s2[i] == 0)
            je end
            jmp while2

end:        
            ret                 #Retour
