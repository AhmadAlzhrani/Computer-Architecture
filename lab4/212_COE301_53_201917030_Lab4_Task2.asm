#############################################################################
#####################	Name: 	ahmad fahad		#####################
#####################	ID: 		201917030	#####################
#####################	Section: 	53		#####################
#####################	Lab: 		4		#####################
#####################	Task: 	adding using loop	#####################
##############################################################################
.data
prompt1: .asciiz "Enter integer "
prompt2: .asciiz ": "
prompt3: .asciiz "Sum = "

.text

li $t0, -1
loop:
beq $t0, 4, end
addi $t0, $t0, 1
li $v0, 4
la $a0, prompt1
syscall
li $v0, 1
add $a0,$t0,$0
syscall
li $v0, 4
la $a0, prompt2
syscall

li $v0, 5
syscall
add $t1, $t1, $v0

j loop 

end:li $v0, 4
la $a0, prompt3
syscall
li $v0, 1
la $a0, ($t1)
syscall

li $v0, 10
syscall