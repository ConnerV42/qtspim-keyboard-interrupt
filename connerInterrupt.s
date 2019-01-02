.data
inputChar: .space 4

.text

.globl start__

.globl main

start__:

lui $s0, 0xffff
lw $t6, 0($s0)

addi $t0 $t0, 2
sw $t0, 0($s0)

mfc0 $t0, $12
ori $t0, $t0, 0x0001
mtc0 $t0, $12

la $t0, inputChar
addi $t1, $t1, 'e'
sw $t1, 0($t0)

jal main


main:

lw $a0,($t0)
addi $v0, $0, 11
syscall

li $t2, 0xffff
jal delayloop

j main

delayloop:

beq $t2, $zero, main
addi $t2, $t2, -1
j delayloop

.kdata 

.ktext 0x80000180

getChar:

la $k0, inputChar
lui $k1,0xffff
addi $k1, $k1, 4 
lw $k1, 0($k1)
sw $k1, 0($k0)

return:
mtc0 $zero, $13
mfc0 $k0, $12
ori $k0, $k0, 0x1
mtc0 $k0, $12
eret





