.data
arr1: .word 11, 2, 52, 14, 62
arr2: .word 95, 8711, 26, 6
arr3: .word 19, 137, 55
size1: .word 5
size2: .word 4
size3: .word 3
startline: .string "The array has "
endline: .string " even numbers.\n"

.text
main:
    la a0, arr1 # a0=arr
    la a1, size1
    lw a1, 0(a1) # a1=size1
    jal ra, findNumbers
    jal ra, print
    la a0, arr2 # a0=arr
    la a1, size2
    lw a1, 0(a1) # a1=size2
    jal ra, findNumbers
    jal ra, print
    la a0, arr3 # a0=arr
    la a1, size3
    lw a1, 0(a1) # a1=size3
    jal ra, findNumbers
    jal ra, print
    j exit
findNumbers:
    li t0, 0 # val=0
    li t1, 0 # i=0
FLOOP:
    bge t1, a1, FEND #i>=arrsize
    slli t2, t1, 2 # t2=i*4
    add t2, a0, t2 # t2=arr+i
    lw t2, 0(t2) #t2=arr[i]
    addi sp, sp, -20
    sw ra, 16(sp) # save ra
    sw a0, 12(sp) # save a0
    sw t0, 8(sp) # save t0
    sw t1, 4(sp) # save t1
    sw t2, 0(sp) # save t2
    mv a0, t2 # a0=arr[i]
    jal ra, calculate # do calculate function
    lw t2, 0(sp) # load t2
    lw t1, 4(sp) # load t1
    lw t0, 8(sp) # load t0
    lw a0, 12(sp) # load a0
    lw ra, 16(sp) # load ra
    addi sp, sp, 20
    andi t3, s0, 1 # and(s0,1)
    bne t3, zero, IFEND
    addi t0, t0, 1 # val=val+1
IFEND:
    addi t1, t1, 1 # i=i+1
    j FLOOP
FEND:
    mv s1, t0 # s1=val
    ret
calculate:
    li t0, 10 # base=10
    li t1, 1 # digit=1
WLOOP:
    blt a0, t0, WEND
    addi t1, t1, 1 # digit=digit+1
    slli t2, t0, 1 # t2=base<<1
    slli t0, t0, 3 # t0=base<<3
    add t0, t0, t2 # t0=base<<3+base<<1
    j WLOOP
WEND:
    mv s0, t1
    ret
print:
    la a0, startline
    li a7, 4
    ecall
    mv a0, s1
    li a7, 1
    ecall
    la a0, endline
    li a7, 4
    ecall
    ret
exit:
    li a7, 10
    ecall
