        .data
un:     .float 1.0
deux:   .double 2.0
Pi:     .float 3.1416
        .globl main
        .text

main:   flds un                 #st(0) <- 1
        fldl deux               #st(0) <- 2; st(1) = 1
        flds Pi                 #st(0) <- 3.1416; st(1) <- 2; st(2) <- 1
        fmul %st(0), %st(1)     #st(0) <- 3.1416; st(1) <- 6.2832; st(2) <- 1
        faddp %st(0), %st(1)    #st(0) <- 9.4248; st(1) <- 1 (Le p dépile)
        fdivrp %st(0), %st(1)   #st(0) <- 0.1061 (1/9)
        fstps Pi                #st(0) <- pi
        ret
