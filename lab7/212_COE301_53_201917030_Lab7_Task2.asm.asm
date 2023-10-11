.data
prompt: .asciiz "Enter n: "
result: .asciiz "fib("
result2: .asciiz ") = "
endl: .asciiz "\n"

.text

la $a0,prompt   
li $v0,4
syscall

li $v0,5    #read n
syscall

move $t2,$v0    


move $a0,$t2
move $v0,$t2
jal fib     # call fib
move $t3,$v0    


la $a0,result   
li $v0,4
syscall

move $a0,$t2    
li $v0,1
syscall

la $a0,result2  
li $v0,4
syscall

move $a0,$t3    
li $v0,1
syscall

la $a0,endl 
li $v0,4
syscall


li $v0,10
syscall

fib:
beqz $a0,zero   #check if n =1 or 0
beq $a0,1,one   

sub $sp,$sp,4  #allocating space in the stack
sw $ra,0($sp)
sub $a0,$a0,1  
 
jal fib     #calling fib

add $a0,$a0,1  #finding the number  fib(n-1)
lw $ra,0($sp)  
add $sp,$sp,4
sub $sp,$sp,4   
sw $v0,0($sp)
sub $sp,$sp,4   
sw $ra,0($sp)
sub $a0,$a0,2   

jal fib       #calling fib again

add $a0,$a0,2  #finding fib(n-2)
lw $ra,0($sp)  
add $sp,$sp,4
lw $s7,0($sp)   
add $sp,$sp,4
add $v0,$v0,$s7 
jr $ra 

zero:   #if the base is 0
li $v0,0
jr $ra
one:   #if the base is 1
li $v0,1
jr $ra

