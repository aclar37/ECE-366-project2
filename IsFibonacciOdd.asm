.data
n:      .word 7                    # input non-negative int n
result: .word 0                    # output 1 if Fibonacci(n) is odd, 0 if even

.text
.globl main

main:
    lw   $a0, n                    # load n
    jal  Fibonacci                 # $v0 = Fibonacci (n) 

    move $a0, $v0
    jal  IsOdd                     # $v0 = 1 if odd, 0 if even

    sw   $v0, result

    li   $v0, 10
    syscall
# Fibonacci(n) computation
Fibonacci:
    li   $t0, 1
    ble  $a0, $t0, fib_base        # Return n if n <= 1

    li   $t1, 0                    # F(0)
    li   $t2, 1                    # F(1)
    li   $t3, 0                    # loop
    addi $t4, $a0, -1

fib_loop:
    bge  $t3, $t4, fib_done

    move $t5, $t2                  # Pass forward fib pair
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
# Check if $a0 is odd ($v0 = 1 if odd, 0 if even)
IsOdd:
    addi $sp, $sp, -8              # Save to stack
    sw   $ra, 4($sp)
    sw   $a0, 0($sp)

    li   $a1, 2
    jal  division                  # $v0 = $a0 % 2

    beq  $v0, $zero, even_case

    li   $v0, 1                    # odd
    j    isodd_done

even_case:
    li   $v0, 0                    # even

isodd_done:
    lw   $ra, 4($sp)               # restore stack
    lw   $a0, 0($sp)
    addi $sp, $sp, 8
    jr   $ra
# division by repeated subtraction 
division:
    li   $t0, 0

div_loop:
    blt  $a0, $a1, div_done
    sub  $a0, $a0, $a1
    addi $t0, $t0, 1
    j    div_loop

div_done:
    move $v0, $a0                  # return remainder          
    jr   $ra
