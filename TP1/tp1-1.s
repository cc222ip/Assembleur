        .globl main
        .text

main:   movq $0x123456789ABCDEF0, %rax   #rax = 123456789ABCDEF0
        addb $16, %al                    #rax = 123456789ABCDE00
        addl $0x2200, %eax               #rax = 123456789ABD0000
        subw $1, %ax                     #rax = 123456789ABDFFFF
        ret
