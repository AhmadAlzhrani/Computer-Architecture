#############################################################################
#####################	Name: 	Ahmad Fahad Alzhrani				#####################
#####################	ID: 	201917030					#####################
#####################	Section: 	53					#####################
#####################	Lab: 		2					#####################
#####################	Task: 		2 (reading and printing strings)	#####################
##############################################################################
.data

prompt1: .asciiz "Enter your name: "
prompt2: .asciiz "Welcome to MIPS Assembly, "
name: .space 30 

.text

li $v0, 4
la $a0, prompt1
syscall

li $v0, 8
la $a0, name
addi $a1,$a1,30
syscall

li $v0, 4
la $a0, prompt2
syscall

li $v0, 4
la $a0, name
syscall


li $v0, 10
syscall
