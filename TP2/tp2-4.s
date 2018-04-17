            .data
s1:         .string "Test"
s2:         .string "Test1"
            .globl main
            .text

main:       movq $s1, %rsi      #rsi pointe sur le 1er caractère de s1 (source)
            movq $s2, %rdi      #rdi pointe sur le 1er caractère de s2 (destination)
            movq $0, %rax       #%rax initialisé à 0.

while:      movb (%rsi), %al    #Caractère courant de s1 stocké dans le registre %al.
            movb (%rdi), %bl    #Caractère courant de s2 stocké dans le registre %bl.
            cmp %al, %bl        #Comparaison du caractère courant de s1 et s2.
            jne end             #Si les caractères sont différents, aller à la fin.
            cmp $0, %al         #La chaîne s1 est complétement parcouru
            je end              #
            addq $1, (%rsi)
            addq $1, (%rdi)
            jmp while

end:        subb %al, %bl
            ret
