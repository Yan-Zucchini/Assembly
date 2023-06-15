.data
msg: .asciiz "Digite dois numeros para serem divididos: \n"
resp: .asciiz "A divisão dois numeros é: "
result: .word 0
.text
.globl main 
main:
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5
    syscall

    move $t0, $v0

    li $v0 5
    syscall

    move $t1, $v0

    div $t2, $t0, $t1
    la $t3, result
    sw $t2, 0($t3)

    li $v0, 4
    la $a0, resp
    syscall

    li $v0, 1
    lw $a0, result
    syscall

    li $v0, 10
    syscall



