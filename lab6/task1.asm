#############################################################################
#####################	Name: Ahmad Alzhrani		#####################
#####################	ID: 	201917030		#####################
#####################	Section: 	53		#####################
#####################	Lab: 		6		#####################
#####################	Task: 		1		#####################
##############################################################################

.data 
label: .asciiz "Enter Withdrawal amount: "
a500: .asciiz "\n 500 Bank note: "
a100: .asciiz "\n 100 Bank note: "
a10: .asciiz  "\n 10  Bank note: "
a1: .asciiz   "\n 1   Bank note: "

.text

li $v0, 4
la $a0, label
syscall

li $v0, 5
syscall

move $t0, $v0

div $t0,$t0, 500
mflo $t1
mfhi $t0

div $t0,$t0, 100
mflo $t2
mfhi $t0

div $t0,$t0, 10
mflo $t3
mfhi $t0

div $t0,$t0, 10
mfhi $t4
mfhi $t0


li $v0, 4
la $a0, a500
syscall
li $v0, 1 
move $a0, $t1
syscall


li $v0, 4
la $a0, a100
syscall
li $v0, 1 
move $a0, $t2
syscall


li $v0, 4
la $a0, a10
syscall
li $v0, 1 
move $a0, $t3
syscall


li $v0, 4
la $a0, a1
syscall
li $v0, 1 
move $a0, $t4
syscall


li $v0, 10
syscall
