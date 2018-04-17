                .data

a:              .byte 8                     #nombre a >= 0
b:              .byte 7                     #nombre b >= 0
c:              .byte 0                     #c = max(a, b)

                .globl main
                .text

main:
                movb $a, %al
                subb $b, %al
                jnc aMaximum                #jc ou jnc(a >= b)

bMaximum:                                   #Inutile (sert à la lisibilité)
                movb $b, %al
                jmp CopieResultat

aMaximum:
                addb $b, %al                 #%al = a - b + b = a = max(a, b)

CopieResultat:
                movb %al, $c
