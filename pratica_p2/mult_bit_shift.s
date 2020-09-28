       ;       Organizacao de multiplicadores
       ;       Operação de multiplicação com arquitetura ARM
       ;       Operação de multiplicação identificando as potencias de 2
       ;       Autor: Luigi Luz
       ;       Data: 26/09/2020

       ;       ------------------------------------------------
       ;       Definimos os valores que serão multiplicados
val1   dcd     0x00000002
val2   dcd     0x00000005
       ;       Será realizada a operação de val1 * val 2

       ;       ------------------------------------------------
       ;       Carregamos os endereços dos valores a serem multiplicados nos registradores
       mov     r0, #val1 ; r0 vai receber o valor de val1
       mov     r1, #val2 ; r1 vai receber o valor de val2
       ;       Carregamos os valores guardados nos respectivos endereços
       ldr     r2, [r0] ; Carrego o valor guardado em r0
       ldr     r3, [r1] ; Carrego o valor guardado em r1

       ;       ------------------------------------------------
       ;       Definindo os registradores auxiliares
       mov     r4, #1 ; r4 será o identificador de potência de 2
       mov     r5, #0 ; r5 será o contador para indicar o final da multiplicação

       ;       ------------------------------------------------
       ;
       ;       Operações
loop   lsl     r6, r4, r5 ; Desloco r4 em r5 bits pra esquerda
       tst     r3, r6 ; Bitwise AND de r3 com r6, se o resultado for diferente de zero,
       ;       significa que uma potência de 2 foi identificada
       bne     mult ; Confere se o resultado do bitwse foi diferente de zero

       ;       ------------------------------------------------
       ;       Loop do contador
count  add     r5, r5, #1 ; O contador é incrementado em 1
       cmp     r5, #15 ; Compara o valor do contador com 15 (pelo fato de termos 16 bits)
       blt     loop ; Se o contador for menor, o loop é executado novamente

       end

       ;       ------------------------------------------------
       ;       Operação de multiplciação
mult   lsl     r7, r2, r5 ; r7 <= r2 << r5 = r0 * 2^r5
       ;       Realiza a multiplicação pela potência de 2
       add     r8, r8, r7 ; r8 <= r8 + r7
       ;       Soma o resultado das operações aos resultados anteriores
       b       count ; Volta para a etapa do contador