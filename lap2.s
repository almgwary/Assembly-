#almgwary
#Lap3 Assimply 18-Oct Task 2

.data

.text
.globl main
 
main :
	
	li $v0,5
	syscall
	addi $t1,$v0,0
	
	li $v0,5
	syscall
	addi $t2,$v0,0

	add $t3,$t1,$t2
	
	addi $a0,$t3,0
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	


.end main