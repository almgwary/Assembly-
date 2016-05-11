#almgwary
#Lap3 Assimply 18-Oct

.data
first_num : .word 5
second_num : .word 10
sum : .word  0

.text
.globl main
.ent main
main :
	lw $t0 , first_num
	lw $t1 , second_num
	add $t3, $t1,$t0
	sw $t3,sum
	li $v0,10
	syscall
	


.end main