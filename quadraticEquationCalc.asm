.data
a: .asciiz "Enter a: "
b: .asciiz "Enter b: "
c: .asciiz "Enter c: "
r2: .asciiz "there is two distinct real roots "
t2: .asciiz "there is two duplicate real roots "
i2: .asciiz "there is two distinct complex roots "
ands: .asciiz " and "

.text
li $v0, 4
la $a0,a                   #taking the argumints from the user
syscall
li $v0, 5
syscall
move $a0, $v0
move $t9,$v0

li $v0, 4
la $a0,b
syscall
li $v0, 5
syscall
move $a1,$v0

li $v0, 4
la $a0,c
syscall
li $v0, 5
syscall
move $a2, $v0

main:					#starting the main function 
mul $t0, $a1,$a1
mul $t1, $t9, $a2
sll $t1, $t1, 2
sub $t0, $t0, $t1
mul $t2, $a1, -1  ######### -b
sll $t3, $t9, 1   ######### 2a
mtc1 $t3, $f6					#setting the needed values 
cvt.s.w $f6, $f6
mtc1 $t2, $f7
cvt.s.w $f7, $f7


beqz $t0, dupReal #branching if discriminent = 0
bltz $t0, disComp  #branching if discriminent < 0


disReal:                        #finding the 2 distinct real roots
mtc1 $t0, $f10
cvt.s.w $f10, $f10
sqrt.s $f10,$f10
mtc1 $t2, $f4
cvt.s.w $f4, $f4
mtc1 $t3, $f5
cvt.s.w $f5,$f5
add.s $f0, $f10, $f4
div.s $f0, $f0, $f5
sub.s $f1, $f10, $f4
div.s $f1, $f1, $f5

la $t8, r2            		#deciding the type of the answer

j terminate

dupReal:                   # finding the 2 duplicate real roots
div.s $f0, $f7,$f6
mov.s $f1, $f0

la $t8, t2

j terminate

disComp:             # finding the 2 complex roots
div.s $f0, $f7,$f6
mov.s $f1, $f0

mtc1 $t0, $f11
cvt.s.w $f11,$f11
abs.s $f11,$f11
sqrt.s $f11,$f11
div.s $f11, $f11, $f6
mov.s $f2, $f11
mov.s $f3, $f11

la $t8, i2

terminate:            #returning and printing the results 

li $v0, 4
move $a0, $t8
syscall

li $v0, 2
mov.s $f12, $f0
syscall

li $v0, 11
li $a0,'+'
syscall

li $a0,'i'
syscall

li $v0, 2
mov.s $f12, $f2
syscall

li $v0, 4
la $a0, ands
syscall

li $v0, 2
mov.s $f12, $f1
syscall

li $v0, 11
li $a0,'-'
syscall

li $a0,'i'
syscall

li $v0, 2
mov.s $f12, $f3
syscall

move $a0, $t9

li $v0, 10
syscall