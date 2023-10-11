.data
en1: .asciiz "Enter double x: "
en2: .asciiz "enter double y: "
res: .asciiz "The result is "
poi: .float 3.14

.text

li $v0, 4
la $a0, en1
syscall
 
li $v0, 6
syscall

mov.s $f1,$f0

li $v0, 4
la $a0, en2
syscall

li $v0, 6
syscall

mov.s $f2, $f0

div.s $f3,$f1,$f2
c.le.s $f3, $f30
bc1t pi
################
li $t0,8
mtc1 $t0, $f4
cvt.s.w $f4,$f4

mul.s $f4,$f4,$f3


sqrt.s $f4,$f4

j result

pi:
l.s $f4, poi
abs.s $f3,$f3
sqrt.s $f3,$f3
mul.s $f4,$f4,$f3

result:
li $v0,4
la $a0, res
syscall
li $v0,2
mov.s $f12, $f4
syscall