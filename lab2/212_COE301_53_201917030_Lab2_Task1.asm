#############################################################################
#####################	Name: 	Ahmad Fahad Alzhrani				#####################
#####################	ID: 	201917030					#####################
#####################	Section: 	53					#####################
#####################	Lab: 		2					#####################
#####################	Task: 		1 (arithmatic operations on the inputs)	#####################
##############################################################################
.data

prompt1: .asciiz "Enter a: "
prompt2: .asciiz "Enter b: "
prompt3: .asciiz "Enter c: "
result: .asciiz "z = "

.text

li $v0, 4
la $a0, prompt1
syscall
li  $v0, 5
syscall

move $s0, $v0 

li $v0, 4
la $a0, prompt2
syscall
li  $v0, 5
syscall

move $s1, $v0

li $v0, 4
la $a0, prompt3
syscall
li  $v0, 5
syscall

move $s2, $v0

add $s3, $s0, $s0
add $s3, $s3, $s3
add $s3, $s3, $s0

add $s4, $s1, $s1
add $s4, $s4, $s1

add $s2, $s2, $s2

sub $s5, $s3, $s4
subi $s6, $s2, 15
sub $s7, $s5, $s6

li $v0, 4
la $a0, result 
syscall

addi $v0, $zero, 1
move $a0, $s7
syscall

li $v0, 10
syscall
