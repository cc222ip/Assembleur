        .data
a:      .float 1.6
b:      .float 2.4
un:     .float 1.0
deux:   .float 2.0
cinq:   .float 5.0

        .globl main
        .text

main:   flds a                  #st(0) <- 1.6
        flds deux               #st(0) <- 2.0; st(1) <- 1.6;


        faddp %st(0), %st(1)    #st(0) = 3.6;
        flds cinq               #st(0) = 5.0; st(1) = 3.6;
        fmulp %st(0), %st(1)    #st(0) = 18
        fsqrt                   #st(0) = 4.2
        flds un                 #st(0) = 1.0; st(1) = 4.2
        fsubp %st(0), %st(1)    #st(0) = -3.2
        flds deux               #st(0) = 2.0; st(1) = -3.2
        flds b                  #st(0) = 2.4; st(1) = 2.0; st(2) = -3.2
        fsubp %st(0), %st(1)    #st(0) = 0.4; st(1) = -3.2
        flds deux               #st(0) = 2.0; st(1) = 0.4; st(2) = -3.2
        fmulp %st(0), %st(1)    #st(0) = 0.8; st(1) = -3.2
        fdivrp %st(0), %st(1)   #st(0) = -4
        ret
