.data
msg: .asciiz "Digite dois numeros para serem somados: \n"
resp: .asciiz "A soma dos numeros é: "
result: .word 0
.text
.globl main 
main:
	li $v0, 4 
	la $a0, msg # Mostrar o texto da variavel msg
	syscall
	
    li $v0, 5 # Ler um número inteiro
	syscall 

	move $t0, $v0 # armazenar o numero lido em um registrador

	li $v0, 5 # Ler o segundo numero digitado
	syscall 

	move $t1, $v0 # armazenar o 2 número em um registrador 

	add	$t2, $t0, $t1 #realizar a soma
	la $t3, result #armazena o enderesso da variavel result em t3
	sw $t2, 0($t3) # envia o valor da soma para t3

	li $v0, 4
	la $a0, resp # Mostrar o texto da variavel resp
	syscall
	
	li $v0, 1
	lw $a0, result # Mostrar o valor da soma armazenado na variavel result 
	syscall 

	li $v0, 10
	syscall