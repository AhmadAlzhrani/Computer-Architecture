.data
Test: .byte 0xA5 , 0xDD , 0x66 , 0x36 , 0x45 , 0x18 , 0x65 , 0x75
Result: .space 8
.text 
li $t0, 0 #iteration

li, $s0,0
li, $s1,1 # initialize the 1 and 0 to print it

loop:

la $t1, Test #the address of the list

beq $t0, 8, endloop # loop condition
add $t1, $t1, $t0 # iteration of the list
lb $t2, 0($t1) #the array element

# the check for the bit 
srl $t3, $t2, 7              #shift each bit to the leftmost place and chick if the bits is paindrome
andi $t3, $t3, 0x01

srl $t4, $t2, 0
andi $t4, $t4, 0x01

bne  $t3, $t4, notpali

#bits check
srl $t3, $t2, 6
andi $t3, $t3, 0x01

srl $t4, $t2, 1
andi $t4, $t4, 0x01

bne  $t3, $t4, notpali

#bits check
srl $t3, $t2, 5
andi $t3, $t3, 0x01	# checking the bits if it is equall or not by using shifting and anding 

srl $t4, $t2, 2
andi $t4, $t4, 0x01

bne  $t3, $t4, notpali

#bits check
srl $t3, $t2, 4
andi $t3, $t3, 0x01

srl $t4, $t2, 3
andi $t4, $t4, 0x01

bne  $t3, $t4, notpali

#change to 1 to print if palindrome
la $t5, Result
add $t5, $t5, $t0
sb $s1, 0($t5)

j print

notpali: # if not palindrome
la $t5, Result
add $t5, $t5, $t0
sb $s0, 0($t5)
j print

print: #printing the output list
li $v0, 1
lb $a0, 0($t5)
syscall
addi $t0,$t0,1
j loop

endloop:

li, $v0,10 #closing the program
syscall


