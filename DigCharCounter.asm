.data 
filename: .asciiz "input.txt"
filecontents: .space 1000
ev: .asciiz "Even-digit count = "
od: .asciiz "Odd-digit count = "
t: .asciiz "Total digit count = "
m1: .asciiz "Letter Count"
sp: .asciiz "       "
new: .asciiz "\n"
er: .asciiz "ERROR: the file is not found"

.text

li $v0, 13  # oppening the file 
la $a0, filename
li $a1, 0
syscall
move $s3, $v0

blt $s3, 0, error

li $v0,4     # label for the count
la $a0, m1
syscall
li $v0, 4
la $a0, new   # new line 
syscall

li $v0, 14          # reading the file only
move $a0, $s3
la $a1, filecontents
li $a2, 1000
syscall

li $t2, 0x41     # the large loop ti iterate the alphapets
gloop:
li $t3, 0
li $t4, 0
li $t5, 0
beq $t2,0x5b, endgloop

li $t0,999              #the address of the array
la $s0, filecontents

loop:               # the small loop for the array
lb $s1, 0($s0)

beqz $t0, endloop

beq $s1, $t2, letter
addiu $s4, $t2, 32
beq $s1, $s4, letter       # checking if it is letters or numbers

addiu $s0, $s0,1
subiu $t0, $t0, 1   # iteration of the loop

j loop

letter: 
addiu $t3,$t3,1
addiu $s0, $s0,1       #counting the letters
subiu $t0, $t0, 1
j loop

endloop:
li $v0, 11
move $a0, $t2
syscall             # printing the number of letters
li $v0, 4
la $a0, sp
syscall
li $v0, 1
move $a0, $t3
syscall
li $v0, 4
la $a0, new
syscall

addiu $t2, $t2, 1
j gloop

endgloop:  #ending the large loop

li $t0,999
la $s0, filecontents
loop2:
lb $s1, 0($s0)
			# the 2nd loop for the digits
beqz $t0, endloop2

beq $s1, 0x30, even
beq $s1, 0x31, odd
beq $s1, 0x32, even
beq $s1, 0x33, odd      # checking the digits and branching
beq $s1, 0x34, even
beq $s1, 0x35, odd
beq $s1, 0x36, even
beq $s1, 0x37, odd
beq $s1, 0x38, even
beq $s1, 0x39, odd

addiu $s0, $s0,1
subiu $t0, $t0,1
j loop2
even:
addiu $s0, $s0,1
subiu $t0, $t0,1   # the branches 
addiu $t4, $t4,1
j loop2

odd:
addiu $s0, $s0,1
subiu $t0, $t0,1
addiu $t5, $t5,1
j loop2

endloop2:

li $v0, 4
la $a0, ev 
syscall
li $v0, 1
move $a0, $t4
syscall
li $v0, 4
la $a0, new
syscall
			#printing the type of the digits 
li $v0, 4
la $a0, od
syscall
li $v0, 1
move $a0, $t5
syscall
li $v0, 4
la $a0, new
syscall

li $v0, 4
la $a0, t
syscall

addu $a0, $t4, $t5
li $v0, 1
syscall

li $v0, 10
syscall

error:
li $v0, 4
la $a0, er  # if the file is not found 
syscall

li $v0, 10
syscall