            .globl main
            .text
M1:         .float 1.0, 2.0, 3.0
            .float 4.0, 5.0, 6.0
M2:         .float 6.0, 5.0, 4.0
            .float 3.0, 2.0, 1.0
quatre:     .float 4.0
res:        .float 0.0, 0.0, 0.0
            .float 0.0, 0.0, 0.0

main:       flds M1                 #st(0) = 1.0
            flds M2                 #st(0) = 6.0; st(1) = 1.0
            fmulp %st(0), %st(1)    #st(0) = 6.0
            flds quatre             #st(0


            ret
