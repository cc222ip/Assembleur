        .data
s1:     .string "Hello"
        .string "........." #Espace réservé à s1 pour ajouter s2.
s2:     .string " World"
        .globl main
        .text

main:   movq $s1, %rsi      #rsi pointe sur le 1er caractère de s1 (source)
        movq $s2, %rdi      #rdi pointe sur le 1er caractère de s2 (destination)

while1: addq $1, %rsi       #Caractère suivant.
        cmpb $0, (%rsi)     #if((%rsi) == 0)
        je while2
        jmp while1

while2: movb (%rdi), %al    #Lettre dans %al
        movb %al, (%rsi)    #Lettre dans (%rsi)

        addq $1, %rsi       #Caractère suivant de s1
        addq $1, %rdi       #Caractère suivant de s2
        cmpb $0, (%rdi)     #if(s2[i] == 0)
        je end
        jmp while2

end:    ret
