#############################################################################
#####################	Name: Ahmad Alzhrani		#####################
#####################	ID: 	201917030		#####################
#####################	Section: 	53		#####################
#####################	Lab: 		6		#####################
#####################	Task: 		2		#####################
##############################################################################

.data

label: .asciiz "Enter n: "
result: .asciiz "n! = "


.text

li $v0, 4
la $a0, label
syscall

li $v0, 5
syscall
move $t0, $v0

li $t1,1
multu $t1,$t0

loop:
beq $t0,1, endloop

mflo $s0

subi $t0,$t0,1
multu $t0, $s0
j loop

endloop:

li $v0, 4
la $a0, result
syscall

li $v0, 1
mflo $a0
syscall

li $v0, 10
syscall 