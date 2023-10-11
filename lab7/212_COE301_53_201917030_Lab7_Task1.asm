.data
ent: .asciiz "Enter Integer "
two: .asciiz ": "
result: .asciiz "Integer reversed = "
new: .asciiz " "


.text
jal f
li $v0,10
syscall

f: addiu $sp, $sp, -44 # allocate stack frame = 44 bytes 
sw $ra, 40($sp) # save $ra on the stack 
move $a0, $sp # $a0 = address of array on the stack 
li $a1, 10 # $a1 = 10 
jal read # call function read 
move $a0, $sp # $a0 = address of array on the stack 
li $a1, 10 # $a1 = 10 
jal reverse # call function reverse 
move $a0, $sp # $a0 = address of array on the stack 
li $a1, 10 # $a1 = 10 
jal print # call function print 
lw $ra, 40($sp) # load $ra from the stack 
addiu $sp, $sp, 44 # Free stack frame = 44 bytes 
jr $ra # return to caller


read: 

move $t0,$a0 # the address of the array
move $t1, $a1 #the array size 
addi $t1,$t1,1

li $t3, 1
loop:

beq $t3,$t1,endloop

li $v0, 4
la $a0, ent
syscall
li $v0, 1
move $a0,$t3
syscall
li $v0,4
la $a0, two
syscall
li $v0, 5
syscall

sw $v0,0($t0)

add $t3,$t3,1
add $t0,$t0,4

j loop

endloop:
jr $ra

reverse:
li $a2, 1
jr $ra

print:
move $t0, $a0
li $t6,4
beqz $a2, noRev
move $t9,$a1
sll $t9,$t9,2
sub $t9,$t9,4
add $t0, $t0,$t9
li $t6, -4
noRev:

li $t1,0

li $v0,4
la $a0,result
syscall


loop2:
beq $t1,$a1,endloop2

lw $a0,0($t0)
li $v0,1
syscall
li $v0, 4
la $a0, new
syscall

add $t0,$t0,$t6
add $t1,$t1,1
j loop2

endloop2:
jr $ra