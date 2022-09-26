.data
nums: .word 11, 2, 5269, 19, 624
numsize: .word 5
i: .word 0
val: .word 0

.text
main:
    j findNumbers
fin:
    j exit
findNumbers:
    la t0, i
    la t1, val
    la t2, numsize
    la t3, nums
    lw t0, 0(t0)
    lw t1, 0(t1)
    lw t2, 0(t2)
    li t0, 0
L1:
    bge t0, t2, L2
    slli t4, t0, 2
    add t4, t4, t3
    lw t4, 0(t4)
    jal ra calculate
cfin:
    li s1, 1
    and s0, s0, s1
    bne s0, zero, inc
    addi t1, t1, 1
inc:
    addi t0, t0, 1
    j L1
L2:
    j fin
calculate:
    li s0, 10
    li s1, 1
L3:
    blt t4, s0, L4
    addi s1, s1, 1
    slli s2, s0, 3
    slli s3, s0, 1
    add s0, s2, s3
    j L3
L4:
    mv s0, s1
    j cfin
exit:
    li a7, 10
    ecall
