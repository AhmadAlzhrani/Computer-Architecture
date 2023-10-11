.data 
filename: .space 50
filecontents: .space 100
array: .word 0:20
m1: .asciiz "Enter filename: "
m2: .asciiz "Integer array reversed = "

.text

li $v0,4
la $a0, m1
syscall

li $v0, 8
la $a0, filename
li $a1, 50
syscall


loop:
lb $t0, 0($a0)
beq $t0, '\n', endloop
addi $a0, $a0, 1
j loop
endloop:
lb $t8, 0($a0)
and $t8, 0x00
sb $t8, 0($a0)


li $v0, 13
la $a0, filename
li $a1, 0
syscall
move $s0, $v0


li $v0, 14
move $a0, $s0
la $a1, filecontents
li $a2, 100
syscall

#li $v0, 4
#la $a0, filecontents
#syscall



li $t1, 0
la $t9, filecontents
la $t6, array
addi $t9,$t9,99
loop2:

beq $t1, 99, endloop2
addi $t1, $t1, 1
subi $t9,$t9,1

lb $t7, 0($t9)

ble $t7,0x30,loop2
bge $t7,0x39,loop2

li $v0, 4
move $a0, $t9
syscall
j loop2

endloop2:


li $v0, 10
syscall