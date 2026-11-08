.data
n:      .word 7
result: .word 0

.text
.globl main

main:
    lw $a0, n
    jal Fibonacci
    sw $v0, result

    li $v0, 10
    syscall

Fibonacci:
    li $t0, 1
    ble $a0, $t0, fib_base

    li $t1, 0
    li $t2, 1
    li $t3, 0
    addi $t4, $a0, -1

fib_loop:
    bge $t3, $t4, fib_done

    move $t5, $t2
    add $t2, $t1, $t2
    move $t1, $t5

    addi $t3, $t3, 1
    j fib_loop

fib_done:
    move $v0, $t2
    jr $ra

fib_base:
    move $v0, $a0
    jr $ra