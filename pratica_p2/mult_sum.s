       ;       Exercicio - Organizacao de computadores
       ;       Operação de multiplicação com arquitetura ARM
       ;       Operação de multiplicação por meio de somas
       ;       Data: 27/09/2019
       ;       Aluno: Luigi Luz

       ;       ------------------------------------------------
       ;       Definimos os valores que serão multiplicados
val1   dcd     0x00000002
val2   dcd     0x00000003

       ;       ------------------------------------------------
       ;       Carregamos os endereços dos valores a serem multiplicados nos registradores
       mov     r0, #val1 ; r0 vai receber o endereço de val1
       mov     r1, #val2 ; r1 vai receber o endereço de val2
       ;       Carregamos os valores guardados nos respectivos endereços
       ldr     r2, [r0] ; Carrego o valor guardado em r0
       ldr     r3, [r1] ; Carrego o valor guardado em r1

       ;       ------------------------------------------------
       ;       Definimos os registradores auxiliares
       mov     r4, #0 ; r4 será um contador
       mov     r5, #0 ; r5 irá receber o resultado da multiplicação

       ;       ------------------------------------------------
       ;       Operações
       ;       Será realizada a operação de val1 * val 2
       ;       2 * 3 = 6
       ;       2 * 3 = 2 + 2 + 2 = 6

laco   add     r5, r5, r2 ; r5 = r5 + r2
       add     r4, r4, #1 ; r4 = r4 + 1 -> Contador é incrementado
       ;       r4 indica quantas vezes já somamos o val1
       cmp     r3, r4 ; Comparação entre os valores de r3 e r4 (r3 - r4)
       bgt     laco ; Confere se r4 é maior ou igual a r3
       end
