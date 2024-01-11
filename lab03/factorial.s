.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

# =============  Iterate version =============

factorial:
    # YOUR CODE HERE
    addi t0, x0, 1 # result
    addi t1, x0, 1 # counter

loop:
    blt a0, t1, end
    mul t0, t0, t1
    addi t1, t1, 1
    j loop

end:
    mv a0, t0
    jr ra

# =============  Recursive version =============

factorial:
    addi s1, x0, 1
    beq a0, s1, exit
    addi sp, sp, -8
    sw ra, 4(sp)
    sw a0, 0(sp)
    addi a0, a0, -1
    jal factorial; # call factorial(n - 1)
    lw ra, 4(sp)
    lw, t0, 0(sp)
    addi sp, sp, 8
    mul a0, a0, t0
    jr ra

exit:
    ret

