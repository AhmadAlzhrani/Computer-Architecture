#############################################################################
#####################	Name: 	Ahmad Fahad Alzhrani	#####################
#####################	ID: 		201917030	#####################
#####################	Section: 	53		#####################
#####################	Lab: 		8		#####################
#####################	Task: 		1		#####################
##############################################################################

.data
prompt: .asciiz "Enter Dividend (x): "
prompt2: .asciiz "Enter Divisor (y): "
res: .asciiz "The result of x/y is "
new: .asciiz "\n"
.text
li $v0, 4
la $a0, prompt
syscall
li $v0, 5
syscall

move $t0, $v0

li $v0, 4
la $a0, prompt2
syscall
li $v0, 5
syscall
teq $v0, $zero

move $t1, $v0

div $t0, $t1

li $v0, 4
la $a0, res
syscall
li $v0, 1
mflo $a0
syscall

.ktext 0x80000180
move $k0, $at
la $k1,_regs
sw $k0, 0($k1)
sw $v0, 4($k1)
sw $a0, 8($k1)
mfc0 $k0, $13 #cause reg
srl $k0, $k0,2
andi $k0, $k0, 31
bne $k0, 13, _else

li $v0, 4
la $a0, _msg
syscall
li $v0, 4
la $a0, new
syscall

mfc0 $k0, $14
addi $k0, $k0,-24 #go back to the line 
mtc0 $k0, $14

j _clean
_else:
mfc0 $k0, $14
addi $k0, $k0,4
mtc0 $k0, $14
_clean:
la $k1,_regs
lw $k0, 0($k1)
lw $v0, 4($k1)
lw $a0, 8($k1)

eret

.kdata
_msg: .asciiz "Divide By Zero Exception. Please enter a different value for y."
_regs: .word 0:3