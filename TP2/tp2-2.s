        .data
s1:     .string "Chaine de caracteres"
s2:     .string "...................."
        .globl main
        .text

main:
        movq $s1, %rsi      #rsi pointe sur le 1er caractère de s1 (source)
        movq $s2, %rdi      #rdi pointe sur le 1er caractère de s2 (destination)

while:
        movb (%rsi), %al    #Lettre dans %al
        movb %al, (%rdi)    #Lettre dans (%rdi)
        cmpb $0, %al        #Est-ce qu'on est à la fin de la chaîne ?
        je end              #Si %al est égal à 0, aller à la fin.
        addq $1, %rsi       #caractere suivant de s1 (source).
        addq $1, %rdi       #caractere suivant de s2 (destination).
        jmp while           #Recommencer.

end:    ret
