.data

new: .asciiz "\n"
ask: .asciiz "Enter the size of the array: "
index: .asciiz "The index of the value is: "
nof: .asciiz "The value wanted is not in the array and the index the key can be inserted insted of the value in it is: "
nums: .asciiz "Enter value of index "
two: .asciiz ": "
list: .asciiz "The list: "
s: .asciiz " "
prompt: .asciiz "Enter the wanted value: "


.text
.globl __start
__start:

li $v0,4
la $a0, ask
syscall
li $v0, 5
syscall
move $t3,$v0 # $v0 - the array size

li $v0, 9
move $a0, $t3
syscall
move $t7, $v0  # $t7 - the address of the array

#loop1
li $t4, 0
move $t8, $t7
loop:
beq $t3,$t4,endloop
li $v0, 4
la $a0, nums
syscall
li $v0, 1
move $a0,$t4               # loop to read the values
syscall
li $v0,4
la $a0, two
syscall
li $v0, 5
syscall

sw $v0,0($t8)
add $t4,$t4,1
add $t8,$t8,4
j loop
endloop: # $t8 - the last index of the array

##############

#loop2
li $v0, 4
la $a0, list
syscall

move $t4, $t7
loop2:
beq $t8,$t4,endloop2

lw $a0,0($t4)            #loop to load the values from the memory and print it 

li $v0, 1
syscall

li $v0,4
la $a0, s
syscall

add $t4,$t4,4
j loop2
endloop2:
li $v0, 4
la $a0, new 
syscall



# binary search in sorted array
# input: search value in $a0
# base address of array in $a1
# last address of array in $a2
li $v0, 4
la $a0, prompt
syscall
li $v0, 5
syscall
move $a0, $v0


move $a1,$t7 
addi $t1,$t8,4
#la $t1, last
subi $t1,$t1,4
move $a2, $t1 # address of last array entry
jal binsearch # binary search

beq $t0, $a0, found

li $v0, 4
la $a0, nof
syscall
j finale


found:      # if the value in the array 
li $v0, 4
la $a0, index
syscall

finale:       # printing the index and terminating the program 
#li $v0, 1
#move $a0, $t0
#syscall

li $v0, 4
la $a0,s
syscall


#la $t5,first
move $t5, $t7        # printing the index of the value 
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

subu $t0, $a2, $a1 # $t0 - size of array
bnez $t0, search # if size > 0, continue search

move $v0, $a1 # address of only entry in array
lw $t0, ($v0) # load the entry
#move $t6, $v0
beq $a0, $t0, return # equal to the value? yes => return
li $v0, 0 # no => value not in array
b return # done, return
search:
sra $t0, $t0, 3 # compute offset of middle entry m:
sll $t0, $t0, 2 
addu $v0, $a1, $t0 # compute address of middle entry m
lw $t0, ($v0) 
move $t6, $v0
beq $a0, $t0, return # m = the value? yes => return
blt $a0, $t0, go_left # the value less than m? yes =>
# search continues left of m
go_right:
addu $a1, $v0, 4 # search continues right of m
jal binsearch # recursive call
b return # done, return
go_left:
move $a2, $v0 # search continues left of m
jal binsearch # recursive call
return:
lw $ra, 4($sp) # return address from stack
addu $sp, $sp, 4 # release 4 bytes on stack

jr $ra
