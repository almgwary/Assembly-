#t0			array address
#t1			array limit = 12
#t2			newArray limit = 0 which increased 
#T3			newArray address 
#t4			loop iteration 
#t5			loop element 
#t6			inner loop iteration 
#t7			inner loop iteration 
#t8			inner loop iteration sums 
#t9			lood word
.data
array : .space 16
newArray : .space 16
.text
.globl main
  .ent main
  main:
  
  la $t0 ,array
  li $t1 ,8
  sw $t1 ,($t0)
  li $t1 ,6
  sw $t1 ,4($t0)
  li $t1 ,9
  sw $t1 ,8($t0)
  li $t1 ,9
  sw $t1 ,12($t0)
  
  addi $t1,$0,12
  addi $t2,$0,0
  addi $t4,$0,0
  
  la $t3 ,newArray
  
  whil:
  beq $t1 , $t4 , ex
  add $t0,$t4,$t0
  lw $t5 ,($t0)
  
  
		beq $t2,$0,plus
			addi $t7,$0,0
			beq $t7,$t2,plus
			
			add $t8,$t7,$t3
			lw $t9,($t8)
			beq $t9,$t5,cont
  
			addi $t7,$t7,4
  
  
  
  
  
  
		plus:
			add $t6,$t2,$t3
			sw $t5 ,($t6)
			addi $t2,$t2,4
						add $a0, $0 , $t5
						li $v0 , 1
						syscall
		cont:
  addi $t4,$t4,4
  j whil
  
  
  ex:
  li $v0,10
  syscall
  .end main