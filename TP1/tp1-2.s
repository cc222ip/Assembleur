            .data

a:          .byte 8         #nombre a >= 0
b:          .byte 7         #nombre b >= 0
c:          .byte 0         #c = max(a, b)

            .globl main
            .text

main:
            movb $a, %al     #%al = 6(a)
            subb $b, %al     #%al = al - b = 6 - 7 = -1(a plus petit)
            movb $c, %bl     #%bl = 0(c)
            jc apluspetit

            addb $a, %bl     #%bl = bl + a = 0 + 6 = 6
            jmp res

apluspetit:
            addb $b, %bl     #%bl = bl + b = 0 + 7 = 7

res:
            movb %bl, c     #c = %bl = 7

            ret
