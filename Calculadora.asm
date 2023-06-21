.data
ola: .asciiz "Bem vindo a nossa calculadora em Assembly MIPS, Escolha uma das opções abaixo para começar:\n"
menu: .asciiz "\n A: adicao \n S: subtracao \n M: multiplicacao \n D: divisao \n P: potência\n X: encerra o programa \n"
warning: .asciiz "Escolha um caractere válido\n\n"
linha_vazia: .asciiz "\n\n"
adicao_text: .asciiz "Escolha os dois numeros que serão somados: \n"
divisao_text: .asciiz "Escolha o dividendo e o divisor respectivamente \n"
subtracao_text: .asciiz "Escolha os dois numeros que serão subtraidos\n"
multiplicacao_text: .asciiz "Escolha os dois numeros que serão multiplicados\n"
potencia_text: .asciiz "Escolha a base e o expoente\n"
excecao: .asciiz "Não é possivel realizar divisão por zero, informe novamente o divisor\n"
result: .asciiz "O resultado da operação é: "

.text
.globl main
main:

    # Mensagem de boas vindas
    li $v0, 4
    la $a0, ola
    syscall

    j loop 
    
    loop:
        
        # Mostra o menu na tela
        li $v0, 4
        la $a0, menu
        syscall

        # Le um caracter digitado pelo usuário
        li $v0, 12
        syscall
        
        # Move esse caracter lido para o registrador $t0
        move $t0, $v0       

        # Checa qual opção o usuário escolheu e o desvia para a função correta
        beq $t0, 'X', end
        beq $t0, 'x', end

        beq $t0, 'A', adicao
        beq $t0, 'a', adicao

        beq $t0, 'S', subtracao
        beq $t0, 's', subtracao

        beq $t0, 'M', multiplicacao
        beq $t0, 'm', multiplicacao

        beq $t0, 'D', divisao
        beq $t0, 'd', divisao

        beq $t0, 'P', potencia
        beq $t0, 'p', potencia
        
        # Mensagem de aviso caso o usuário nao escolha uma opçao correta
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
            li $v0, 4
            la $a0, subtracao_text
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

            # Realiza a subtração
            sub $t3, $t1, $t2

            # Move o resultado da subtração para $a0
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
            
            

        multiplicacao:
            # Mostra a mesagem pro usuário 
            li $v0, 4
            la $a0, multiplicacao_text
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

            # Realiza a multiplicação
            mul $t3, $t1, $t2

            # Move o resultado da multiplicação para $a0
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

            catch: 
                # Lê o segundo numero digitado
                li $v0, 5
                syscall

                # Move o segundo numero para $t2
                move $t2, $v0

                # Se $t2 for igual a zero desvia para a função de erro
                beqz $t2, err

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
            li $v0, 4
            la $a0, potencia_text
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

            # Declara os valores necessários para a execução da potência e do loop respectivamente
            li $t3, 1
            li $t4, 0
            

            while:
                # Controla o laço
                beq $t4, $t2, saida
                addi $t4, $t4, 1

                #realiza a multiplicação
                mul $t3, $t3, $t1
                j while

            saida: 
                # mostra o resultado
                li $v0, 1
                move $a0, $t3
                syscall

                j loop

            # Imprime uma linha vazia
            li $v0, 4
            la $a0, linha_vazia
            syscall

            # retorna para o começo do laço
            j loop

            err: 
                # Pede para o usuário digitar o divisor novamente
                li $v0, 4
                la $a0, excecao
                syscall

                j catch
           

        end: 
        # Encerra o programa
        li $v0, 10
        syscall





        
    

