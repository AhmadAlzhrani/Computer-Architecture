.data 
ent: .asciiz "Enter grade "
two: .asciiz ": "
res: .asciiz "The average of the 12 grades is: "
.text
li $t0,0
loop:
beq $t0,12,endloop

li $v0, 4
la $a0,ent
syscall
li $v0, 1
move $a0, $t0
syscall
li $v0, 4
la $a0, two
syscall
li $v0, 6
syscall
add.s $f12,$f12,$f0

addi $t0,$t0,1

j loop

endloop:
mtc1 $t0,$f1
cvt.s.w $f1,$f1

div.s $f12,$f12,$f1
li $v0, 4
la $a0, res
syscall
li $v0, 2
syscall