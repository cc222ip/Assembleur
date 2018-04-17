        .data
s:      .string "Je suis une chaine de caractères."
        .globl main
        .text

main:
        movq $s, %rsi       #rsi pointe sur le 1er caractère.
        movq $0, %rax       #nbcaracteres = 0;

while:
        cmpb $0, (%rsi)     #if((%rsi) == 0)
        je end
        addq $1, %rsi       #Caractère suivant.
        addq $1, %rax       #nbcaracteres++;
        jmp while

end:    ret
