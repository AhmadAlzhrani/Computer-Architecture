#############################################################################
#####################	Name: Ahmad Fahad Alzhrani 				#####################
#####################	ID: 	201917030			#####################
#####################	Section: 	53		#####################
#####################	Lab: 		3		#####################
#####################	Task: 		flipping specific bits in integer		#####################
##############################################################################

.data 
prompt1: .asciiz "Enter a: "
prompt2: .asciiz "Result = "
.text
li $v0, 4
la $a0, prompt1
syscall
li $v0, 5
syscall

lui  $t1, 0x0010
or $t1, 0x0200
or  $t1, $v0, $t1

li $v0, 4
la $a0, prompt2
syscall

li $v0, 1
add $a0, $0, $t1
syscall

li $v0, 10
syscall