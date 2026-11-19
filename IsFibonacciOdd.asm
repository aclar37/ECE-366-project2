.data
n:      .word 7
result: .word 0

.text
.globl main

main:
    lw   $a0, n
    jal  Fibonacci

    move $a0, $v0
    jal  IsOdd

    sw   $v0, result

    li   $v0, 10
    syscall

Fibonacci:
    li   $t0, 1
    ble  $a0, $t0, fib_base

    li   $t1, 0
    li   $t2, 1
    li   $t3, 0
    addi $t4, $a0, -1

fib_loop:
    bge  $t3, $t4, fib_done

    move $t5, $t2
    add  $t2, $t1, $t2
    move $t1, $t5

    addi $t3, $t3, 1
    j    fib_loop

fib_done:
    move $v0, $t2
    jr   $ra

fib_base:
    move $v0, $a0
    jr   $ra

IsOdd:
    addi $sp, $sp, -8
    sw   $ra, 4($sp)
    sw   $a0, 0($sp)

    li   $a1, 2
    jal  division

    beq  $v0, $zero, even_case

    li   $v0, 1
    j    isodd_done

even_case:
    li   $v0, 0

isodd_done:
    lw   $ra, 4($sp)
    lw   $a0, 0($sp)
    addi $sp, $sp, 8
    jr   $ra

division:
    li   $t0, 0

div_loop:
    blt  $a0, $a1, div_done
    sub  $a0, $a0, $a1
    addi $t0, $t0, 1
    j    div_loop

div_done:
    move $v0, $a0
    jr   $ra
