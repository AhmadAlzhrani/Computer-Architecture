ori 1, 1, 15		#R1 is the register that we want to count the number of 1's 
ori 2, 2, 1			#a value to and register R1 with to see if it's one or not 
ori 3, 3, 0 		#the counter for the loop 
ori 4, 4, 32 		#the range of the loop 
ori 5, 5, 0			#the number of 1's is in register R5 
count: 				#the start of the loop 
beq 3, 4, done	#check if we should contineu the loop or not 
and 7, 2, 1		#and R1 with 1 and put the value into register 7 
srli 1, 1, 1			#shift register R1 to the left by 1 

beq 7, 0, notOne 	#check whether the value of register R7 is Zero or not if zero this means that there's not 1 

addi 5, 5, 1 			#increament by 1 so that there's a 1 in the register 
notOne: 				#a lable to jump to 
addi 3, 3, 1 			#increament the loop counter by one 
jalr 0, 0, count		#a jump instruction to jump back to the loop 
done: 					#we are done 
sw 5, 0, 0				#store the number of 1's into the memroy in location Zero and do not do any OffsetS

lw 1, 0, 0				#load the number of ones into the memory back to register 1 from address Zero 