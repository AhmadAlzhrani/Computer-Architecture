.data
m1: .asciiz "Enter n: "
m2: .asciiz "Enter string: "
m3: .asciiz "Enter e: "
m4: .asciiz "Encrypted string = "
.text
li $v0, 4
la $a0, m1
syscall
li $v0, 5
syscall
move $s0, $v0 #num of chara s0
addi $v0,$v0,1
move $a0, $v0
li $v0, 9
syscall
#step1

move $t0, $v0 # t0 addresss 
li $v0, 4
la $a0, m2
syscall
li $v0, 8
move $a0, $t0
addi $a1, $s0,1
syscall


li $v0, 4
la $a0, m3
syscall
li $v0, 5
syscall
move $s1, $v0
#done

li $t1, 0
loop:

beq $t1, $s0, endloop
addu $t0,$t0,$t1
lb $t2, 0($t0)


blt $t2, 0x41, notch
bgt $t2, 0x7A, notch
bgt $t2, 0x5A, small
ble $t2, 0x5A, cap
j notch

small:
blt $t2, 0x61, notch 
addu $t2, $t2, $s1
ble $t2, 0x7A, notch
subi $t2, $t2, 26
j notch
cap:
addu $t2, $t2, $s1
ble $t2, 0x5A, notch
subi $t2, $t2, 26

notch:
sb $t2, 0($t0)
subu $t0, $t0, $t1
addi $t1,$t1,1
j loop

endloop:
li $v0, 4
la $a0, m4
syscall
li $v0, 4
move $a0, $t0
syscall
