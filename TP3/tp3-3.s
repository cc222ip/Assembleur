            .data
src:        .string "Chaine de caracteres"
dest:       .string "...................."
            .globl main
            .text

main:       push $src
            push $dest
            call strcpy
            pop %rax            #Adresse de $src
            ret

strcpy:     movq 8(%rsp), %rsi  #Récupère $src au sommet de la pile+8.
            movq 16(%rsp), %rdi #Récupère $dest au sommet de la pile+16.

while:      movb (%rsi), %al    #Lettre dans %al
            movb %al, (%rdi)    #Lettre dans (%rdi)
            cmpb $0, %al        #Est-on est à la fin de la chaîne ?
            je end              #Si %al est égal à 0, aller à la fin.
            addq $1, %rsi       #caractere suivant de $src
            addq $1, %rdi       #caractere suivant de $dest
            jmp while           #Recommencer.

end:        pop %rbx            #Adresse de retour
            pop %rcx            #2ème paramètre
            movq %rax, (%rsp)   #Remplace $src par $dest
            push %rbx           #Rempiler l'adresse de retour
            ret                 #Retour
