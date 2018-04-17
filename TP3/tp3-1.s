            .data
a:          .quad 1
b:          .quad 2
c:          .quad 3
            .globl main
            .text

main:       push a
            push b
            push c
            pop %rax        #rax = 3(c)
            pop %rbx        #rbx = 2(b)
            pop %rcx        #rcx = 1(a)
            ret
