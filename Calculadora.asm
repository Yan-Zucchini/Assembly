.data
ola: .asciiz "Bem vindo a nossa calculadora em Assembly MIPS, Escolha uma das opções abaixo para começar:\n"
menu: .asciiz "\n A: adicao \n S: subtracao \n M: multiplicacao \n D: divisao \n X: encerra o programa \n"
warning: .asciiz "Escolha um caractere válido\n\n"
linha_vazia: .asciiz "\n\n"
adicao_text: .asciiz "Escolha os dois numeros que serão somados: \n"
divisao_text: .asciiz "Escolha os dois numeros para que seja feita a divisão \n"
result: .asciiz "O resultado da operação é: "

.text
.globl main
main:

    li $v0, 4
    la $a0, ola
    syscall

    j loop 
    
    loop:
        li $v0, 4
        la $a0, menu
        syscall

        li $v0, 12
        syscall
        
        move $t0, $v0       

        beq $t0, 'X', end
        beq $t0, 'x', end

        beq $t0, 'A', adicao
        beq $t0, 'a', adicao

        beq $t0, 'M', multiplicacao
        beq $t0, 'm', multiplicacao

        beq $t0, 'D', divisao
        beq $t0, 'd', divisao

        beq $t0, 'P', potencia
        beq $t0, 'p', potencia
        

        li $v0, 4
        la $a0, warning
        syscall

        j loop

        adicao:
            # Mostra a mesagem pro usuário 
            li $v0, 4
            la $a0, adicao_text
            syscall
            
            # Lê o primeiro número digitado
            li $v0, 5
            syscall

            # Move o primeiro numero para $t1
            move $t1, $v0

            # Lê o segundo numero digitado
            li $v0, 5
            syscall

            # Move o segundo numero para $t2
            move $t2, $v0

            # Mostra a mensgem de resultado
            li $v0, 4
            la $a0, result
            syscall

            # Realiza a soma
            add $t3, $t1, $t2

            # Move o resultado da soma para $a0
            move $a0, $t3

            # Mostra o resultado 
            li $v0, 1
            syscall

            # Imprime uma linha vazia
            li $v0, 4
            la $a0, linha_vazia
            syscall

            #retorna para o começo do laço
            j loop

        subtracao:
            # Mostra a mesagem pro usuário 

            # Lê o primeiro número digitado

            # Move o primeiro numero para $t1

            # Lê o segundo numero digitado

            # Move o segundo numero para $t2

            # Mostra a mensgem de resultado

            # Realiza a subtração

            # Move o resultado da subtração para $a0

            # Mostra o resultado 

            # Imprime uma linha vazia

            # retorna para o começo do laço
            j loop
            
            

        multiplicacao:
            # Mostra a mesagem pro usuário 

            # Lê o primeiro número digitado

            # Move o primeiro numero para $t1

            # Lê o segundo numero digitado

            # Move o segundo numero para $t2

            # Mostra a mensgem de resultado

            # Realiza a multiplicação

            # Move o resultado da multiplicação para $a0

            # Mostra o resultado 

            # Imprime uma linha vazia

            # retorna para o começo do laço
            j loop
            

        divisao:
            # Mostra a mesagem pro usuário 
            li $v0, 4
            la $a0, divisao_text
            syscall
            
            # Lê o primeiro número digitado
            li $v0, 5
            syscall

            # Move o primeiro numero para $t1
            move $t1, $v0

            # Lê o segundo numero digitado
            li $v0, 5
            syscall

            # Move o segundo numero para $t2
            move $t2, $v0

            # Mostra a mensgem de resultado
            li $v0, 4
            la $a0, result
            syscall

            # Realiza a divisão
            div $t3, $t1, $t2

            # Move o resultado da divisão para $a0
            move $a0, $t3

            # Mostra o resultado 
            li $v0, 1
            syscall

            # Imprime uma linha vazia
            li $v0, 4
            la $a0, linha_vazia
            syscall

            #retorna para o começo do laço
            j loop


        potencia:
            # Mostra a mesagem pro usuário 

            # Lê o primeiro número digitado

            # Move o primeiro numero para $t1

            # Lê o segundo numero digitado

            # Move o segundo numero para $t2

            # Mostra a mensgem de resultado

            # Realiza a potência

            # Move o resultado da potência para $a0

            # Mostra o resultado 

            # Imprime uma linha vazia

            # retorna para o começo do laço
            j loop
           

        end: 
        li $v0, 10
        syscall





        
    

