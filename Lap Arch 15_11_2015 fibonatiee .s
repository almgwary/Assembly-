.data

.text
.globl main
.ent main
main:


  li $v0,5
  syscall
  addi $s0,$v0,0
  
  addi $t0,$0,1
  
  addi $t1,$0,1
  
  addi $s1,$0,1
  
  whil :
  
  beq $s0 , $s1 , ex
  
  
  add $t2,$t0,$t1
  add $t0,$t1,$0
  add $t1,$t2,$0
  
  addi $s1,$s1,1
  
  j whil
  
  
 ex :
 
add $a0, $0 , $t2
li $v0 , 1
syscall

li $v0, 10
syscall

.end main