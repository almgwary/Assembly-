.data

.text
	main:
li $v0,5
  syscall
  addi $t0,$v0,0

  li $v0,5
  syscall
  addi $t1,$v0,0
  
  addi $t2,$0,0
  
  addi $t3,$0,1
  
whil :
beq $t1 , $t2 , ex
mul $t3,$t3,$t0
addi $t2 , $t2 , 1

	j whil

ex :
add $a0, $0 , $t3
li $v0 , 1
syscall
li $v0 , 10
syscall

