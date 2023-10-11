#############################################################################
#####################	Name: Ahmad Fahad Alzhrani 				#####################
#####################	ID: 	201917030			#####################
#####################	Section: 	53		#####################
#####################	Lab: 		3		#####################
#####################	Task: 		multuplying unsigned integer		#####################
##############################################################################

.data 
prompt1: .asciiz "Enter x: "
prompt2: .asciiz "y = "
.text
li $v0, 4
la $a0, prompt1
syscall
li $v0, 5
syscall

sll $t1, $v0, 5
sll $t2, $v0, 3
sra $t3, $v0, 2
sll $t5, $v0, 1

add $t4, $t1, $t2
add $t4, $t4, $t5
add $t4, $t4, $t3

li $v0, 4
la $a0, prompt2
syscall

li $v0, 1
add $a0, $0, $t4
syscall

li $v0, 10
syscall


