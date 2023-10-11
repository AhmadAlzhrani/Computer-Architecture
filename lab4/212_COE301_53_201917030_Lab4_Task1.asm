#############################################################################
#####################	Name: 	ahmad fahad		#####################
#####################	ID: 		201917030	#####################
#####################	Section: 	53		#####################
#####################	Lab: 		4		#####################
#####################	Task: 	checking the number type#####################
##############################################################################
.data
prompt1: .asciiz "Enter a: "
prompt2: .asciiz "Your number is a positive odd number"
prompt3: .asciiz "Your number is a positive even number"
prompt4: .asciiz "Your number is a negative even number"
prompt5: .asciiz "Your number is a negative odd number"
prompt6: .asciiz "You entered zero!"

.text

li $v0, 4
la $a0, prompt1
syscall
li $v0, 5
syscall

beq $v0, $0, label1
bltz $v0, label2
bgtz $v0, label3


label1: la $a0, prompt6
j exit

label2: sll $v0, $v0, 31
beq $v0, $0, label21
la $a0, prompt5
j exit

label21:
la $a0, prompt4
j exit 

label3: sll $v0, $v0, 31
beq $v0, $0, label31
la $a0, prompt2
j exit

label31:
la $a0, prompt3
j exit 

exit: li $v0, 4
syscall

li $v0, 10
syscall