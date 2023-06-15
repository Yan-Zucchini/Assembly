.data
msg: .asciiz "Digite dois numeros para serem divididos: \n"
resp: .asciiz "A divisão dois numeros é: "
result: .word 0
.text
.globl main 
main:
    li $v0, 4
    la $a0, msg #mostra o conteudo da variavel msg
    syscall

    li $v0, 5 #le o primeiro numero
    syscall

    move $t0, $v0 #armazena o primeiro numero no registrador $t0

    li $v0 5 #le o segundo numero
    syscall

    move $t1, $v0 # armazena o segundo numero no registrador $t1

    div $t2, $t0, $t1 # realiza a divisão 
    la $t3, result 
    sw $t2, 0($t3) # coloca o resultado da divisão em $t3

    li $v0, 4
    la $a0, resp #mostra o conteúdo da variavel resp
    syscall

    li $v0, 1
    lw $a0, result #mostra o contéudo de result
    syscall

    li $v0, 10
    syscall



