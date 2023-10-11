#############################################################################
#####################	Name: 	Ahmad Fahad Alzhrani	#####################
#####################	ID: 		201917030	#####################
#####################	Section: 	53		#####################
#####################	Lab: 		8		#####################
#####################	Task: 		2		#####################
##############################################################################
main:

li $t0, 0xffff0000 # Address of keyboard control register 
wait_keyboard: 
lw $t2, ($t0) # Read the keyboard control register 
andi $t2, $t2, 1 # Extract ready bit 
addiu $t1, $t1, 1 # wait_counter++ (counts iterations) 
beqz $t2, wait_keyboard # loop back while not ready
lw $a0, 4($t0) # Get character from keyboard

bgt $a0, 0x7A, notch
blt $a0, 0x41, notch
blt $a0, 0x5B, cap
bgt $a0, 0x61, small


notch:
j show

cap:
addi $a0, $a0, 32
j show

small:
subi $a0, $a0, 32

show:
li $t0, 0xffff0008 # Address of display control register 
wait_display: 
lw $t2, ($t0) # Read the display control register 
andi $t2, $t2, 1 # Extract ready bit 
beqz $t2, wait_display # loop back while not ready 
sw $a0, 4($t0) # Send character to display 

j main 