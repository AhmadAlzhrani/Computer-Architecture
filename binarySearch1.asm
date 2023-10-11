.data

first: # sorted array of 32 bit words
.word 2, 3, 8, 10, 16, 21, 35, 42, 43, 50, 64, 69
.word 70, 77, 82, 83, 84, 90, 96, 99, 100, 105, 111, 120
last: # address just after sorted array
new: .asciiz "\n"

.text
.globl __start
__start:

# binary search in sorted array
# input: search value (needle) in $a0
# base address of array in $a1
# last address of array in $a2
# output: address of needle in $v0 if found,
# 0 in $v0 otherwise
li $a0, 121 # needle value
la $a1, first # address of first array entry
la $t1, last
subi $t1,$t1,4
move $a2, $t1 # address of last array entry
jal binsearch # perform binary search

li $v0, 1
move $a0, $t0
syscall

li $v0, 4
la $a0,new
syscall


la $t5,first
subu $t6, $t6,$t5
srl $t6,$t6, 2
li $v0, 1
move $a0, $t6
syscall

li $v0, 10
syscall



binsearch:
subu $sp, $sp, 4 # allocate 4 bytes on stack
sw $ra, 4($sp) # save return address on stack

subu $t0, $a2, $a1 # $t0 <- size of array
bnez $t0, search # if size > 0, continue search

move $v0, $a1 # address of only entry in array
lw $t0, ($v0) # load the entry
beq $a0, $t0, return # equal to needle value? yes => return
li $v0, 0 # no => needle not in array
b return # done, return
search:
sra $t0, $t0, 3 # compute offset of middle entry m:
sll $t0, $t0, 2 # $t0 <- ($t0 / 8) * 4
addu $v0, $a1, $t0 # compute address of middle entry m
lw $t0, ($v0) # $t0 <- middle entry m
move $t6, $v0
beq $a0, $t0, return # m = needle? yes => return
blt $a0, $t0, go_left # needle less than m? yes =>
# search continues left of m
go_right:
addu $a1, $v0, 4 # search continues right of m
jal binsearch # recursive call
b return # done, return
go_left:
move $a2, $v0 # search continues left of m
jal binsearch # recursive call
return:
lw $ra, 4($sp) # recover return address from stack
addu $sp, $sp, 4 # release 4 bytes on stack

jr $ra